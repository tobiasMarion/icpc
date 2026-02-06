# ICPC Practice Repository

This repository is used to practice for the ICPC / Brazilian Programming Contest by solving **official problems from past contests** and keeping a structured record of what was solved and how. The focus is on repetition, consistency, and tracking progress over multiple years.

The repository contains:
- problems organized by year and letter
- official input/output test cases
- a simple local runner to execute solutions against all tests
- a table to track solved problems and techniques used

---

## Repository structure

```
icpc/
├── bin/
│   └── icpc            # CLI entry point
├── run.sh              # Test execution script
├── 2020/
│   └── A/
│       ├── input/      # Official inputs
│       ├── output/     # Official outputs
│       ├── test_output/# Local outputs (ignored by git)
│       └── solution.py # Your solution
└── .gitignore
```

---

## Usage

### Running a single problem

```bash
icpc run 2020 A
```

Runs all tests for problem **A** from year **2020**.

### Running all problems from a year

```bash
icpc run 2020 all
```

Runs all available problems for that year.

---

## Creating a shell alias

To avoid typing the full path every time, it is recommended to create an alias.

### Temporary (current terminal session)

```bash
alias icpc="./bin/icpc"
```

### Permanent (recommended)

Add one of the following lines to your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
alias icpc="/full/path/to/icpc/bin/icpc"
```

After reloading the shell:

```bash
source ~/.zshrc # or ~/.bashrc
```

You can then run commands from anywhere:

```bash
icpc run 2021 C
```

---

## Solved problems tracking

Use the table below to track which problems were solved and record the main idea behind each solution.

Suggested fields:
- **Algorithm**: e.g. greedy, DP, BFS, segment tree, math
- **Complexity**: e.g. O(n), O(n log n)
- **Notes**: pitfalls, tricks, or observations

---

## Resolution Table

Status:
- ✅ Passed
- ⌛️ Time Limit
- 🛑 Wrong Answer

Difficulty Legend
- ⭐ Very Easy (≥ 50% )
- 🟢 Easy (30%  — 49% )
- 🟡 Medium (15%  — 29% )
- 🟠 Hard (5%  — 14% )
- 🔴 Super Har (< 5% )

| Year | Problem | Status | %Success | Difficulty | Algorithm| Complexity | Notes |
|:----:|:-------:|:------:|:----------:|:----------:|:---------|:----------:|:------|
| 2025 | A | ✅ | 75%   | ⭐ | Math | O(n * m) | |
| 2025 | B | ⌛️ | 1%    | 🔴 |    |    | Simulating shuffles isn't fast enough |
| 2025 | C | ✅ | 67%   | ⭐ | Bit Manipulation |    | The degree of the polynomial (<= 20) allows us to use only bitwise operations on an integer. |
| 2025 | D |    | 23%  | 🟡 |    |    | |
| 2025 | E |    | 1%   | 🔴 |    |    | |
| 2025 | F |    | 48%  | 🟢 |    |    | |
| 2025 | G |    | 21%  | 🟡 |    |    | |
| 2025 | H |    | 22%  | 🟡 |    |    | |
| 2025 | I |    | 13%  | 🟠 |    |    | |
| 2025 | J | ✅ | 73%  | ⭐ |    | O(1) | O(1) because its always 10 inputs |
| 2025 | K |    | 3%   | 🔴 |    |    | |
| 2025 | L |    | 33%  | 🟢 |    |    | |
| 2025 | M |    | 8%   | 🟠 |    |    | |
| 2024 | A |    | 45%  | 🟢 |    |    | |
| 2024 | B |    | 23%  | 🟡 |    |    | |
| 2024 | C |    | 16%  | 🟡 |    |    | |
| 2024 | D |    | 21%  | 🟡 |    |    | |
| 2024 | E |    | 71%  | ⭐ |    |    | |
| 2024 | F |    | 66%  | ⭐ |    |    | |
| 2024 | G |    | 0%   | 🔴 |    |    | |
| 2024 | H |    | 14%  | 🟠 |    |    | |
| 2024 | I |    | 6%   | 🟠 |    |    | |
| 2024 | J |    | 0%   | 🔴 |    |    | |
| 2024 | K |    | 14%  | 🟠 |    |    | |
| 2024 | L |    | 21%  | 🟡 |    |    | |
| 2023 | B |    | 45%  | 🟢 |    |    | |
| 2023 | C |    | 11%  | 🟠 |    |    | |
| 2023 | D |    | 62%  | ⭐ |    |    | |
| 2023 | F |    | 28%  | 🟡 |    |    | |
| 2023 | G |    | 12%  | 🟠 |    |    | |
| 2023 | H |    | 16%  | 🟡 |    |    | |
| 2023 | I |    | 25%  | 🟡 |    |    | |
| 2023 | J |    | 20%  | 🟡 |    |    | |
| 2023 | M |    | 44%  | 🟢 |    |    | |
| 2022 | A |    | 15%  | 🟡 |    |    | |
| 2022 | B |    | 67%  | ⭐ |    |    | |
| 2022 | C |    | 31%  | 🟢 |    |    | |
| 2022 | D |    | 82%  | ⭐ |    |    | |
| 2022 | E |    | 15%  | 🟡 |    |    | |
| 2022 | F |    | 18%  | 🟡 |    |    | |
| 2022 | I |    | 44%  | 🟢 |    |    | |
| 2022 | M |    | 50%  | ⭐ |    |    | |
| 2021 | A |    | 0%   | 🔴 |    |    | |
| 2021 | B |    | 7%   | 🟠 |    |    | |
| 2021 | C |    | 50%  | ⭐ |    |    | |
| 2021 | D |    | 13%  | 🟠 |    |    | |
| 2021 | F |    | 64%  | ⭐ |    |    | |
| 2021 | H |    | 35%  | 🟢 |    |    | |
| 2021 | I |    | 28%  | 🟡 |    |    | |
| 2021 | J |    | 28%  | 🟡 |    |    | |
| 2021 | K |    | 47%  | 🟢 |    |    | |
| 2021 | L |    | 9%   | 🟠 |    |    | |
| 2021 | M |    | 12%  | 🟠 |    |    | |
| 2020 | A |    | 14%  | 🟠 |    |    | |
| 2020 | B |    | 31%  | 🟢 |    |    | |
| 2020 | C |    | 40%  | 🟢 |    |    | |
| 2020 | D |    | 39%  | 🟢 |    |    | |
| 2020 | E |    | 8%   | 🟠 |    |    | |
| 2020 | F |    | 100% | ⭐ |    |    | |
| 2020 | G |    | 47%  | 🟢 |    |    | |
| 2020 | H |    | 50%  | ⭐ |    |    | |
| 2020 | I |    | 27%  | 🟡 |    |    | |
| 2020 | J |    | 45%  | 🟢 |    |    | |
| 2020 | K |    | 43%  | 🟢 |    |    | |
| 2020 | L |    | 8%   | 🟠 |    |    | |
| 2020 | M |    | 66%  | ⭐ |    |    | |
