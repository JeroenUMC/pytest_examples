import pytest


@pytest.fixture
def sample_user_names() -> list[str]:
    return ["alice", " bob "]


def pytest_report_header(config: pytest.Config) -> str:
    return "pytest_examples: basic educational setup loaded"
