parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

start   : st*EOF;

st  :   DEVICE1 device1Statements | DEVICE2 device2Statements;

device1Statements: calculation | interaction1 | ifStatement | functionDefinition ;

device2Statements: calculation | interaction2 | ifStatement | functionCall ;  

calculation: CALCULATE ID EQ expr SEMI; 

interaction1: SEND expr LCLOSE SEMI;

interaction2: RECIEVE expr LCLOSE SEMI;

functionDefinition: FUNCTION ID LOPEN parameterList? LCLOSE CBOPEN statement* CBCLOSE;  

parameterList: TYPE ID (COMMA TYPE ID)*; // PRMS BUT ALSO DECLARATION

functionCall: ID LOPEN prms? LCLOSE SEMI;  

prms: ID (COMMA ID)*;  

ifStatement: IF LOPEN expr LCLOSE THEN CBOPEN statement* CBCLOSE (ELSE CBOPEN statement* CBCLOSE)?;  

loop: WHILE LOPEN expr LCLOSE DO CBOPEN statement* CBCLOSE SEMI;

assignStatement :   ID EQ value;

value   :   ID | INT | STRING | FALSE | TRUE;

statement  :     PRINT STRING SEMI 
             | BREAK SEMI       
             | loop               
             | functionDefinition  
             | functionCall  
             | ifStatement  
             | assignStatement
             ;

expr   :    INT expr2
           | ID expr2
           | NOT expr expr2
           | LOPEN expr LCLOSE expr2
           ;

expr2  :    PLUS expr 
          | MINUS expr 
          | MUL expr 
          | DIV expr 
          | REM expr 
          | POW expr 
          | OR expr 
          | AND expr
          | EQ expr 
          | NEQ expr 
          | GE expr 
          | LE expr 
          | GREATER expr 
          | LOWER expr 
          | 
          ;


TYPE  :  'int' | 'string' | 'bool';

AND  :  '&&';
OR  :  '||';
NOT  :  '!' ;

PLUS  :  '+' ;
MINUS  :  '-' ;
MUL  :  '*' ;
DIV  :  '/' ;
REM  :  '%' ;
POW  :  '^' ;

EQ  :  '==';
NEQ  :  '!=';
GE  :  '>=';
LE  :  '<=';
GREATER :       '>' ;
LOWER   :       '<' ;
ASSIGN  :       '=' ;
COMMA   :       ',' ;
SEMI    :       ';' ;
COLON  :  ':' ;
DQUOTE  :       '"' ;
LOPEN   :       '(' ;
LCLOSE  :       ')' ;
CBOPEN  :       '{' ;
CBCLOSE :       '}' ;
BOPEN   :       '[' ;
BCLOSE  :       ']' ;

IF  :  'if'    ;
THEN  :  'then'    ;
ELSE    :  'else'    ;

WHILE  :  'while'   ;
DO  :  'do'      ;

PRINT  :  'print'   ;
RETURN  :  'returns'  ;

TRUE  :  'true'    ;
FALSE  :  'false'   ;


BREAK    :  'break'     ;
FUNCTION  :  'function'  ;

DEVICE1 : 'device1';
DEVICE2 : 'device2';
CALCULATE : 'calculate';
SEND : 'send to device2(';
RECIEVE : 'receive from device1(';

ID      :  ('a'..'z'|'A'..'Z') ('_'|'a'..'z'|'A'..'Z'|'0'..'9')*;
INT     :  ('0'..'9')+             ;
STRING  :  '"' ('a'..'z'|'A'..'Z'|'0'..'9'|'_'|'*')* '"'  ;
WS: [ \t\n\r\f]+ -> skip ;