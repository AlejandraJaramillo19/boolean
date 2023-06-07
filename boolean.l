%{
#include "y.tab.h"
%}

%%

"true"      { return TRUE; }
"false"     { return FALSE; }
"or"        { return OR; }
"and"       { return AND; }
"not"       { return NOT; }
"("         { return LPAREN; }
")"         { return RPAREN; }
\t          { /* Ignorar espacios en blanco */ }
\n          { return '\n'; }
.           { }


%%

int yywrap() {
    return 1;
}