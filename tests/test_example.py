import pytest

from example import add
from example import normalize_name


@pytest.mark.smoke
def test_add_two_numbers() -> None:
    assert add(2, 3) == 5


@pytest.mark.parametrize(
    "raw,expected",
    [
        ("alice", "Alice"),
        (" bob ", "Bob"),
    ],
)
def test_normalize_name_formats_values(raw: str, expected: str) -> None:
    assert normalize_name(raw) == expected


def test_normalize_name_rejects_empty_values() -> None:
    with pytest.raises(ValueError, match="name cannot be empty"):
        normalize_name("   ")
