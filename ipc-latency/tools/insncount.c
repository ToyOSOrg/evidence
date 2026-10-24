/* Scratch profiling plugin: per-instruction execution counts between two
 * guest markers (cpuid with eax=0x50524f46 'PROF' starts, 0x444f4e45 'DONE'
 * dumps). Output: file given by out=<path>, lines "vaddr count disas". */
#include <glib.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <qemu-plugin.h>

QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;

typedef struct {
    uint64_t count;
    uint64_t base;
    size_t n;
    uint64_t *vaddr;
    char **disas;
} Block;

static GMutex lock;
static GPtrArray *blocks;
static const char *out_path = "/tmp/insncount.txt";
static int phase; /* 0 idle, 1 counting */
static int seq;
static struct qemu_plugin_register *rax;
static int have_rax;
static uint64_t start_ns;
static struct qemu_plugin_scoreboard *sb;
static qemu_plugin_u64 since;
static struct qemu_plugin_register *r_rip, *r_rbp;
static int have_sr;
static FILE *stacks;
static uint64_t period = 997;
static const char *stack_path = "/tmp/insnstacks.txt";

static void find_sr(void) {
    GArray *regs = qemu_plugin_get_registers();
    for (guint i = 0; i < regs->len; i++) {
        qemu_plugin_reg_descriptor *d = &g_array_index(regs, qemu_plugin_reg_descriptor, i);
        if (!strcmp(d->name, "rip")) r_rip = d->handle;
        if (!strcmp(d->name, "rbp")) r_rbp = d->handle;
    }
    have_sr = 1;
    g_array_free(regs, TRUE);
}

static uint64_t rd(struct qemu_plugin_register *r) {
    GByteArray *buf = g_byte_array_new();
    qemu_plugin_read_register(r, buf);
    uint64_t v = 0;
    memcpy(&v, buf->data, buf->len < 8 ? buf->len : 8);
    g_byte_array_free(buf, TRUE);
    return v;
}

static void sample(unsigned int vcpu, void *udata) {
    qemu_plugin_u64_set(since, vcpu, 0);
    if (phase != 1) return;
    if (!have_sr) find_sr();
    uint64_t pc = rd(r_rip), bp = rd(r_rbp);
    char line[1024]; int n = snprintf(line, sizeof line, "%u %" PRIx64, vcpu, pc);
    if ((pc >> 48) == 0xffff) {
        for (int d = 0; d < 40 && (bp >> 48) == 0xffff; d++) {
            GByteArray *buf = g_byte_array_new();
            if (!qemu_plugin_read_memory_vaddr(bp, buf, 16)) { g_byte_array_free(buf, TRUE); break; }
            uint64_t nbp, ret; memcpy(&nbp, buf->data, 8); memcpy(&ret, buf->data + 8, 8);
            g_byte_array_free(buf, TRUE);
            if ((ret >> 48) != 0xffff) break;
            n += snprintf(line + n, sizeof line - n, " %" PRIx64, ret);
            if (nbp <= bp) break;
            bp = nbp;
            if (n > 900) break;
        }
    }
    g_mutex_lock(&lock);
    if (stacks) fprintf(stacks, "%s\n", line);
    g_mutex_unlock(&lock);
}

static void tb_exec(unsigned int vcpu, void *udata) {
    Block *b = udata;
    __atomic_fetch_add(&b->count, 1, __ATOMIC_RELAXED);
}

static void find_rax(void) {
    GArray *regs = qemu_plugin_get_registers();
    for (guint i = 0; i < regs->len; i++) {
        qemu_plugin_reg_descriptor *d = &g_array_index(regs, qemu_plugin_reg_descriptor, i);
        if (!strcmp(d->name, "rax")) { rax = d->handle; have_rax = 1; break; }
    }
    g_array_free(regs, TRUE);
}

static void dump(void) {
    char path[512]; snprintf(path, sizeof path, "%s.%d", out_path, seq);
    FILE *f = fopen(path, "w");
    if (!f) return;
    for (guint i = 0; i < blocks->len; i++) {
        Block *b = g_ptr_array_index(blocks, i);
        uint64_t d = b->count - b->base;
        if (!d) continue;
        for (size_t k = 0; k < b->n; k++)
            fprintf(f, "%" PRIx64 " %" PRIu64 " %s\n", b->vaddr[k], d, b->disas[k]);
    }
    fclose(f);
}

static void marker(unsigned int vcpu, void *udata) {
    if (!have_rax) find_rax();
    static int warned;
    if (!have_rax) { if (!warned++) fprintf(stderr, "insncount: no rax\n"); return; }
    GByteArray *buf = g_byte_array_new();
    qemu_plugin_read_register(rax, buf);
    uint32_t v = 0;
    memcpy(&v, buf->data, 4);
    if ((v >> 16) == 0x5052 || (v>>16) == 0x444f) fprintf(stderr, "insncount: marker %x\n", v);
    g_byte_array_free(buf, TRUE);
    g_mutex_lock(&lock);
    if (v == 0x50524f46 && phase == 0) {
        for (guint i = 0; i < blocks->len; i++) {
            Block *b = g_ptr_array_index(blocks, i);
            b->base = __atomic_load_n(&b->count, __ATOMIC_RELAXED);
        }
        phase = 1;
        { char path[512]; snprintf(path, sizeof path, "%s.%d", stack_path, seq); stacks = fopen(path, "w"); }
        fprintf(stderr, "insncount: start on vcpu %u\n", vcpu);
    } else if (v == 0x444f4e45 && phase == 1) {
        dump();
        phase = 0;
        seq++;
        if (stacks) fclose(stacks);
        stacks = NULL;
        fprintf(stderr, "insncount: dumped to %s\n", out_path);
    }
    g_mutex_unlock(&lock);
}

static void tb_trans(struct qemu_plugin_tb *tb, void *ud) {
    size_t n = qemu_plugin_tb_n_insns(tb);
    Block *b = g_new0(Block, 1);
    b->n = n;
    b->vaddr = g_new(uint64_t, n);
    b->disas = g_new(char *, n);
    for (size_t i = 0; i < n; i++) {
        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
        b->vaddr[i] = qemu_plugin_insn_vaddr(insn);
        b->disas[i] = qemu_plugin_insn_disas(insn);
        uint8_t bytes[16];
        size_t len = qemu_plugin_insn_data(insn, bytes, sizeof bytes);
        if (len >= 2 && bytes[0] == 0x0f && bytes[1] == 0xa2)
            qemu_plugin_register_vcpu_insn_exec_cb(insn, marker, QEMU_PLUGIN_CB_R_REGS, NULL);
    }
    g_mutex_lock(&lock);
    if (phase == 1) b->base = 0;
    g_ptr_array_add(blocks, b);
    g_mutex_unlock(&lock);
    qemu_plugin_register_vcpu_tb_exec_cb(tb, tb_exec, QEMU_PLUGIN_CB_NO_REGS, b);
    qemu_plugin_register_vcpu_tb_exec_inline_per_vcpu(tb, QEMU_PLUGIN_INLINE_ADD_U64, since, n);
    qemu_plugin_register_vcpu_tb_exec_cond_cb(tb, sample, QEMU_PLUGIN_CB_R_REGS, QEMU_PLUGIN_COND_GE, since, period, NULL);
}

QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info, int argc, char **argv) {
    for (int i = 0; i < argc; i++)
        if (!strncmp(argv[i], "out=", 4)) out_path = g_strdup(argv[i] + 4);
        else if (!strncmp(argv[i], "stacks=", 7)) stack_path = g_strdup(argv[i] + 7);
        else if (!strncmp(argv[i], "period=", 7)) period = strtoull(argv[i] + 7, NULL, 0);
    blocks = g_ptr_array_new();
    sb = qemu_plugin_scoreboard_new(sizeof(uint64_t));
    since = qemu_plugin_scoreboard_u64(sb);
    qemu_plugin_register_vcpu_tb_trans_cb(id, tb_trans, NULL);
    return 0;
}
