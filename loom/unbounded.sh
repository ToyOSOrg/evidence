#!/bin/sh
# Each session case with no preemption bound (LOOM_MAX_PREEMPTIONS unset is the model's bound of
# 5, so it is set to 255, loom's largest), capped at 600 s: its verdict or its time-out.
B=$1
for t in two_sleepers_each_wake_when_room_is_released_first two_sleepers_each_wake_when_data_is_published_first \
  a_poll_beside_a_blocking_read_is_answered_for_the_bytes_it_left a_poll_beside_a_blocking_read_is_answered_for_the_end_it_left \
  a_poll_beside_a_blocking_write_is_answered_for_the_room_it_left \
  a_source_registered_after_bytes_arrived_gets_its_first_event a_source_registered_as_bytes_arrive_gets_its_first_event \
  a_source_registered_after_the_end_gets_its_first_event a_source_registered_as_the_end_arrives_gets_its_first_event \
  a_source_registered_with_room_gets_its_first_event a_source_registered_as_room_is_released_gets_its_first_event \
  a_source_registered_over_a_full_ring_after_a_reset_gets_its_first_event a_source_registered_over_a_full_ring_as_a_reset_arrives_gets_its_first_event; do
  start=$(date +%s)
  LOOM_MAX_PREEMPTIONS=255 "$B" --exact "$t" > out.$$ 2>&1 &
  p=$!
  while kill -0 $p 2>/dev/null && [ $(( $(date +%s) - start )) -lt 600 ]; do sleep 1; done
  if kill -0 $p 2>/dev/null; then kill $p; wait $p; echo "=== $t: no verdict in 600 s"; else wait $p; e=$?; grep -E 'test result' out.$$; echo "=== $t EXIT=$e after $(( $(date +%s) - start )) s"; fi
done
rm -f out.$$
