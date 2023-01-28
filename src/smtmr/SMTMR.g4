grammar SMTMR;

file
    : seeds_decl mutant_decl replace_vars_decl? replace_preds_decl? algorithms_decl? assert_decl ;

seeds_decl
    : PAROPEN SEEDS (PAROPEN formula_decl PARCLOSE)+ PARCLOSE;

mutant_decl
    : PAROPEN MUTANT formula_decl PARCLOSE;

replace_vars_decl
    : PAROPEN REPLACE_VARS ID status PARCLOSE;
    
replace_preds_decl
    : PAROPEN REPLACE_PREDS ID status PARCLOSE;

algorithms_decl
    : PAROPEN ALGORITHMS status PARCLOSE;

assert_decl
    : PAROPEN ASSERT term PARCLOSE;

status
    : SAT | UNSAT | UNKNOWN ;

formula_decl
    : ID status ;

attribute_value
    : spec_constant
    | symbol
    | ParOpen s_expr* ParClose
    ;

attribute
    : keyword
    | keyword attribute_value
    ;

PAROPEN: '(' ;
PARCLOSE: ')' ;
SEEDS: 'seeds' ;
MUTANT: 'mutant' ;
REPLACE_VARS: 'replace-vars' ;
REPLACE_PREDS: 'replace-preds' ;
ALGORITHMS: 'algorithms' ;
ASSERT: 'assert' ;

SAT: 'sat' ;
UNSAT: 'unsat' ;
UNKNOWN: 'unknown' ;

ID: (LETTER|'_') (LETTER|DIGIT|'_')* ;

fragment LETTER : [a-zA-Z] ;
fragment DIGIT : '0'..'9' ;