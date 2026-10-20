import subprocess, sys
root='~/Dev/jan/toyos-sched-model'
out=sys.argv[1]
def mut(name, path, a, b):
    p=f'{root}/{path}'
    s=open(p).read()
    assert s.count(a)==1, (name, s.count(a))
    open(p,'w').write(s.replace(a,b))
    d=subprocess.run(['git','-C',root,'diff'],capture_output=True,text=True).stdout
    open(f'{out}/{name}.patch','w').write(d)
    subprocess.run(['git','-C',root,'checkout','--',path],check=True)
J='kernel/pure/sched/job_sched.rs'; E='kernel/pure/sched/eevdf.rs'; R='kernel/pure/sched/rt.rs'
mut('m01-pick-ignores-eligibility',E,
 '            .filter(|e| mul(self.total, e.v - self.base) <= self.sum)\n            .min_by_key(|e| (e.vd, e.seq));',
 '            .min_by_key(|e| (e.vd, e.seq));')
mut('m02-lag-not-carried',J,
 '''        let left = self.thread_mut(id).left.take();
        let threads = &mut self.cpus[c].members[i].threads;''',
 '''        let left: Option<Left> = None;
        self.thread_mut(id).left = None;
        let threads = &mut self.cpus[c].members[i].threads;''')
mut('m03-weights-never-refreshed',J,
 '''        for &job in &jobs {
            let w = self.group_weight(cpu, job);
            self.cpus[c].groups.reweight(job, w);
        }''',
 '''        for &job in jobs.iter().take(0) {
            let w = self.group_weight(cpu, job);
            self.cpus[c].groups.reweight(job, w);
        }''')
mut('m04-demotion-does-not-travel',J,
 '        t.granted && t.demoted_until <= now && !self.cpus[cpu.0 as usize].allowance.exhausted()',
 '        t.granted && !self.cpus[cpu.0 as usize].allowance.exhausted()')
mut('m05-allowance-banks',R,
 '        self.remaining = self.remaining.min(0).saturating_add(refill).min(self.budget as i64);',
 '        self.remaining = self.remaining.saturating_add(refill);')
mut('m06-overrun-forgiven',R,
 '        self.remaining = self.remaining.min(0).saturating_add(refill).min(self.budget as i64);',
 '        self.remaining = self.budget as i64;')
mut('m07-weight-not-split',J,
 '        let w = (self.job(job).weight as u128 * here / all) as u64;',
 '        let w = (self.job(job).weight as u128 * here / here.max(all / all)) as u64;')
mut('m08-grant-clears-demotion',J,
 '''        self.thread_mut(id).granted = true;
        if let State::Queued''',
 '''        self.thread_mut(id).granted = true;
        self.thread_mut(id).demoted_until = Nanos::ZERO;
        self.thread_mut(id).unblocked_rt = 0;
        if let State::Queued''')
mut('m09-strikes-reset-by-grant',J,
 '''        self.thread_mut(id).granted = true;
        if let State::Queued''',
 '''        self.thread_mut(id).granted = true;
        self.job_mut(job).rt.strikes = 0;
        if let State::Queued''')
mut('m10-reused-slot-same-identity',J,
 '''            Some(i) => {
                self.threads[i].0 += 1;
                self.threads[i].1 = Some(thread);''',
 '''            Some(i) => {
                self.threads[i].1 = Some(thread);''')
mut('m11-wake-ignores-minimum-run',J,
 '''        let at = since.after(self.params.min_slice);
        if at <= now {''',
 '''        let at = since.after(self.params.min_slice);
        if at <= now || true {''')
mut('m13-group-lag-not-carried',J,
 '                self.cpus[c].groups.join(job, 1, slice, carried);',
 '                let _ = carried;\n                self.cpus[c].groups.join(job, 1, slice, Lag::ZERO);')
mut('n01-no-cross-cpu-ordering',J,
 '''        if self.params.cross_cpu_lag {
            self.order_by_service(cpu, &jobs);''',
 '''        if self.params.cross_cpu_lag && jobs.is_empty() {
            self.order_by_service(cpu, &jobs);''')
mut('n02-no-fairness-moves',J,
 '''    pub fn fairness_move(&mut self, cpu: CpuId, partners: &[CpuId]) -> Option<Move> {
        let mut best: Option<(i64, Move)> = None;''',
 '''    pub fn fairness_move(&mut self, cpu: CpuId, partners: &[CpuId]) -> Option<Move> {
        let mut best: Option<(i64, Move)> = None;
        let partners = &partners[..0];''')

mut('m12-band-move-leaves-a-copy',J,
 """                self.thread_mut(id).granted = false;
                self.leave(cpu, id);
                self.fair_enter(cpu, id);""",
 """                self.thread_mut(id).granted = false;
                self.thread_mut(id).state = State::Blocked;
                self.fair_enter(cpu, id);""")
mut('n04-moves-between-jobs-sharing-a-cpu',J,
 "            let apart = loss.iter().all(|&(job, _)| !self.share_a_cpu(job, behind_job));",
 "            let apart = loss.iter().all(|&(job, _)| true || !self.share_a_cpu(job, behind_job));")
mut('n06-moves-take-from-anyone',J,
 "            (gap > self.params.move_lead as i64 && apart).then_some(gap)",
 "            (gap > i64::MIN && apart).then_some(gap)")
mut('r01-no-standing-restore',J,
 "        if pending.is_empty() || jobs.len() < 2 {",
 "        if true || pending.is_empty() || jobs.len() < 2 {")
mut('r02-lone-job-loses-its-standing',J,
 "        if pending.is_empty() || jobs.len() < 2 {",
 "        if pending.is_empty() {")
mut('r03-standing-on-every-leave',J,
 """        self.thread_mut(id).left = Some(left);
        self.job_mut(job).runnable -= 1;""",
 """        self.thread_mut(id).left = Some(left);
        self.job_mut(job).runnable -= 1;
        if self.job(job).runnable == 0 && self.job(job).standing.is_none() {
            let standing = self.standing_on(c, job).unwrap_or(0);
            self.job_mut(job).standing = Some(standing);
        }""")
mut('r04-demoted-workers-compete-as-ordinary',J,
 """            t.demoted_until = t.demoted_until.max(allowance.boundary());
        }
        self.spare_enter(cpu, id);""",
 """            t.demoted_until = t.demoted_until.max(allowance.boundary());
        }
        self.fair_enter(cpu, id);""")
mut('r05-spare-time-counts-as-service',J,
 "            Band::Spare => self.thread_mut(tid).spare_ns += ns,",
 """            Band::Spare => {
                self.thread_mut(tid).spare_ns += ns;
                let j = self.job_mut(job);
                j.served = j.served.wrapping_add(ns);
            }""")
mut('r06-exhausted-decides-a-ns-later',J,
 "                    at(c.charged.after(c.allowance.remaining()));",
 "                    at(c.charged.after(c.allowance.remaining().max(1)));")
mut('r07-no-pair-clamp',J,
 """        let Some(&first) = jobs.first() else { return };
        self.restore_standings(&jobs);""",
 """        let Some(&first) = jobs.first() else { return };
        self.restore_standings(&jobs);
        if jobs.len() < usize::MAX { return; }""")
