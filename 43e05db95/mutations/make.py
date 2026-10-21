import subprocess, sys
root='~/Dev/jan/toyos-sched-model'
M=sys.argv[1]
js='kernel/pure/sched/job_sched.rs'; ev='kernel/pure/sched/eevdf.rs'
muts=[
 ('m08-grant-clears-demotion', js, '''        self.thread_mut(id).granted = true;
''', '''        self.thread_mut(id).granted = true;
        self.thread_mut(id).demoted_until = Nanos::ZERO;
        self.thread_mut(id).unblocked_rt = 0;
'''),
 ('m09-strikes-reset-by-grant', js, '''        self.thread_mut(id).granted = true;
''', '''        self.thread_mut(id).granted = true;
        self.job_mut(job).rt.strikes = 0;
'''),
 ('m12-band-move-leaves-a-copy', js, '''            while let Some(&id) = self.cpus[c].rt.front() {
                self.rt_leave(cpu, id);''', '''            while let Some(&id) = self.cpus[c].rt.front() {
                self.cpus[c].rt.pop_front();
                self.cpus[c].spare.push_back(id);
                self.thread_mut(id).state = State::Blocked;'''),
 ('m13-group-lag-not-carried', js, '''        let carried = core::mem::take(&mut self.thread_mut(id).group_lag);''', '''        let _ = core::mem::take(&mut self.thread_mut(id).group_lag);
        let carried = Lag::ZERO;'''),
 ('s01-groups-never-charged', js, '''                self.cpus[c].groups.charge(job, ns);
''', ''),
 ('s03-threads-never-charged', js, '''                self.cpus[c].members[i].threads.charge(tid, ns);
''', '''                let _ = i;
'''),
 ('d01-no-eligibility-decision', js, '''                    if let Some(ns) = c.groups.overtaken_in(job) {
                        at(c.charged.after(ns).max(run.since.after(self.params.min_slice)));
                    }
''', ''),
 ('d02-overtaken-in-rounds-down', ev, '''                ((behind.max(0) + (1 << VSHIFT) - 1) >> VSHIFT) as u64''', '''                (behind.max(0) >> VSHIFT) as u64'''),
 ('d03-overtaking-ignores-min-slice', js, '''                        at(c.charged.after(ns).max(run.since.after(self.params.min_slice)));''', '''                        at(c.charged.after(ns));'''),
]
for name, f, a, b in muts:
    p=f'{root}/{f}'
    s=open(p).read()
    assert s.count(a)==1, name
    open(p,'w').write(s.replace(a,b))
    d=subprocess.run(['git','-C',root,'diff'],capture_output=True,text=True).stdout
    open(f'{M}/{name}.patch','w').write(d)
    subprocess.run(['git','-C',root,'checkout','--',f],check=True)
