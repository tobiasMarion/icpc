# Competitive Programming Practice

Solutions to programming contest problems, with the official test cases and a
local runner to check them.

- [ICPC / Brazilian Programming Contest](icpc/README.md) — problems by year and letter
- [CSES Problem Set](cses/README.md) — problems by category

---

## Languages

The runner picks the language from the solution file name, so the same command
works no matter what you wrote the problem in:

| File | Language | How it runs |
|:-----|:---------|:------------|
| `solution.cpp` | C++ | `g++-15` when available, otherwise `g++`, with `-std=gnu++17 -O2 -Wall -Wextra` |
| `solution.c` | C | `gcc-15` when available, otherwise `gcc`, with `-std=gnu11 -O2 -Wall -Wextra -lm` |
| `solution.py` | Python | `python3` |

Compiling happens on every run and the binary is removed afterwards, so a
compilation error is reported in place of the test results. Each language reads
its own time limit, so a problem can be solved in Python under the Python limit
and in C++ under the C++ one.

---

## Structure

A **problem** is any directory holding a solution file. Its **group** is the
directory above it:

```
icpc/2024/A/              cses/introductory/1_weird_algorithm/
├── input/                ├── input/
├── output/               ├── output/
├── limits/               └── solution.py
└── solution.py
```

- `input/` and `output/` hold the official test cases, matched by file name
  (`input/3` is compared against `output/3`). Like the judges, the comparison
  ignores trailing whitespace and a missing final newline — the official CSES
  outputs do end every line with a space. When it is *your* output carrying the
  extra whitespace the test still passes, but it is flagged, since a judge that
  checks formatting strictly would reject it
- `limits/` holds one file per language (`py3`, `cpp`, `c`) printing the time
  limit in seconds. The runner walks up the tree, so `cses/limits/` applies to
  every CSES problem
- `test_output/` and `last_run.json` are produced by the runner and ignored by git

---

## Commands

```bash
icpc run icpc/2024 A       # one problem
icpc run cses/introductory all   # every problem of a group
icpc run all               # every problem in the repository, with a summary
icpc run changed           # only problems with git changes
icpc debug                 # manual input mode for the problem being worked on
icpc extract <problem>     # unpack a tests.zip into input/ and output/
```

`icpc --help` lists them all.

### Downloading CSES test cases

CSES ships every problem's test data as a `tests.zip` of `1.in` / `1.out` pairs,
available while logged in. Download it into the problem directory and unpack it:

```bash
mv ~/Downloads/tests.zip cses/introductory/1_weird_algorithm/
icpc extract cses/introductory/1_weird_algorithm
```

Running `icpc extract` with no argument unpacks every `tests.zip` found in the
repository. Existing test files with the same name are overwritten; the others
are kept and reported.

---

## Installing

Add the `bin/` directory to your `PATH`:

```bash
export PATH="$PATH:/full/path/to/icpc/bin"
```

Put that line in your shell configuration file (`~/.zshrc`, `~/.bashrc`, etc.)
and reload it with `source ~/.zshrc`. The CLI resolves everything relative to
the repository it lives in, so the commands work from any directory.
