"""Validate raw timing exports and recompute unfiltered Welch statistics.

Usage: python3 tools/analyze_timing.py output.txt[.gz] > analysis.json
Defaults: focused four-routine sweep, seeds 1/2/3, 100,000 samples per routine.
For the full sweep use --count 20000 --routines all. Expected inventory and
sample count are specified independently rather than inferred from the output.
Statistics describe these observations; they do not establish constant time.
"""
import argparse
import gzip
import hashlib
import json
import math
from array import array
from pathlib import Path


FOCUSED = ('control_leaky', 'chacha', 'ssh', 'wpa2_hmac')
AES = ('control_leaky', 'aes128', 'aes256')
ALL = ('control_leaky', 'sha512', 'hmac', 'hkdf', 'aes128', 'aes256', 'chacha',
       'ssh', 'x25519', 'p256', 'p384', 'ed25519_sign', 'mlkem_decaps',
       'wpa2_pmk', 'wpa2_hmac', 'wpa2_prf')


def moments(values):
    mean = math.fsum(values) / len(values)
    variance = math.fsum((x - mean) ** 2 for x in values) / (len(values) - 1)
    return mean, variance


def compare(classes):
    m0, v0 = moments(classes[0])
    m1, v1 = moments(classes[1])
    return (m0 - m1) / math.sqrt(v0 / len(classes[0]) + v1 / len(classes[1]))


def analyze(path, count=100000, routines=FOCUSED):
    assert count >= 100 and count % 4 == 0
    groups = {}
    summaries = {}
    seed = None
    opener = gzip.open if path.suffix == '.gz' else open
    with opener(path, 'rt') as stream:
        for line in stream:
            if line.startswith('# samples='):
                metadata = dict(x.split('=', 1) for x in line[2:].split())
                assert int(metadata['samples']) == count
                assert metadata['preparation'] == 'precomputed'
                assert metadata['raw'] == 'true'
                seed = int(metadata['seed'])
            fields = line.strip().split(',')
            if fields[0] in routines:
                key = (seed, fields[0])
                assert key not in summaries
                assert fields[4] == 'true'
                summaries[key] = fields
            if fields[0] != 'sample':
                continue
            _, row_seed, routine, index, cls, ns = fields
            key = (int(row_seed), routine)
            assert key[0] == seed and key in summaries
            group = groups.setdefault(key, {
                'n': 0, 'classes': [array('Q'), array('Q')],
                'quarters': [[array('Q'), array('Q')] for _ in range(4)],
            })
            index, cls, ns = int(index), int(cls), int(ns)
            assert index == group['n'] and 0 <= index < count
            assert cls in (0, 1) and ns >= 0
            group['n'] += 1
            group['classes'][cls].append(ns)
            group['quarters'][index // (count // 4)][cls].append(ns)
    assert set(groups) == set(summaries)
    assert set(groups) == {(seed, routine) for seed in (1, 2, 3)
                           for routine in routines}
    results = []
    for (seed, routine), group in sorted(groups.items()):
        assert group['n'] == count
        classes = group['classes']
        summary = summaries[(seed, routine)]
        t = compare(classes)
        assert abs(t - float(summary[3])) <= 0.00051
        stats = []
        for cls, values in enumerate(classes):
            assert len(values) == int(summary[cls + 1])
            mean, variance = moments(values)
            sd = math.sqrt(variance)
            assert abs(mean - float(summary[cls + 5])) <= 0.00051
            assert abs(sd - float(summary[cls + 7])) <= 0.00051
            ordered = sorted(values)
            stats.append({'n': len(values), 'mean_ns': mean, 'stddev_ns': sd,
                          'min_ns': ordered[0], 'max_ns': ordered[-1],
                          'median_ns': (ordered[(len(values) - 1) // 2] + ordered[len(values) // 2]) / 2,
                          'p99_ns': ordered[math.ceil(len(values) * 0.99) - 1]})
        results.append({'seed': seed, 'routine': routine, 'classes': stats,
                        'welch_t': t, 'quarter_welch_t': [compare(q) for q in group['quarters']]})
    return {'input_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'samples_validated': sum(g['n'] for g in groups.values()),
            'outliers_removed': 0, 'no_verdict': True, 'results': results}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('path', type=Path)
    parser.add_argument('--count', type=int, default=100000)
    parser.add_argument('--routines', choices=('focused', 'all', 'aes'), default='focused')
    args = parser.parse_args()
    print(json.dumps(analyze(args.path, args.count,
                             {'all': ALL, 'focused': FOCUSED, 'aes': AES}[args.routines]), indent=2))
