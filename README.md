# testing_examples

Simple examples to teach what unit tests are and how to run them, across multiple languages and frameworks.

## What Is A Unit Test?

A unit test checks one small piece of code (a "unit") and verifies that it behaves as expected.

In this repo, each language contains a small set of functions and a suite of tests that cover them.

## Languages

| Language | Framework | Location |
|----------|-----------|----------|
| Python | pytest | `python/` |
| R | testthat | `r/` |

---

## Python — pytest

### Quick Start (uv)

1. Install uv: https://docs.astral.sh/uv/getting-started/installation/
2. Move into the Python directory and sync development dependencies:

```bash
cd python
uv sync --dev
```

3. Run all tests:

```bash
uv run pytest
```

### Core pytest Features In This Repo

#### 1) Discovery

pytest discovers tests by naming conventions.

- Files named `test_*.py`
- Functions named `test_*`
- Tests under the `tests/` folder

Try:

```bash
uv run pytest -q
```

#### 2) Markers

Markers let you select groups of tests.

This repo uses `@pytest.mark.smoke` on one test.

Run only smoke tests:

```bash
uv run pytest -m smoke
```

#### 3) Fixtures

Fixtures provide reusable setup for tests.

This repo has one fixture in `python/tests/conftest.py` that provides sample user data.

#### 4) Hooks

Hooks let you customize pytest behavior.

This repo includes a tiny hook (`pytest_report_header`) in `python/tests/conftest.py`.
It adds a short header line when tests start.

---

## R — testthat

### Quick Start

1. Install R: https://www.r-project.org/
2. Install the testthat package:

```r
install.packages("testthat")
```

3. Run all tests:

```bash
Rscript r/run_tests.R
```

### Core testthat Features In This Repo

#### 1) Discovery

testthat discovers tests in files named `test-*.R` inside the `tests/` folder.
Each test is declared with `test_that()`.

Try running the tests and reading the output:

```bash
Rscript r/run_tests.R
```

#### 2) Expectations

Expectations are the R equivalent of assertions.
They start with `expect_` and check one specific condition.

This repo uses:

- `expect_equal()` — checks that a value matches an expected result
- `expect_error()` — checks that a call throws an error

#### 3) Test Blocks

Each `test_that()` call groups related expectations under a description.
If any expectation inside the block fails, that block is reported as failed.

#### 4) Error Testing

`expect_error()` verifies that a function throws an error under specific conditions,
and optionally checks that the error message matches a pattern.

---

## Automation In GitHub Actions

CI is configured in `.github/workflows/`.

- `python.yml` — runs pytest on every push and pull request
- `r.yml` — runs testthat on every push and pull request

### When It Runs

Both workflows run on:

- Every `push`
- Every `pull_request`

### Where It Runs

Both run on a fresh Linux runner: `ubuntu-latest`.
Every run starts clean, so dependencies are installed from scratch each time.

### What Success Or Failure Means

- If tests pass, the workflow is green.
- If tests fail, the workflow is red and the check appears as failed on the pull request.

## Why This Structure Works In Any Repo

- Language-specific source code lives in its own directory, keeping things easy to find.
- Tests mirror the structure of the source so it is obvious which tests cover which code.
- CI workflows run automatically, so broken code cannot be merged unnoticed.
- Each language uses its ecosystem's standard tools, so the patterns transfer directly to real projects.
