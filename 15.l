%{
#include <stdlib.h>
#include "y.tab.h"
int yylval;
%}

%%

[0-9]   { yylval = atoi(yytext); return digit; }
[a-z]   { yylval = yytext[0] - 'a'; return id; }
[-+*/()=\n]  { return *yytext; }
. ;

%%

int yywrap(void) {}

