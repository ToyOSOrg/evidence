"""Validate six alternating single-run comparisons, retaining every sample.

Usage: python3 tools/analyze_ring_pairs.py evidence/current/x86-pipeline/native t14
Clock-derived cycles are estimates at one-second resolution, not cycle counts.
"""
import argparse
import csv
import hashlib
import json
import statistics
from pathlib import Path

from analyze_ring import analyze


RUNS = {
    't14': ((23, 'candidate'), (24, 'baseline'), (25, 'baseline'),
            (26, 'candidate'), (27, 'candidate'), (28, 'baseline')),
    'amd': ((29, 'candidate'), (30, 'baseline'), (31, 'baseline'),
            (32, 'candidate'), (33, 'candidate'), (34, 'baseline')),
}
COMMITS = {'candidate': 'afcc50b20f7d50fe128dc211589d5f52a1233c57',
           'baseline': 'af822f5cce8921bea903fd8acbba5a9fac473f6e'}


def analyze_pairs(root, machine):
    groups, runs = {}, []
    for number, source in RUNS[machine]:
        folder = root / f'r{number:04}'
        path = folder / 'output.txt'
        assert COMMITS[source] in (folder / 'environment.txt').read_text()
        assert (folder / 'exit.txt').read_text().strip() == '=== run 1 exit: 0'
        validated = analyze(path, 1)
        clock = []
        for line in path.read_text().splitlines():
            fields = line.split()
            if len(fields) == 5 and fields[0] == '2':
                clock.append(dict(zip(('cpu', 'average_mhz', 'busy_percent',
                                       'busy_mhz', 'tsc_mhz'), map(float, fields))))
            row = next(csv.reader([line]))
            if len(row) == 8 and row[0] in ('AES-128-GCM', 'AES-256-GCM', 'ChaCha20-Poly1305'):
                algorithm, size, op, backend, _, _, ns, _ = row
                key = (algorithm, int(size), op)
                values = groups.setdefault(key, {'baseline': [], 'candidate': [], 'ring': []})
                values['ring' if backend == 'ring' else source].append(float(ns))
        assert clock and all(row['busy_mhz'] == (2400 if machine == 't14' else 1797)
                             for row in clock)
        runs.append({'id': folder.name, 'source': source,
                     'input_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                     'samples_validated': validated['samples_validated'],
                     'clock_resolution_seconds': 1, 'cpu2_clock_rows': clock,
                     'per_run_results': validated['results']})
    frequency = 2400 if machine == 't14' else 1797
    results = []
    for (algorithm, size, op), values in sorted(groups.items()):
        assert {name: len(v) for name, v in values.items()} == {
            'baseline': 21, 'candidate': 21, 'ring': 42}
        medians = {name: statistics.median(v) for name, v in values.items()}
        results.append({'algorithm': algorithm, 'size': size, 'operation': op,
                        'median_ns': medians,
                        'sample_counts': {name: len(v) for name, v in values.items()},
                        'clock_derived_cycles_per_byte': {
                            name: ns * frequency / 1000 / size if size else None
                            for name, ns in medians.items()},
                        'baseline_over_candidate': medians['baseline'] / medians['candidate'],
                        'candidate_over_ring': medians['candidate'] / medians['ring']})
    return {'machine': machine, 'commits': COMMITS, 'run_order': runs,
            'samples_validated': sum(run['samples_validated'] for run in runs),
            'outliers_removed': 0, 'stock_ring_dispatch': True,
            'busy_clock_mhz': frequency, 'clock_resolution_seconds': 1,
            'per_sample_cycles_measured': False, 'results': results}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('machine', choices=RUNS)
    args = parser.parse_args()
    print(json.dumps(analyze_pairs(args.root, args.machine), indent=2))
