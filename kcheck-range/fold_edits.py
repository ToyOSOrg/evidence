"""Text edits for the history rewrite of #1252, applied to a worktree at one commit.
argv: <worktree> <early: 1 if before the dropped user_str commit, else 0>"""
import re
import sys

root, early = sys.argv[1], sys.argv[2] == "1"


def edit(rel, fn):
    p = f"{root}/{rel}"
    try:
        s = open(p).read()
    except FileNotFoundError:
        return
    t = fn(s)
    if t != s:
        open(p, "w").write(t)


# B1: the clause the first commit removed, which the rebase brought back.
edit("kernel/src/process.rs", lambda s: s.replace(
    "/// Every kernel object it can name; stdio is handles `0`, `1`, `2`.",
    "/// Every kernel object it can name."))


# S1: a session reaches its service through a connector, not a name.
def s1(s):
    s = s.replace("//! caller decides when to [`Session::reconnect`], which reaches the service\n"
                  "//! through the same name, opens the same partition,",
                  "//! caller decides when to [`Session::reconnect`], which reaches the service\n"
                  "//! through the same connector, opens the same partition,")
    s = s.replace("    /// Open the same partition through the same name over a fresh region,",
                  "    /// Open the same partition through the same connector over a fresh region,")
    s = s.replace("    /// Blocks until the service answers, within [`wire::ANSWER_BOUND_NS`]: a\n"
                  "    /// name whose server is being restarted queues the connection until the\n"
                  "    /// new one accepts it.",
                  "    /// Blocks until the service answers, within [`wire::ANSWER_BOUND_NS`]: a\n"
                  "    /// connector whose server is being restarted queues the connection until\n"
                  "    /// the new one accepts it.")
    return s


edit("system/diskserver/src/session.rs", s1)

if early:
    # The dropped commit's record edit: the charge's bullet goes with `user_str`.
    edit("issues/the-kernel-is-small-interrupts-post-and-threads-wait.md", lambda s: re.sub(
        r"- `KernelStack::heap` \(`kernel/src/loader/start.rs`\) charges every thread\n"
        r"  one string at 64 KiB and two pages: a spawn's path, which nothing bounds\n"
        r"  below 64 KiB, is the last call that copies one \(#(?:ENDOWPR|1252)\)\.\n", "", s))
