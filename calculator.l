%{
#include "calculator.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT   [0-9]
FLOAT   {DIGIT}+\.{DIGIT}*([eE][-+]?{DIGIT}+)?

%%
[ \t]+                  ;   // Whitespace yoksay
{FLOAT}                 { yylval.fval = atof(yytext); return NUMBER; }
{DIGIT}+                { yylval.fval = atof(yytext); return NUMBER; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return TIMES; }
"/"                     { return DIVIDE; }
"^"|"**"                { return POWER; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
\n                      { return '\n'; }  // DÜZELTİLDİ: return 0 değil!
.                       { printf("Invalid character: %s\n", yytext); exit(1); }
%%

int yywrap() { return 1; }
