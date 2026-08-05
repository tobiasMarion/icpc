# CSES Problem Set

Solutions to the [CSES Problem Set](https://cses.fi/problemset/), organized by
the same categories the judge uses.

Progress on the judge: https://cses.fi/problemset/user/449002/

Run them with `icpc run cses/<category> <problem>` — see the [CLI documentation](../README.md).

## Adding a problem

Problem directories are numbered by the order they appear on the judge, so the
listing follows the same sequence as the site (`1_weird_algorithm`,
`2_missing_number`, ...).

1. Create `cses/<category>/<n>_<problem_name>/solution.py` (or `.c` / `.cpp`)
2. Open the problem on CSES while logged in and download its `tests.zip`
   into that same directory
3. Run `icpc extract cses/<category>/<n>_<problem_name>`

Every problem inherits the 1 second limit from `cses/limits/`, matching the
judge. A problem that needs a different limit can define its own `limits/`.

## Status

- ✅ Passed
- ⌛️ Time Limit
- 🛑 Wrong Answer

## Resolution Table

| Category | # | Problem | Status | Algorithm | Complexity | Notes |
|:---------|:-:|:--------|:------:|:----------|:----------:|:------|
| Introductory | 1 | [Weird Algorithm](https://cses.fi/problemset/task/1068) | ✅ | Simulation | O(log n) steps | Collatz sequence; values exceed 32 bits, so C++ needs `long long` |
| Introductory | 2 | [Missing Number](https://cses.fi/problemset/task/1083) | ✅ | Math | O(n) | Sum of 1..n minus the sum of the input |
