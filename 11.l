%{
#include<stdio.h>
%}
%s inte iden flo floa D
%%
<INITIAL>[A-Za-z_] BEGIN iden;
<INITIAL>[0-9] BEGIN inte;
<INITIAL>[.] BEGIN D;
<INITIAL>[\n] printf("NOT accepted"); BEGIN INITIAL;
<INITIAL>[^A-Za-z0-9] BEGIN D;

<inte>[A-Za-z_] D;
<inte>[0-9] BEGIN inte;
<inte>[.] BEGIN flo;
<inte>[\n] printf("integer"); BEGIN INITIAL;
<inte>[^A-Za-z0-9] BEGIN D;

<iden>[A-Za-z_] BEGIN iden;
<iden>[0-9] BEGIN D;
<iden>[.] BEGIN D;
<iden>[\n] printf("identifieer"); BEGIN INITIAL;
<iden>[^A-Za-z0-9] BEGIN D;

<flo>[A-Za-z_] BEGIN D;
<flo>[0-9] BEGIN floa;
<flo>[.] BEGIN D;
<flo>[\n] printf("NOT accepted"); BEGIN INITIAL;
<flo>[^A-Za-z0-9] BEGIN D;

<floa>[A-Za-z_] BEGIN D;
<floa>[0-9] BEGIN floa;
<floa>[.] BEGIN D;
<floa>[\n] printf("float"); BEGIN INITIAL;
<floa>[^A-Za-z0-9] BEGIN D;

<D>[A-Za-z_] BEGIN D;
<D>[0-9] BEGIN D;
<D>[.] BEGIN D;
<D>[\n] printf("NOT accepted"); BEGIN INITIAL;
<D>[^A-Za-z0-9] BEGIN D;

 
%%

int yywrap(){}
int main()
{
  yylex();
}
