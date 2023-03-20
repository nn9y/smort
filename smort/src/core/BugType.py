from smort.src.common.StrEnum import StrEnum

class BugType(StrEnum):
    CRASH = 'crash'
    SEGFAULT = 'segfault'
    INCORRECT = 'incorrect'