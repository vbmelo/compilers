grammar PenLang;

// Regras principais
program: statement+;

statement
    : penDeclaration
    | penAssignment
    | penCommand
    | expression
    | 'print' expression
    | 'read' ID
    ;

penDeclaration
    : 'define' 'pen' ID '{' penAttributes '}'
    ;

penAssignment
    : 'pen' ID '=' 'new' ID
    ;

penCommand
    : ID 'down'
    | ID 'up'
    | ID 'forward' NUMBER
    | ID 'backward' NUMBER
    | ID 'left' ANGLE
    | ID 'right' ANGLE
    | ID 'setPosition' '(' NUMBER ',' NUMBER ')'
    | ID 'setOrientation' ANGLE
    ;

penAttributes
    : (penAttribute ';')+
    ;

penAttribute
    : 'color' '=' COLOR
    | 'position' '=' '(' NUMBER ',' NUMBER ')'
    | 'orientation' '=' ANGLE
    | 'thickness' '=' NUMBER
    | 'pressure' '=' PRESSURE
    ;

expression
    : NUMBER
    | STRING
    | ID
    | '(' expression ')'
    | expression op=('*'|'/'|'+') expression
    | expression op=('<'|'>'|'=='|'>='|'<='|'!='|'&&'|'||') expression
    ;

COLOR: 'green' | 'blue' | 'red' | 'yellow' | 'black';
ANGLE: NUMBER '°';
PRESSURE: '-'? NUMBER ('.' NUMBER)?;
ID: [a-zA-Z_][a-zA-Z_0-9]*;
STRING: '"' .*? '"';
NUMBER: [0-9]+ ('.' [0-9]+)?;
WS: [ \t\r\n]+ -> skip;
