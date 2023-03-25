grammar SMTMR;

// Lexer Rules Start


Comment
    : Semicolon ~[\r\n]* -> skip
    ;

ParOpen
    : '('
    ;

ParClose
    : ')'
    ;

Semicolon
    : ';'
    ;

String
    : '"' (PrintableCharNoDquote | WhiteSpaceChar)+ '"'
    ;

QuotedSymbol:
    '|' (PrintableCharNoBackslash | WhiteSpaceChar)+ '|'
    ;

// Predefined Symbols


PS_Not
    : 'not'
    ;
PS_Bool
    : 'Bool'
    ;
PS_False
    : 'false'
    ;
PS_Logic
    : 'logic'
    ;
PS_Theory
    : 'theory'
    ;
PS_True
    : 'true'
    ;
PS_Sat
    : 'sat'
    ;
PS_Unsat
    : 'unsat'
    ;
PS_Unknown
    : 'unknown'
    ;


// RESERVED Words

// General reserved words

GRW_Exclamation
    : '!'
    ;
GRW_Underscore
    : '_'
    ;
GRW_As
    : 'as'
    ;
GRW_Binary
    : 'BINARY'
    ;
GRW_Decimal
    : 'DECIMAL'
    ;
GRW_Exists
    : 'exists'
    ;
GRW_Hexadecimal
    : 'HEXADECIMAL'
    ;
GRW_Forall
    : 'forall'
    ;
GRW_Let
    : 'let'
    ;
GRW_Match
    : 'match'
    ;
GRW_Numeral
    : 'NUMERAL'
    ;
GRW_Par
    : 'par'
    ;
GRW_String
    : 'string'
    ;

GRW_Seed
    : 'seed'
    ;
GRW_Mutant
    : 'mutant'
    ;
GRW_Notation
    : 'notation'
    ;
GRW_SubstTemplate
    : 'subst-template'
    ;
GRW_Method
    : 'method'
    ;
GRW_Fuse
    : 'fuse'
    ;


Numeral
    : '0'
    | [1-9] Digit*
    ;

Binary
    : '#0' BinaryDigit+
    ;

HexDecimal
    : '#x' HexDigit+
    ;

Decimal
    : Numeral '.' '0'* Numeral
    ;


fragment HexDigit
    : '0' .. '9' | 'a' .. 'f' | 'A' .. 'F'
    ;


Colon
    : ':'
    ;

fragment Digit
    : [0-9]
    ;

fragment Sym
    : 'a'..'z'
    | 'A' .. 'Z'
    | '+'
    | '='
    | '/'
    | '*'
    | '%'
    | '?'
    | '!'
    | '$'
    | '-'
    | '_'
    | '~'
    | '&'
    | '^'
    | '<'
    | '>'
    | '@'
    | '.'
    ;


fragment BinaryDigit
    : [01]
    ;

fragment PrintableChar
    : '\u0020' .. '\u007E'
    | '\u0080' .. '\uffff'
    | EscapedSpace
    ;

fragment PrintableCharNoDquote
    : '\u0020' .. '\u0021'
    | '\u0023' .. '\u007E'
    | '\u0080' .. '\uffff'
    | EscapedSpace
    ;

fragment PrintableCharNoBackslash
    : '\u0020' .. '\u005B'
    | '\u005D' .. '\u007B'
    | '\u007D' .. '\u007E'
    | '\u0080' .. '\uffff'
    | EscapedSpace
    ;

fragment EscapedSpace
    : '""'
    ;

fragment WhiteSpaceChar
    : '\u0009'
    | '\u000A'
    | '\u000D'
    | '\u0020'
    ;

// Lexer Rules End

// Predefined Keywords

PK_Gen
    : ':gen'
    ;
PK_Var
    : ':var'
    ;
PK_Cons
    : ':cons'
    ;
PK_Snippet
    : ':snippet'
    ;
PK_Seed
    : ':seed'
    ;
PK_Free
    : ':free'
    ;
PK_Bound
    : ':bound'
    ;

UndefinedSymbol:
    Sym (Digit | Sym)*;

// Parser Rules Start

// Starting rule(s)

start
    : seed_dec+ mutant_dec ( notation_dec | substTemplate_dec | method_dec )* fuse_dec EOF;

simpleSymbol
    : predefSymbol
    | UndefinedSymbol
    ;

predefSymbol
    : PS_Not
    | PS_Bool
    | PS_False
    | PS_Logic
    | PS_Theory
    | PS_True
    | PS_Sat
    | PS_Unsat
    | PS_Unknown
    ;

predefKeyword
    : PK_Gen
    | PK_Var
    | PK_Cons
    | PK_Snippet
    | PK_Seed
    | PK_Free
    | PK_Bound
    ;

undefinedKeyword
    : Colon simpleSymbol
    ;

symbol
    : simpleSymbol
    | QuotedSymbol
    ;

keyword
    : predefKeyword
    | undefinedKeyword
    ;

// Status

status
    : PS_Sat
    | PS_Unsat
    | PS_Unknown
    ;

// Boolean value

b_value
    : PS_True
    | PS_False
    ;

// S-expression

spec_constant
    : Numeral
    | Decimal
    | HexDecimal
    | Binary
    | String
    | b_value
    ;


s_expr
    : spec_constant
    | symbol
    | keyword
    | ParOpen s_expr* ParClose
    ;

// Identifiers

index
    : Numeral
    | symbol
    ;

identifier
    : symbol
    | ParOpen GRW_Underscore symbol index+ ParClose
    ;

// Attributes

attribute_value
    : spec_constant
    | symbol
    | ParOpen s_expr* ParClose
    ;

attribute
    : keyword
    | keyword attribute_value
    ;

// Sorts

sort
    : identifier
    | ParOpen identifier sort+ ParClose
    ;


// Terms and Formulas

qual_identifier
    : identifier
    | ParOpen GRW_As identifier sort ParClose
    ;

// var_binding
//     : ParOpen symbol term ParClose
//     ;

sorted_var
    : ParOpen symbol sort ParClose
    ;

// pattern
//     : symbol
//     | ParOpen symbol symbol+ ParClose
//     ;

// match_case
//     : ParOpen pattern term ParClose
//     ;

term
    : spec_constant
    | qual_identifier
    | ParOpen qual_identifier term+ ParClose
    // | ParOpen GRW_Let ParOpen var_binding+ ParClose term ParClose
    // | ParOpen GRW_Forall ParOpen sorted_var+ ParClose term ParClose
    // | ParOpen GRW_Exists ParOpen sorted_var+ ParClose term ParClose
    // | ParOpen GRW_Match term ParOpen match_case+ ParClose ParClose
    // | ParOpen GRW_Exclamation term attribute+ ParClose
    ;

boolean_term_template
    : symbol 
    | ParOpen symbol boolean_term_template+ ParClose
    ;

// Metamorphic Relation Declarations

formula_dec
    : symbol status 
    ;

subst_pair
    : ParOpen term term ParClose
    ;

seed_dec
    : ParOpen GRW_Seed formula_dec ParClose
    ;

mutant_dec
    : ParOpen GRW_Mutant formula_dec ParClose
    ;

notation_dec
    : ParOpen GRW_Notation symbol ( symbol | attribute ) attribute* ParClose
    ;

substTemplate_dec
    : ParOpen GRW_SubstTemplate attribute* ParOpen sorted_var+ ParClose ParOpen subst_pair+  ParClose ParClose
    ;

fuse_dec
    : ParOpen GRW_Fuse boolean_term_template ParClose
    ;

// Extended Methods Declarations

method_dec
    : ParOpen GRW_Method String symbol attribute ParClose
    ;

// Parser Rules End

WS  :  [ \t\r\n]+ -> skip
    ;