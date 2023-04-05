%{
#include<stdio.h>
int linecnt,spacecnt,tabsspace,rest;
%}
%%
\n {linecnt++;}
" " {spacecnt++;}
\t {tabsspace++;}
[^\n\t" "] {rest++;}
%%
int yywrap(){}
int main()
{
  yylex();
  printf("linecnt=%d",linecnt);
  
  printf("spacecnt=%d",spacecnt);
  
  printf("tab=%d",tabsspace);
  
  printf("restcnt=%d",rest);
}
