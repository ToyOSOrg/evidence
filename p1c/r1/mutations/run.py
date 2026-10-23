import subprocess, sys, os
W='<work>/toyos-proc-session'
D=os.path.dirname(os.path.abspath(__file__))
L='system/supervisor/lifecycle/src/stop.rs'
A='system/acpiserver/src/main.rs'
O='system/session/src/lib.rs'
M=[
 ('m08-second-press-waits', A, """            match self.kernel.terminate() {
                Ok(()) => return,""", """            match Err::<(), Refused>(Refused::NoStopPending) {
                Ok(()) => return,""", 'acpiserver', 'tests::a_press_while_the_stop_waits_forces_it'),
 ('m09-wait-forces-after-reports', L, """            State::Pending { .. } => vec![Act::Report],
        }""", """            State::Pending { .. } => {
                let mut acts = self.kill();
                acts.push(Act::Report);
                acts
            }
        }""", 'toyos-supervisor', 'stop::tests::a_waiting_stop_asks_and_waits_and_never_kills'),
 ('m10-terminate-waits-for-apps', L, """                    Mode::Terminate => self.kill(),
                };""", """                    Mode::Terminate => vec![Act::AskSessions],
                };""", 'toyos-supervisor', 'stop::tests::a_terminating_stop_kills_at_once'),
 ('m13-wait-answered-only-at-the-stop', L, """                acts.extend(self.sessions(open));
                (Ok(ticket), acts)""", """                acts.extend(self.sessions(open));
                (if open == 0 { Ok(ticket) } else { Err(Refused::Unanswered) }, acts)""", 'toyos-supervisor', 'stop::tests::a_waiting_stop_asks_and_waits_and_never_kills'),
 ('m14-cancel-ignored', L, """            State::Pending { killing: false, .. } => {
                self.state = State::Idle;
                (Ok(()), vec![Act::CancelSessions, Act::Cancelled])
            }""", """            State::Pending { killing: false, .. } => (Ok(()), Vec::new()),""", 'toyos-supervisor', 'stop::tests::a_cancel_keeps_the_machine_running_until_killing_begins'),
 ('m15-other-kind-replaces', L, """            State::Pending { stop, .. } if stop != asked.stop => (Err(Refused::AnotherStopPending(stop)), Vec::new()),""", """            State::Pending { stop, ticket, .. } if stop != asked.stop => {
                self.state = State::Pending { stop: asked.stop, ticket, killing: false };
                (Ok(ticket), Vec::new())
            }""", 'toyos-supervisor', 'stop::tests::a_second_request_joins_forces_or_is_refused'),
 ('m16-unsent-outcome-dropped', L, """        match self.frame.is_none() && send(msg, &payload) {
            true => self.done = outcome,
            false => self.frame = Some(Frame { msg, payload, outcome }),
        }""", """        let _ = (send(msg, &payload), outcome);""", 'toyos-supervisor', 'stop::tests::a_slow_watcher_still_receives_the_outcome'),
 ('m17-terminate-ignores-its-ticket', L, """if of.is_none_or(|of| of == ticket) =>""", """if of.is_none_or(|_| ticket != 0) =>""", 'toyos-supervisor', 'stop::tests::a_terminate_of_a_stop_forces_no_later_one'),
 ('m18-a-control-cancels-the-stop', O, """        match (std::mem::take(&mut self.asked), self.stopping) {
            (true, false) => vec![Act::Cancelled],""", """        match (std::mem::take(&mut self.asked) | std::mem::take(&mut self.stopping), false) {
            (true, false) => vec![Act::Cancelled],""", 'session', 'tests::only_the_stops_own_cancel_ends_its_sign_out'),
 ('m19-the-stops-cancel-ends-a-controls-sign-out', O, """            true => vec![Act::Stopping(false), self.report()],""", """            true => {
                self.asked = false;
                vec![Act::Cancelled]
            }""", 'session', 'tests::only_the_stops_own_cancel_ends_its_sign_out'),
 ('m20-a-done-watcher-is-sent-more', L, """        if self.done || self.frame.as_ref().is_some_and(|owed| owed.outcome) {""", """        if self.frame.as_ref().is_some_and(|owed| owed.outcome) {""", 'toyos-supervisor', 'stop::tests::a_slow_watcher_still_receives_the_outcome'),
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
        r=subprocess.run(['cargo','test','-p',pkg,'--',test.split('::')[-1]],cwd=W,stdout=out,stderr=subprocess.STDOUT)
    subprocess.run(['patch','-p1','-R','-s','-i',patch],cwd=W,check=True)
    assert open(path).read()==orig, name+': not restored'
    text=open(log).read()
    built = 'running ' in text and 'error[E' not in text
    red = ('test '+test+' ... FAILED') in text
    print(f"{name}: exit={r.returncode} built={built} red_by_name={red} restored=yes")
