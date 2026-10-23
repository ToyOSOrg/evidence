import subprocess, sys, os, shutil
W='<work>/toyos-proc-session'
D='<tmp>/scratchpad/agents/proc/p1c/mutations'
L='system/supervisor/lifecycle/src/stop.rs'
A='system/acpiserver/src/main.rs'
M=[
 ('m08-second-press-waits', A, """            match self.kernel.terminate() {
                Ok(()) => return,""", """            match Err::<(), Refused>(Refused::NoStopPending) {
                Ok(()) => return,""", 'acpiserver', 'a_press_while_the_stop_waits_forces_it'),
 ('m09-wait-forces-after-reports', L, """            State::Pending { .. } => vec![Act::Report],
        }""", """            State::Pending { .. } => {
                let mut acts = self.kill();
                acts.push(Act::Report);
                acts
            }
        }""", 'toyos-supervisor', 'a_waiting_stop_asks_and_waits_and_never_kills'),
 ('m10-terminate-waits-for-apps', L, """                if asked.mode == Mode::Terminate {
                    acts.extend(self.kill());
                }""", """                if asked.mode == Mode::Terminate && open == 0 {
                    acts.extend(self.kill());
                }""", 'toyos-supervisor', 'a_terminating_stop_kills_at_once'),
 ('m13-wait-answered-only-at-the-stop', L, """                acts.extend(self.sessions(open));
                (Ok(()), acts)""", """                acts.extend(self.sessions(open));
                (if open == 0 { Ok(()) } else { Err(Refused::Unanswered) }, acts)""", 'toyos-supervisor', 'a_waiting_stop_asks_and_waits_and_never_kills'),
 ('m14-cancel-ignored', L, """            State::Pending { killing: false, .. } => {
                self.state = State::Idle;
                (Ok(()), vec![Act::CancelSessions, Act::Cancelled])
            }""", """            State::Pending { killing: false, .. } => (Ok(()), Vec::new()),""", 'toyos-supervisor', 'a_cancel_keeps_the_machine_running_until_killing_begins'),
 ('m15-other-kind-replaces', L, """            State::Pending { stop, .. } if stop != asked.stop => (Err(Refused::AnotherStopPending(stop)), Vec::new()),""", """            State::Pending { stop, .. } if stop != asked.stop => {
                self.state = State::Pending { stop: asked.stop, killing: false };
                (Ok(()), Vec::new())
            }""", 'toyos-supervisor', 'a_second_request_joins_forces_or_is_refused'),
 ('m16-unsent-outcome-dropped', L, """        match self.frame.is_none() && send(msg, &payload) {
            true => {}
            false => self.frame = Some((msg, payload, outcome)),
        }""", """        let _ = (send(msg, &payload), outcome);""", 'toyos-supervisor', 'a_slow_watcher_still_receives_the_outcome'),
]
only = sys.argv[1:]
for name, f, old, new, pkg, test in M:
    if only and name not in only: continue
    path=os.path.join(W,f); orig=open(path).read()
    assert orig.count(old)==1, name
    mut=os.path.join(D,'mutated.tmp'); open(mut,'w').write(orig.replace(old,new))
    patch=os.path.join(D,name+'.patch')
    with open(patch,'w') as p:
        subprocess.run(['diff','-u','--label','a/'+f,'--label','b/'+f,path,mut],stdout=p)
    os.remove(mut)
    subprocess.run(['patch','-p1','--dry-run','-s','-i',patch],cwd=W,check=True)
    subprocess.run(['patch','-p1','-s','-i',patch],cwd=W,check=True)
    log=os.path.join(D,name+'.log')
    with open(log,'w') as out:
        r=subprocess.run(['cargo','test','-p',pkg,'--',test],cwd=W,stdout=out,stderr=subprocess.STDOUT)
    subprocess.run(['patch','-p1','-R','-s','-i',patch],cwd=W,check=True)
    assert open(path).read()==orig, name+': not restored'
    text=open(log).read()
    built = 'running ' in text and 'error[E' not in text
    red = ('test '+('tests::' if pkg=='acpiserver' else 'stop::tests::')+test+' ... FAILED') in text
    print(f"{name}: exit={r.returncode} built={built} red_by_name={red} restored=yes")
