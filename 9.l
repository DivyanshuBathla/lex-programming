%{
#include<stdio.h>
%}

%s A B C F
%%

<INITIAL>\n printf("Accepted"); BEGIN INITIAL;
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN C;
<INITIAL>[^ab\n] BEGIN F;

<A>\n printf("Rejected"); BEGIN INITIAL;
<A>a BEGIN INITIAL;
<A>b BEGIN B;
<A>[^ab\n] BEGIN F;

<B>\n printf("Rejected"); BEGIN INITIAL;
<B>a BEGIN C;
<B>b BEGIN A;
<B>[^ab\n] BEGIN F;

<C>\n printf("Rejected"); BEGIN INITIAL;
<C>a BEGIN B;
<C>b BEGIN INITIAL;
<C>[^ab\n] BEGIN F;

<F>\n printf("Rejected"); BEGIN INITIAL;
<F>a BEGIN F;
<F>b BEGIN F;
<F>[^ab\n] BEGIN F;
%%

int yywrap(){}
int main()
{
   yylex();
}
