%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int yylex();
void yyerror(const char* message);
%}

%token TRUE FALSE OR AND NOT LPAREN RPAREN

%left OR
%left AND
%right NOT

%%
program : bexpr '\n'     {printf("Resultado: %s\n", $1 ? "true" : "false");}   

bexpr: bexpr OR bterm     { $$ = $1 || $3; }
     | bterm              { $$ = $1; }
     ;

bterm: bterm AND bfactor  { $$ = $1 && $3; }
     | bfactor           { $$ = $1; }
     ;

bfactor: NOT bfactor      { $$ = !$2; }
       | LPAREN bexpr RPAREN  { $$ = $2; }
       | TRUE              { $$ = 1; }
       | FALSE             { $$ = 0; }
       ;
%%

int main() {
    printf("Enter the expression: ");
    yyparse();
    return 0;
}

void yyerror(const char* message) {
    printf("Error: %s\n", message);
    exit(1);
}