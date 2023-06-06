%{
   #include<stdio.h>
%}
%s aaa aab aba abb baa bab bba D
%%
<INITIAL>\n printf("REJECTED"); BEGIN INITIAL;
<INITIAL>a BEGIN bba;
<INITIAL>b BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN D; 

<aaa>\n printf("ACCEPTED"); BEGIN INITIAL;
<aaa>a BEGIN aaa;
<aaa>b BEGIN aab;
<aaa>[^ab\n] BEGIN D; 

<aab>\n printf("ACCEPTED"); BEGIN INITIAL;
<aab>a BEGIN aba;
<aab>b BEGIN abb;
<aab>[^ab\n] BEGIN D; 

<aba>\n printf("ACCEPTED"); BEGIN INITIAL;
<aba>a BEGIN baa;
<aba>b BEGIN bab;
<aba>[^ab\n] BEGIN D; 

<abb>\n printf("ACCEPTED"); BEGIN INITIAL;
<abb>a BEGIN bba;
<abb>b BEGIN INITIAL;
<abb>[^ab\n] BEGIN D; 

<baa>\n printf("REJECTED"); BEGIN INITIAL;
<baa>a BEGIN aaa;
<baa>b BEGIN aab;
<baa>[^ab\n] BEGIN D; 

<bab>\n printf("REJECTED"); BEGIN INITIAL;
<bab>a BEGIN aba;
<bab>b BEGIN abb;
<bab>[^ab\n] BEGIN D; 

<bba>\n printf("REJECTED"); BEGIN INITIAL;
<bba>a BEGIN baa;
<bba>b BEGIN bab;
<bba>[^ab\n] BEGIN D; 

<D>\n printf("REJECTED"); BEGIN INITIAL;
<D>a BEGIN D;
<D>b BEGIN D;
<D>[^ab\n] BEGIN D; 

%%
int yywrap(){}
int main()
{
   yylex();
}
