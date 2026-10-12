# Writes one checked patch per mutation, made against the worktree's HEAD and
# restored at once; the worktree is left as it was found.
import subprocess, sys, json, os
WT='<home>/Dev/jan/toyos-dnscache'
OUT=os.path.dirname(os.path.abspath(__file__))
DNS='system/netstack/dns/src/lib.rs'
LEASE='system/netstack/node/src/lease.rs'
RESOLVE='system/netstack/node/src/resolve.rs'
M=[
 ('m01-view-ignored', 'the cache keyed by name alone, ignoring the view',
  [(DNS,'''        let at = self.views.iter().position(|kept| kept.key == view)?;''','''        let at = self.views.iter().position(|_| true)?;'''),
   (DNS,'''        let mut kept = match self.views.iter().position(|kept| kept.key == view) {''','''        let mut kept = match self.views.iter().position(|_| true) {''')],
  [('-p','toyos-dns','a_view_is_never_answered_from_another_views_entry'),('-p','toyos-net-node --test resolve','the_same_name_for_another_view_sends_its_own_query')]),
 ('m02-largest-ttl', 'the least TTL taken as the largest',
  [(DNS,'''    let mut least = chain.iter().map(|(_, ttl)| *ttl).min();''','''    let mut least = chain.iter().map(|(_, ttl)| *ttl).max();'''),
   (DNS,'''        least = Some(least.map_or(*ttl, |least| least.min(*ttl)));''','''        least = Some(least.map_or(*ttl, |least| least.max(*ttl)));''')],
  [('-p','toyos-dns','rfc2181_5_2_an_answer_is_kept_for_the_least_ttl_of_its_aliases_and_its_differing_addresses')]),
 ('m03-last-send', "every reply's TTLs counted from the last query's send",
  [(DNS,'''            self.free(to, now + WAIT_MS);
            self.asked += 1;''','''            self.free(to, now + WAIT_MS);
            self.began = now;
            self.asked += 1;''')],
  [('-p','toyos-dns','every_ttl_counts_from_the_first_querys_send_across_an_alias_asked_again'),('-p','toyos-dns','every_ttl_counts_from_the_first_querys_send_across_a_query_sent_again')]),
 ('m04-setter-keeps', 'the emptying taken out of the lease setter',
  [(LEASE,'''            self.state = state;
            self.answers.empty();''','''            self.state = state;''')],
  [('-p','toyos-net-node --test resolve','a_lease_lost_and_another_naming_the_same_resolver_empty_what_every_view_keeps'),('-p','toyos-net-node --test resolve','a_renewal_with_the_same_terms_empties_what_every_view_keeps')]),
 ('m05-link-keeps', 'the emptying taken out of Stack::link',
  [(LEASE,'''        if !up {
            self.network.answers().empty();
        }''','''''')],
  [('-p','toyos-net-node --test resolve','a_link_that_goes_down_empties_what_every_view_keeps_though_the_lease_stays')]),
 ('m06-no-generation', 'the generation check taken out of the keep',
  [(DNS,'''        if started != self.generation() {
            return;
        }''','''        let _ = started;''')],
  [('-p','toyos-dns','the_answer_of_a_lookup_started_before_an_emptying_is_not_kept'),('-p','toyos-net-node --test resolve','a_lookup_in_flight_as_the_link_goes_down_is_answered_and_keeps_nothing')]),
 ('m07-no-expired-view-first', 'the expired view no longer preferred over the least recently used one',
  [(DNS,'''                    self.views.remove(spent.unwrap_or(0));''','''                    let _ = spent;
                    self.views.remove(0);''')],
  [('-p','toyos-dns','a_new_view_replaces_one_whose_entries_have_all_expired_before_a_live_one')]),
 ('m08-alias-target-kept', 'an alias target kept under its own name',
  [(DNS,'''    /// When the lookup must be woken if no datagram arrives first.
    pub fn due(&self) -> u64 {''','''    pub fn now_asking(&self) -> &Name {
        &self.name
    }

    /// When the lookup must be woken if no datagram arrives first.
    pub fn due(&self) -> u64 {'''),
   (RESOLVE,'''                stack.answers().keep(&asking.view, &asking.name, asking.generation, answer, asking.lookup.keep_until(), ms);''','''                stack.answers().keep(&asking.view, asking.lookup.now_asking(), asking.generation, answer, asking.lookup.keep_until(), ms);''')],
  [('-p','toyos-net-node --test resolve','nothing_is_kept_under_a_name_the_view_did_not_ask')]),
 ('m09-soa-any-zone', "an SOA accepted from outside the denied name's ancestry",
  [(DNS,'''        if !denied.within(&r.owner) {
            continue;
        }''','''        let _ = denied;''')],
  [('-p','toyos-dns','rfc2308_5_an_absence_with_no_soa_or_with_one_outside_the_denied_names_zone_keeps_nothing')]),
 ('m10-hit-holds-a-place', 'a kept answer asked only once a lookup place is free',
  [(RESOLVE,'''        if let Some(kept) = stack.answers().answer(view, &name, millis(now)) {
            return Ok(Resolving::Kept(kept.map_err(Ended::Failed)));
        }
        let resolvers = stack.lease().map(|lease| lease.dns.clone()).unwrap_or_default();
        if resolvers.is_empty() {
            return Err(NotStarted::NotConnected);
        }
        if self.asking.len().saturating_add(self.ended.len()) >= MAX_LOOKUPS {
            return Err(NotStarted::ResourceExhausted);
        }''','''        let resolvers = stack.lease().map(|lease| lease.dns.clone()).unwrap_or_default();
        if resolvers.is_empty() {
            return Err(NotStarted::NotConnected);
        }
        if self.asking.len().saturating_add(self.ended.len()) >= MAX_LOOKUPS {
            return Err(NotStarted::ResourceExhausted);
        }
        if let Some(kept) = stack.answers().answer(view, &name, millis(now)) {
            return Ok(Resolving::Kept(kept.map_err(Ended::Failed)));
        }''')],
  [('-p','toyos-net-node --test resolve','a_kept_answer_is_given_while_every_lookup_place_is_held')]),
 ('m11-no-expired-entry-first', "a full view's expired entries no longer dropped before its least recently used",
  [(DNS,'''        if kept.entries.len() == VIEW_ENTRIES {
            kept.entries.retain(|entry| now < entry.until);
        }''','''''')],
  [('-p','toyos-dns','a_full_view_drops_its_expired_entries_before_a_live_one')]),
 ('m12-zero-ttl-kept', 'a TTL of zero given a deadline',
  [(DNS,'''        (self.keep > 0).then(|| self.began.saturating_add(u64::from(self.keep) * 1_000))''','''        Some(self.began.saturating_add(u64::from(self.keep) * 1_000))''')],
  [('-p','toyos-dns','rfc1035_4_1_3_a_ttl_of_zero_anywhere_in_what_was_read_keeps_nothing')]),
 ('m13-msb-as-zero', "a TTL with its high-order bit set read as zero (RFC 2181 §8's reading)",
  [(DNS,'''fn keep(ttl: u32) -> u32 {
    ttl.min(KEEP_CAP_S)
}''','''fn keep(ttl: u32) -> u32 {
    if ttl & 0x8000_0000 != 0 { 0 } else { ttl.min(KEEP_CAP_S) }
}''')],
  [('-p','toyos-dns','rfc8767_4_a_ttl_is_read_unsigned_and_kept_an_hour_at_most')]),
 ('m14-no-cap', 'the one-hour cap taken off',
  [(DNS,'''fn keep(ttl: u32) -> u32 {
    ttl.min(KEEP_CAP_S)
}''','''fn keep(ttl: u32) -> u32 {
    ttl
}''')],
  [('-p','toyos-dns','rfc8767_4_a_ttl_is_read_unsigned_and_kept_an_hour_at_most')]),
 ('m15-soa-ttl-not-minimum', "an absence kept for its SOA's TTL alone, its MINIMUM not read",
  [(DNS,'''        let soa = r.ttl.min(keep(msg.u32(fields + 16)?));''','''        let soa = r.ttl;''')],
  [('-p','toyos-dns','rfc2308_5_an_absence_is_kept_for_the_least_of_its_soas_ttl_and_minimum_and_of_its_aliases')]),
 ('m16-failure-kept', 'a failure kept',
  [(DNS,'''            Err(absent @ (Failure::NoSuchName | Failure::NoAddress)) => Err(absent),
            Err(_) => return,''','''            Err(failure) => Err(failure),''')],
  [('-p','toyos-dns','a_failure_is_never_kept_and_an_absence_is')]),
 ('m17-full-view-drops-another', "a full view drops the least recently used view's oldest entry",
  [(DNS,'''        if kept.entries.len() == VIEW_ENTRIES {
            kept.entries.remove(0);
        }''','''        if kept.entries.len() == VIEW_ENTRIES {
            match self.views.first_mut() {
                Some(other) if !other.entries.is_empty() => {
                    other.entries.remove(0);
                }
                _ => {
                    kept.entries.remove(0);
                }
            }
        }''')],
  [('-p','toyos-dns','a_full_view_drops_its_own_least_recently_used_entry_and_no_other_views')]),
 ('m18-deadline-inclusive', 'an answer given at its deadline',
  [(DNS,'''            (now < entry.until).then(|| {''','''            (now <= entry.until).then(|| {''')],
  [('-p','toyos-dns','an_answer_is_given_before_its_deadline_and_not_at_it')]),
]
def git(*a, **k):
    return subprocess.run(['git','-C',WT,*a], check=True, capture_output=True, text=True, **k).stdout
assert git('status','--porcelain','--ignore-submodules=none')=='' , 'tree not clean'
plan=[]
for mid, what, edits, tests in M:
    for path, old, new in edits:
        p=os.path.join(WT,path); s=open(p).read()
        assert s.count(old)==1, (mid, path, old)
        open(p,'w').write(s.replace(old,new))
    patch=git('diff')
    open(os.path.join(OUT,mid+'.patch'),'w').write(patch)
    git('checkout','--','.')
    assert git('status','--porcelain','--ignore-submodules=none')==''
    plan.append({'id':mid,'what':what,'tests':tests})
json.dump(plan, open(os.path.join(OUT,'plan.json'),'w'), indent=1)
print(len(plan),'patches against',git('rev-parse','HEAD').strip())
