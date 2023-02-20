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
PS_ContinuedExecution
    : 'continued-execution'
    ;
PS_Error
    : 'error'
    ;
PS_False
    : 'false'
    ;
PS_ImmediateExit
    : 'immediate-exit'
    ;
PS_Incomplete
    : 'incomplete'
    ;
PS_Logic
    : 'logic'
    ;
PS_Memout
    : 'memout'
    ;
PS_Sat
    : 'sat'
    ;
PS_Success
    : 'success'
    ;
PS_Theory
    : 'theory'
    ;
PS_True
    : 'true'
    ;
PS_Unknown
    : 'unknown'
    ;
PS_Unsupported
    : 'unsupported'
    ;
PS_Unsat
    : 'unsat'
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

GRW_Seeds
    : 'seeds'
    ;
GRW_Mutant
    : 'mutant'
    ;
GRW_Replace
    : 'replace'
    ;
GRW_Algorithm
    : 'algorithms'
    ;
GRW_Assert
    : 'assert'
    ;
GRW_Vars
    : 'vars'
    ;
GRW_Funs
    : 'funs'
    ;


Numeral
    : '0'
    | [1-9] Digit*
    ;

Binary:
    BinaryDigit+
    ;

HexDecimal
    : '#x' HexDigit HexDigit HexDigit HexDigit
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

RS_Model //  for model responses
    : 'model'
    ;

UndefinedSymbol:
    Sym (Digit | Sym)*;


// Parser Rules Start

// Starting rule(s)

start
    : seeds_dec mutant_dec replace_dec* algorithms_dec? assert_dec ;

simpleSymbol
    : predefSymbol
    | UndefinedSymbol
    ;

quotedSymbol
    : QuotedSymbol
    ;

predefSymbol
    : PS_Not
    | PS_Bool
    | PS_ContinuedExecution
    | PS_Error
    | PS_False
    | PS_ImmediateExit
    | PS_Incomplete
    | PS_Logic
    | PS_Memout
    | PS_Sat
    | PS_Success
    | PS_Theory
    | PS_True
    | PS_Unknown
    | PS_Unsupported
    | PS_Unsat
    ;

predefKeyword
    : PK_Var
    | PK_Cons
    | PK_Snippet
    | PK_Seed
    ;

status
    : PS_Sat
    | PS_Unsat
    | PS_Unknown
    ; 

symbol
    : simpleSymbol
    | quotedSymbol
    ;

numeral
    : Numeral
    ;

decimal
    : Decimal
    ;

hexadecimal
    : HexDecimal
    ;

binary
    : Binary
    ;

string
    : String
    ;

keyword
    : predefKeyword
    | Colon simpleSymbol
    ;

// S-expression

spec_constant
    : numeral
    | decimal
    | hexadecimal
    | binary
    | string
    ;


s_expr
    : spec_constant
    | symbol
    | keyword
    | ParOpen s_expr* ParClose
    ;

// Identifiers

index
    : numeral
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

qual_identifer
    : identifier
    | ParOpen GRW_As identifier sort ParClose
    ;

var_binding
    : ParOpen symbol term ParClose
    ;

sorted_var
    : ParOpen symbol sort ParClose
    ;

pattern
    : symbol
    | ParOpen symbol symbol+ ParClose
    ;

match_case
    : ParOpen pattern term ParClose
    ;

term
    : spec_constant
    | qual_identifer
    | ParOpen qual_identifer term+ ParClose
    | ParOpen GRW_Let ParOpen var_binding+ ParClose term ParClose
    | ParOpen GRW_Forall ParOpen sorted_var+ ParClose term ParClose
    | ParOpen GRW_Exists ParOpen sorted_var+ ParClose term ParClose
    | ParOpen GRW_Match term ParOpen match_case+ ParClose ParClose
    | ParOpen GRW_Exclamation term attribute+ ParClose
    ;

// Metamorphic Relation Declarations


formula_dec
    : symbol status
    ;

vars_dec
    : GRW_Vars ( ParOpen symbol ( symbol | attribute ) ParClose )+
    ;

funs_dec
    : GRW_Funs ( term term )+
    ;


seeds_dec
    : ParOpen GRW_Seeds (ParOpen formula_dec ParClose)+ ParClose
    ;

mutant_dec
    : ParOpen GRW_Mutant formula_dec ParClose
    ;

replace_dec
    : ParOpen GRW_Replace ParOpen vars_dec ParClose ParOpen funs_dec ParClose ParClose
    ;

assert_dec
    : ParOpen GRW_Assert term ParClose
    ;

// Extended Algorithm Declarations

algorithms_dec
    : ParOpen GRW_Algorithm ( ParOpen string symbol attribute ParClose )+ ParClose
    ;

// Parser Rules End

WS  :  [ \t\r\n]+ -> skip
    ;