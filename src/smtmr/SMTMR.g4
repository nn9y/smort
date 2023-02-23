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


// Status Symbols


ST_Sat
    : 'sat'
    ;
ST_Unsat
    : 'unsat'
    ;
ST_Unknown
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
GRW_SubstTerm
    : 'subst-term'
    ;
GRW_Method
    : 'method'
    ;
GRW_Assert
    : 'assert'
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

PK_Gen
    : ':gen'
    ;
PK_Fix
    : ':fix'
    ;
PK_Snippet
    : ':snippet'
    ;
PK_Seed
    : ':seed'
    ;

UndefinedSymbol:
    Sym (Digit | Sym)*;

// Parser Rules Start

// Starting rule(s)

start
    : seed_dec+ mutant_dec ( notation_dec | substTerm_dec | method_dec )* assert_dec EOF;

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
    | PS_False
    | PS_Logic
    | PS_Theory
    | PS_True
    ;

predefKeyword
    : PK_Gen
    | PK_Fix
    | PK_Snippet
    | PK_Seed
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

// Status

status
    : ST_Sat
    | ST_Unsat
    | ST_Unknown
    ;

// Metamorphic Relation Declarations

formula_dec
    : symbol status 
    ;

seed_dec
    : ParOpen GRW_Seed formula_dec ParClose
    ;

mutant_dec
    : ParOpen GRW_Mutant formula_dec ParClose
    ;

notation_dec
    : ParOpen GRW_Notation symbol ( symbol | attribute ) ParClose
    ;

substTerm_dec
    : ParOpen GRW_SubstTerm sort term term ParClose
    ;

assert_dec
    : ParOpen GRW_Assert term ParClose
    ;

// Extended Methods Declarations

method_dec
    : ParOpen GRW_Method string symbol attribute ParClose
    ;

// Parser Rules End

WS  :  [ \t\r\n]+ -> skip
    ;