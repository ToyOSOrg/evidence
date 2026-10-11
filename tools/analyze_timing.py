"""Validate focused raw timing exports and recompute unfiltered Welch statistics.

Usage: python3 tools/analyze_timing.py output.txt[.gz] > analysis.json
The input must contain one run, three seeds, and 100,000 samples per routine.
Statistics describe these observations; they do not establish constant time.
"""
import gzip
import hashlib
import json
import math
import sys
from array import array
from pathlib import Path


def moments(values):
    mean = math.fsum(values) / len(values)
    variance = math.fsum((x - mean) ** 2 for x in values) / (len(values) - 1)
    return mean, variance


def compare(classes):
    m0, v0 = moments(classes[0])
    m1, v1 = moments(classes[1])
    return (m0 - m1) / math.sqrt(v0 / len(classes[0]) + v1 / len(classes[1]))


def analyze(path):
    groups = {}
    summaries = {}
    seed = None
    opener = gzip.open if path.suffix == '.gz' else open
    with opener(path, 'rt') as stream:
        for line in stream:
            if line.startswith('# samples='):
                metadata = dict(x.split('=', 1) for x in line[2:].split())
                assert metadata['samples'] == '100000'
                assert metadata['preparation'] == 'precomputed'
                assert metadata['raw'] == 'true'
                seed = int(metadata['seed'])
            fields = line.strip().split(',')
            if fields[0] in ('control_leaky', 'chacha', 'ssh', 'wpa2_hmac'):
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
            assert index == group['n'] and 0 <= index < 100000
            assert cls in (0, 1) and ns >= 0
            group['n'] += 1
            group['classes'][cls].append(ns)
            group['quarters'][index // 25000][cls].append(ns)
    assert set(groups) == set(summaries)
    assert set(groups) == {(seed, routine) for seed in (1, 2, 3)
                           for routine in ('control_leaky', 'chacha', 'ssh', 'wpa2_hmac')}
    results = []
    for (seed, routine), group in sorted(groups.items()):
        assert group['n'] == 100000
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
    print(json.dumps(analyze(Path(sys.argv[1])), indent=2))
