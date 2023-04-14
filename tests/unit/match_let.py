from smort.src.translate.tools.Sort import *
from smort.src.translate.tools.Term import *
from smort.src.translate.smtlibv2.ADT import *
from smort.src.translate.smtlibv2.Script import *
from smort.src.translate.smtlibv2.cnf_conversion import *



def create_adt_List():
    """
    (declare-datatypes ( (List 1) )
        (
            (par (T)
                (
                    (nil) 
                    (cons (car T) (cdr (List T)) )
                )
            )
        )
    )
    """
    global T
    T = 'T'
    par_list = [T]
    adt_List = declare_datatype('List', 1)(par_list)
    global nil_name
    nil_name = 'nil'
    nil_dec = ConstructorDec(nil_name, []) 
    add_functions_of_datatype(nil_dec, adt_List, par_list)
    car_name = 'car'
    cdr_name = 'cdr'
    car_dec = [car_name, T]
    cdr_dec = [cdr_name, adt_List]
    global cons_name
    cons_name = 'cons'
    cons_dec = ConstructorDec(cons_name, [car_dec, cdr_dec]) 
    add_functions_of_datatype(cons_dec, adt_List, par_list)
    return adt_List



def test_match():
    adt_List = create_adt_List()
    # (match l1 ((nil l2) ((cons h t) (cons h (append t l2)))))
    smtlibv2_str = '(match l1 ((nil l2) ((cons h t) (cons h (append t l2)))))'
    Int_List = adt_List.get_parametric_instance({T: INT})
    lst1 = Var(name=Identifier('l1'), sort=Int_List)
    lst2 = Var(name=Identifier('l2'), sort=Int_List)
    h = 'h'
    t = 't'
    pattern1 = Pattern(nil_name)
    pattern2 = Pattern(cons_name, [h, t])
    term1 = lst2
    term2 = Expr(
        name=Identifier(cons_name),
        subterms=[
            Var(name=h, sort=INT),
            Expr(
                name=Identifier('append'),
                subterms=[
                    Var(name=t, sort=Int_List),
                    lst2
                ],
                sort=Int_List
            )
        ],
        sort=Int_List
    )
    assert str(pattern1) == 'nil'
    assert str(pattern2) == '(cons h t)'
    assert str(term1) == 'l2'
    assert str(term2) == '(cons h (append t l2))'
    match_cases = [[pattern1, term1], [pattern2, term2]]
    match_term = Match(
        term=lst1,
        match_cases=match_cases,
        sort=Int_List,
    )
    assert str(match_term) == smtlibv2_str 
    # (ite ((_ is nil) l1) l2 (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))))
    eliminate_match(match_term)
    smtlibv2_str = '(ite ((_ is nil) l1) l2 (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))))'
    assert str(match_term) == smtlibv2_str 

    # (match l1 ((nil l2) ((cons h t) (cons h (append t l2))) (x l2)))
    smtlibv2_str = '(match l1 ((nil l2) ((cons h t) (cons h (append t l2))) (x l2)))'
    x = 'x'
    pattern3 = Pattern(var_list=[x])
    term3 = lst2
    match_cases = [[pattern1, term1], [pattern2, term2], [pattern3, term3]]
    match_term = Match(
        term=lst1,
        match_cases=match_cases,
        sort=Int_List,
    )
    assert str(match_term) == smtlibv2_str 
    # (ite ((_ is nil) l1) l2 (ite ((_ is cons) l1) (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))) (let ((x l1)) l2)))
    eliminate_match(match_term)
    smtlibv2_str = '(ite ((_ is nil) l1) l2 (ite ((_ is cons) l1) (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))) (let ((x l1)) l2)))'
    assert str(match_term) == smtlibv2_str 
    # (match l1 ((nil l2) (x l2) ((cons h t) (cons h (append t l2)))))
    match_cases = [[pattern1, term1], [pattern3, term3], [pattern2, term2]]
    match_term = Match(
        term=lst1,
        match_cases=match_cases,
        sort=Int_List,
    )
    smtlibv2_str = '(match l1 ((nil l2) (x l2) ((cons h t) (cons h (append t l2)))))'
    assert str(match_term) == smtlibv2_str 
    # (ite ((_ is nil) l1) l2 (ite ((_ is cons) l1) (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))) (let ((x l1)) l2)))
    eliminate_match(match_term)
    smtlibv2_str = '(ite ((_ is nil) l1) l2 (ite ((_ is cons) l1) (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))) (let ((x l1)) l2)))'
    assert str(match_term) == smtlibv2_str 

    match_cases = [[pattern1, term1], [pattern3, term3], [pattern2, term2]]
    match_term = Match(
        term=lst1,
        match_cases=match_cases,
        sort=Int_List,
    )
    # (forall ((l1 (List Int)) (l2 (List Int))) (= (append l1 l2) <match_term> ))
    forall_term = Quantifier(
        name='Q1',
        quantifier=QUANT_FORALL,
        sorted_vars=[['l1', Int_List], ['l2', Int_List]],
        quantified_term=Expr(
            name=Identifier("="),
            subterms=[
                Expr(
                    name=Identifier("append"),
                    subterms=[lst1, lst2],
                    sort=Int_List,
                ),
                match_term
            ],
            sort=BOOL
        ),
        sort=BOOL
    )
    smtlibv2_str = f'(forall ((l1 (List Int)) (l2 (List Int))) (= (append l1 l2) {match_term}))'
    assert str(forall_term) == smtlibv2_str
    # (forall ((l1 (List Int)) (l2 (List Int))) (= (append l1 l2) <match_term_eliminated> ))
    ite_str = '(ite ((_ is nil) l1) l2 (ite ((_ is cons) l1) (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))) (let ((x l1)) l2)))'
    eliminate_match(forall_term)
    smtlibv2_str = f'(forall ((l1 (List Int)) (l2 (List Int))) (= (append l1 l2) {ite_str}))'
    assert str(forall_term) == smtlibv2_str


def test_let():
    # (let ((x (- a b)) (y (* a b))) (+ x y))
    smtlibv2_str = '(let ((x (- a b)) (y (* a b))) (+ x y))'
    x = 'x'
    y = 'y'
    a = Var(name=Identifier('a'), sort=INT, global_free=True)
    b = Var(name=Identifier('b'), sort=INT, global_free=True)
    x_term = Expr(
        name=Identifier('-'),
        subterms=[a, b],
        sort=INT
    )
    y_term = Expr(
        name=Identifier('*'),
        subterms=[a, b],
        sort=INT
    )
    local_x = Var(name=Identifier('x'), sort=INT)
    local_y = Var(name=Identifier('y'), sort=INT)
    letbinding_term = LetBinding(
        var_bindings=[[x, x_term], [y, y_term]],
        let_term=Expr(
            name=Identifier("+"),
            subterms=[local_x, local_y],
            sort=INT
        ),
        sort=INT,
    )
    assert str(letbinding_term) == smtlibv2_str
    smtlibv2_str = '(+ (- a b) (* a b))'
    eliminate_let(letbinding_term)
    assert str(letbinding_term) == smtlibv2_str
    # nested let
    # (let ((x (let ((r (* a 2)) (m (- b 4))) (mod r m))) (y (* a b))) (+ x y))
    smtlibv2_str = '(let ((x (let ((r (* a 2)) (m (- b 4))) (mod r m))) (y (* a b))) (+ x y))'
    r = 'r'
    m = 'm'
    r_term = Expr(
        name=Identifier("*"),
        subterms=[
            a,
            Const(name=SpecConstant(SpecConstType.NUMERAL, 2)), 
        ],
        sort=INT
    )
    m_term = Expr(
        name=Identifier("-"),
        subterms=[
            b,
            Const(name=SpecConstant(SpecConstType.NUMERAL, 4)), 
        ],
        sort=INT
    )
    local_r = Var(name=Identifier('r'), sort=INT)
    local_m = Var(name=Identifier('m'), sort=INT)
    local_x = Var(name=Identifier('x'), sort=INT)
    local_y = Var(name=Identifier('y'), sort=INT)
    x_term = LetBinding(
        var_bindings=[[r, r_term], [m, m_term]],
        let_term=Expr(
            name=Identifier("mod"),
            subterms=[local_r, local_m],
            sort=INT
        ),
        sort=INT,
    )
    letbinding_term = LetBinding(
        var_bindings=[[x, x_term], [y, y_term]],
        let_term=Expr(
            name=Identifier("+"),
            subterms=[local_x, local_y],
            sort=INT
        ),
        sort=INT,
    )
    assert str(letbinding_term) == smtlibv2_str
    # (let ((x (let ((r (* a 2)) (m (- b 4))) (mod r m))) (y (* a b))) (+ x y)) ==>
    # (let ((x (mod (* a 2) (- b 4))) (y (* a b))) (+ x y)) ==>
    # (+ (mod (* a 2) (- b 4)) (* a b))
    smtlibv2_str = '(+ (mod (* a 2) (- b 4)) (* a b))'
    eliminate_let(letbinding_term)
    assert str(letbinding_term) == smtlibv2_str


def test_match_let():
    adt_List = create_adt_List()
    # (match l1 ((nil l2) ((cons h t) (cons h (append t l2)))))
    smtlibv2_str = '(match l1 ((nil l2) ((cons h t) (cons h (append t l2)))))'
    Int_List = adt_List.get_parametric_instance({T: INT})
    lst1 = Var(name=Identifier('l1'), sort=Int_List)
    lst2 = Var(name=Identifier('l2'), sort=Int_List)
    h = 'h'
    t = 't'
    pattern1 = Pattern(nil_name)
    pattern2 = Pattern(cons_name, [h, t])
    term1 = lst2
    term2 = Expr(
        name=Identifier(cons_name),
        subterms=[
            Var(name=h, sort=INT),
            Expr(
                name=Identifier('append'),
                subterms=[
                    Var(name=t, sort=Int_List),
                    lst2
                ],
                sort=Int_List
            )
        ],
        sort=Int_List
    )
    match_cases = [[pattern1, term1], [pattern2, term2]]
    match_term = Match(
        term=lst1,
        match_cases=match_cases,
        sort=Int_List,
    )
    assert str(match_term) == smtlibv2_str 
    # (ite ((_ is nil) l1) l2 (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))))
    eliminate_match(match_term)
    smtlibv2_str = '(ite ((_ is nil) l1) l2 (let ((h (car l1)) (t (cdr l1))) (cons h (append t l2))))'
    assert str(match_term) == smtlibv2_str
    # (ite ((_ is nil) l1) l2 (cons (car l1) (append (cdr l1) l2)))
    eliminate_let(match_term)
    smtlibv2_str = '(ite ((_ is nil) l1) l2 (cons (car l1) (append (cdr l1) l2)))'
    assert str(match_term) == smtlibv2_str