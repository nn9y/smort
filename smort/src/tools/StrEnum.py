from enum import Enum


class StrEnum(Enum):
    def __str__(self):
        return str(self.value)
    
    def __repr__(self):
        return self.__str__()