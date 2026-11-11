# input: "<lines> <path relative to kernel/src>"; first matching rule wins
function area(p) {
  if (p ~ /^(actuator\.rs|syscall\/debug\.rs|log\/storm\.rs|iommu\/testdev\.rs|arch\/.*\/selftest\.rs)$/) return "T test-only";
  if (p ~ /^(iommu\/|arch\/x86_64\/(vtd|amdvi)\/|arch\/x86_64\/iommu_unit\.rs|arch\/aarch64\/smmu\/)/) return "I iommu";
  if (p ~ /^(pcidev\/.*|drivers\/pci\.rs|isa\.rs|device\.rs|drivers\/gop\.rs|object\/(device|devset)\.rs|syscall\/device\.rs|inventory\.rs|arch\/.*\/(pio|opregion)\.rs|arch\/x86_64\/idt\/(isa|user_dev|device_irq)\.rs)$/) return "J claims";
  if (p ~ /^(drivers\/acpi\.rs|arch\/.*\/(acpi_mode|power|psci)\.rs|arch\/x86_64\/smi_cmd\.rs|power\.rs|quiesce\.rs|panic_reboot\.rs|syscall\/machine\.rs|loaded\.rs)$/) return "K firmware+stop";
  if (p ~ /^(clock\.rs|time\.rs|arch\/.*\/(clocksource|rtc)\.rs|arch\/x86_64\/idt\/rtc\.rs)$/) return "L clocks";
  if (p ~ /^(log\/|drivers\/(serial|serial_lock)\.rs|drivers\/panic_console\/|arch\/.*\/console_uart\.rs|panic\.rs|symbols\.rs|drivers\/mod\.rs)/) return "M log+console+panic";
  if (p ~ /^(trace\.rs|counters\.rs|arch\/.*\/(counters|pmu|watchdog)\.rs|irq_census\.rs|census\.rs|windows\.rs|hardlockup\/|deadline\.rs|arch\/x86_64\/idt\/nmi\.rs)/) return "N diagnostics+bounds";
  if (p ~ /^(object\/paged\.rs|syscall\/paged\.rs)$/) return "F paged";
  if (p ~ /^(mm\/|arch\/.*\/(paging|tlb|uaccess|copy|cache|barrier|mtrr|pat)\.rs|tlb_tags\.rs|shootdown\.rs|invalidation\.rs|user_ptr\.rs|syscall\/vm\.rs|object\/shm\.rs|arch\/x86_64\/idt\/tlb\.rs)/) return "D memory";
  if (p ~ /^(sched\/|scheduler\.rs|preempt\.rs|hw\.rs|idle\.rs|arch\/.*\/(hw|idle|switch)\.rs|object\/(wake_latency|job)\.rs|arch\/x86_64\/idt\/(timer|kick)\.rs)/) return "C scheduling";
  if (p ~ /^(process\.rs|loader\/|syscall\/proc\.rs|object\/(process|notice|releases)\.rs|bootimage\.rs)/) return "G processes+spawn";
  if (p ~ /^(object\/|pipe\.rs|message\.rs|frame_bytes\.rs|inbox\/|watch\.rs|syscall\/(ipc|io|event|handles)\.rs)/) return "E objects+ipc";
  if (p ~ /^(syscall\/(dispatch|mod)\.rs|arch\/x86_64\/syscall\.rs)$/) return "H syscall boundary";
  if (p ~ /^(arch\/x86_64\/(apic|ioapic)\.rs|arch\/x86_64\/idt\/|arch\/aarch64\/(irqchip|trap).*)/) return "B interrupts+traps";
  if (p ~ /^(sync\.rs|seqlock\.rs|hasher\.rs|random\.rs|arch\/.*\/entropy\.rs)$/) return "R support";
  if (p ~ /^(arch\/|smp\.rs|smp_roster\.rs|cpu_local\.rs|cpu_slice\.rs|main\.rs|params\.rs)/) return "A cpu+boot";
  return "? " p;
}
{ a=area($2); s[a]+=$1; c[a]++; print a "\t" $1 "\t" $2 > "/dev/stderr" }
END { for (k in s) print k "\t" c[k] "\t" s[k] }
