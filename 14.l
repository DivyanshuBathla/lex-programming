%{
 #include<stdlib.h>
 #include"y.tab.h"
 int yylval;
%}
%%
[0-9]+ {yylval=atoi(yytext); return digit;}
[-+*/\n] return *yytext;
.;
%%
int yywrap(){};
