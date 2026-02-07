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
│   └── icpc# CLI entry point
├── run.sh  # Test execution script
├── 2020/
│   └── A/
│ ├── input/# Official inputs
│ ├── output/# Official outputs
│ ├── test_output/# Local outputs (ignored by git)
│ └── solution.py # Your solution
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

### Status:
- ✅ Passed
- ⌛️ Time Limit
- 🛑 Wrong Answer

### Difficulty Legend

Problem difficulty is computed using a Composite Difficulty Score (CDS) based on official contest statistics.
The score combines a smoothed acceptance rate with a log-normalized submission volume (per year), giving more weight to problems that are both widely attempted and frequently solved.

Problems are then ranked by this score and divided into five quantiles within the dataset:

- 🔵 Super Easy
- 🟢 Easy
- 🟡 Medium
- 🟠 Hard
- 🔴 Super Hard

This classification is intended for study prioritization rather than absolute difficulty measurement.
| Year | Problem | Status | Difficulty | Algorithm | Complexity | Notes |
|:----:|:-------:|:------:|:----------:|:----------|:----------:|:------|
| 2025 | A | ✅ | 🔵 | Math | O(n * m) |    |
| 2025 | B | ⌛️ | 🟠 ||| Simulating shuffles isn't fast enough  |
| 2025 | C | ✅ | 🔵 | Bit Manipulation || The degree of the polynomial (<= 20) allows us to use only bitwise operations on an integer. |
| 2025 | D |    | 🟠 ||||
| 2025 | E |    | 🟠 ||||
| 2025 | F |    | 🟡 ||||
| 2025 | G |    | 🔴 ||||
| 2025 | H |    | 🟠 ||||
| 2025 | I |    | 🟢 ||||
| 2025 | J | ✅ | 🔵 || O(1) | O(1) because it's always 10 inputs|
| 2025 | K |    | 🟡 ||||
| 2025 | L |    | 🟡 ||||
| 2025 | M |    | 🔵 ||||
| 2024 | A |    | 🔵 ||||
| 2024 | B |    | 🟡 ||||
| 2024 | C |    | 🟠 ||||
| 2024 | D |    | 🔴 ||||
| 2024 | E | ✅ | 🔵 || O(n<sup>2</sup>) |    |
| 2024 | F | ✅ | 🔵 | Fibonacci  | O(n) |    |
| 2024 | G |    | 🟠 ||||
| 2024 | H |    | 🟢 ||||
| 2024 | I |    | 🟢 ||||
| 2024 | J |    | 🔴 ||||
| 2024 | K |    | 🟢 ||||
| 2024 | L |    | 🟢 ||||
| 2023 | A |    | 🔵 ||||
| 2023 | B |    | 🔴 ||||
| 2023 | C |    | 🟡 ||||
| 2023 | D | ⌛️ | 🟠 | Dijkstra   | O(m<sup>2</sup> log n) | Run Dijkstra to each removed edge isn't fast enough|
| 2023 | E |    | 🟢 ||||
| 2023 | F | ✅ | 🔵 || O(n + m) ||
| 2023 | G |    | 🟡 ||||
| 2023 | H |    | 🟠 ||||
| 2023 | I |    | 🟢 ||||
| 2023 | J |    | 🔴 ||||
| 2023 | K |    | 🔴 ||||
| 2023 | L |    | 🟢 ||||
| 2023 | M |    | 🟡 ||||
| 2022 | A | ✅ | 🔵 || O(n) ||
| 2022 | B |    | 🔴 ||||
| 2022 | C |    | 🟠 ||||
| 2022 | D |    | 🟢 ||||
| 2022 | E | ✅ | 🔵 || O(n) ||
| 2022 | F |    | 🟡 ||||
| 2022 | G |    | 🔴 ||||
| 2022 | H |    | 🟠 ||||
| 2022 | I |    | 🔵 ||||
| 2022 | J |    | 🟢 ||||
| 2022 | K |    | 🔴 ||||
| 2022 | L |    | 🟠 ||||
| 2022 | M |    | 🔴 ||||
| 2022 | N |    | 🟡 ||||
| 2021 | A |    | 🟠 ||||
| 2021 | B |    | 🟡 ||||
| 2021 | C |    | 🟢 ||||
| 2021 | D |    | 🟠 ||||
| 2021 | E |    | 🟢 ||||
| 2021 | F |    | 🔴 ||||
| 2021 | G |    | 🟡 ||||
| 2021 | H |    | 🟢 ||||
| 2021 | I |    | 🔴 ||||
| 2021 | J |    | 🔴 ||||
| 2021 | K |    | 🔵 ||||
| 2021 | L |    | 🟠 ||||
| 2021 | M |    | 🟡 ||||
| 2021 | N |    | 🟢 ||||
| 2020 | A |    | 🟡 ||||
| 2020 | B |    | 🔵 ||||
| 2020 | C |    | 🟡 ||||
| 2020 | D |    | 🔴 ||||
| 2020 | E |    | 🟡 ||||
| 2020 | F |    | 🔵 ||||
| 2020 | G |    | 🔵 ||||
| 2020 | H |    | 🟡 ||||
| 2020 | I |    | 🟠 ||||
| 2020 | J |    | 🔴 ||||
| 2020 | K |    | 🟠 ||||
| 2020 | L |    | 🟢 ||||
| 2020 | M |    | 🔴 ||||
| 2020 | N |    | 🟢 ||||
| 2020 | O |    | 🔴 ||||
