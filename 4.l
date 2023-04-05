%{
   #include<stdio.h>
  int cnt;
%}

%%
"while"|"for"|"do"|"int"|"float" {cnt++;printf("LOOps=%s\n",yytext);}

[_a-zA-Z][_a-zA-Z0-9]* {cnt++;printf("identifier%s\n",yytext);}



"{"|"}" {cnt++;printf("keywords=%s\n",yytext);}
. ;
%%
int yywrap() {}
int main()
{
  yylex();
  printf("Total cnt=%d",cnt);
}
