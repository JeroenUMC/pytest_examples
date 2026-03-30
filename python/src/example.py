def add(a: int, b: int) -> int:
    return a + b


def normalize_name(name: str) -> str:
    cleaned = name.strip()
    if not cleaned:
        raise ValueError("name cannot be empty")
    return cleaned.title()
