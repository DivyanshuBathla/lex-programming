%{
   #include<stdio.h>
%}
%%
-?[0-9]+ {printf("Integer=%s\n",yytext);}
-?[0-9]+"."[0-9]* {printf("float=%s\n",yytext);}
%%
int yywrap(){}
int main()
{
   yylex();
   
}
