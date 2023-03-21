from smort.src.msic.StrEnum import StrEnum

class BugType(StrEnum):
    CRASH = 'crash'
    SEGFAULT = 'segfault'
    INCORRECT = 'incorrect'