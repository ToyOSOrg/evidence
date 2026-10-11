"""Validate three seven-sample comparator runs and pool unfiltered medians.

Usage: python3 tools/analyze_ring.py output.txt > analysis.json
Nanoseconds are measured. No cycles are inferred from configured frequency.
"""
import csv
import hashlib
import json
import statistics
import sys
from collections import defaultdict
from pathlib import Path


def analyze(path):
    groups = defaultdict(list)
    seen = set()
    run = None
    algorithms = ('AES-128-GCM', 'AES-256-GCM', 'ChaCha20-Poly1305')
    sizes = (0, 1, 15, 16, 17, 64, 1024, 16384)
    operations = ('seal', 'open', 'reject', 'key-setup')
    for line in path.read_text().splitlines():
        if line.startswith('=== run ') and ', load ' in line:
            run = int(line.split()[2].rstrip(','))
        row = next(csv.reader([line]))
        if len(row) != 8 or row[0] not in algorithms:
            continue
        algorithm, size, operation, backend, sample, count, ns, per_byte = row
        size, sample, count = int(size), int(sample), int(count)
        assert run in (1, 2, 3) and size in sizes and operation in operations
        assert backend in ('ring', 'toyos') and 1 <= sample <= 7
        assert count == min(2000, max(1, 16 * 1024 * 1024 // max(size, 1)))
        assert operation != 'key-setup' or size == 0
        ns, per_byte = float(ns), float(per_byte)
        assert ns > 0
        # Both columns are independently rounded to 0.001 before export.
        tolerance = 0.0005 * (1 + 1 / max(size, 1)) + 1e-9
        assert abs(per_byte - ns / max(size, 1)) <= tolerance
        key = (algorithm, size, operation, backend)
        identity = (*key, run, sample)
        assert identity not in seen
        seen.add(identity)
        groups[key].append((run, ns))
    expected = {(a, s, op, b) for a in algorithms for s in sizes
                for op in operations if op != 'key-setup' or s == 0
                for b in ('ring', 'toyos')}
    assert set(groups) == expected
    results = []
    for algorithm, size, operation in sorted({key[:3] for key in expected}):
        backends = {}
        for backend in ('ring', 'toyos'):
            observations = groups[algorithm, size, operation, backend]
            assert len(observations) == 21
            by_run = [[ns for r, ns in observations if r == run] for run in (1, 2, 3)]
            assert all(len(values) == 7 for values in by_run)
            values = [ns for _, ns in observations]
            median = statistics.median(values)
            backends[backend] = {'n': len(values), 'median_ns': median,
                                 'median_ns_per_byte': median / size if size else None,
                                 'min_ns': min(values), 'max_ns': max(values),
                                 'run_medians_ns': [statistics.median(v) for v in by_run]}
        results.append({'algorithm': algorithm, 'size': size, 'operation': operation,
                        'backends': backends,
                        'time_ratio_ours_over_ring': backends['toyos']['median_ns'] / backends['ring']['median_ns']})
    return {'input_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'samples_validated': len(seen), 'outliers_removed': 0,
            'metric': 'nanoseconds', 'dispatch': 'stock-ring',
            'cycles_not_measured': True, 'results': results}


if __name__ == '__main__':
    print(json.dumps(analyze(Path(sys.argv[1])), indent=2))
