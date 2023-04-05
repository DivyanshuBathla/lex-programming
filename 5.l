%{
   #include<stdio.h>
   int ch=0,ws=0,words=0;
%}

%%
[" "] {ws++;words++;}
[\t\n] {words++;}
[^\t\n] {ch++;}

%%

int yywrap(){}
int main()
{
   extern FILE *yyin;
   yyin=fopen("input.txt","r");
   yyout=fopen("output.txt","w");
   yylex();
   printf("ch=%d ws=%d words=%d",ch,ws,words);
}
