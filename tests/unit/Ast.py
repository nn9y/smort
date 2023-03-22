from smort.src.translate.Ast import Identifier


def test_identifier():
    id1 = Identifier("id1", ["ax", "ab"])
    id1_str = "(_ id1 ax ab)"
    assert str(id1) == id1_str
    id1 = Identifier("id1", [1, "ab"])
    id1_str = "(_ id1 1 ab)"
    assert str(id1) == id1_str
    id1 = Identifier("id1")
    id1_str = "id1"
    assert str(id1) == id1_str
