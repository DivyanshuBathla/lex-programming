%{
   #include<stdio.h>
   int cnt;
%}
%%
[_a-zA-z][_a-zA-Z0-9]* {cnt++;printf("Valid identfier\n");}
[0-9][_a-zA-Z0-9]* {printf("\nInvalid\n");}
%%
int yywrap(){}
int main()
{
   yylex();
   printf("t=%d",cnt);
}
