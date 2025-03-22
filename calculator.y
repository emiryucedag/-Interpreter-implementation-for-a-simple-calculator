%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
int yyerror(const char *);
%}

%union {
    float fval;
}

%token <fval> NUMBER
%token PLUS MINUS TIMES DIVIDE POWER
%token LPAREN RPAREN

%type <fval> expr

%%

input:
    /* empty */
    | input expr '\n' { printf("= %.4f\n", $2); }
    ;

expr:
      expr PLUS expr    { $$ = $1 + $3; }
    | expr MINUS expr   { $$ = $1 - $3; }
    | expr TIMES expr   { $$ = $1 * $3; }
    | expr DIVIDE expr  {
                          if ($3 == 0) {
                              printf("Error: Division by zero\n");
                              exit(1);
                          }
                          $$ = $1 / $3;
                        }
    | expr POWER expr   { $$ = pow($1, $3); }   // BONUS: Üs alma
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER            { $$ = $1; }
    ;

%%

int main() {
    printf("Enter expressions (Ctrl+D to quit):\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
    return 1;
}
