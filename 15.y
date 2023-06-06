%{
  #include<stdio.h>
  int yylex(void);
  void yyerror(char *);
  int val[26];
  
%}
%token digit
%token id
%left '+' '-'
%left '*' '/'

%%
P:P S'\n'
  |;
S:E{printf("The output is %d\n",$1);}
  |id'='E {val[$1]=$3;}
  ;
E:E'+'E {$$=$1+$3;}
  |E'*'E {$$=$1*$3;}
  |E'-'E {$$=$1-$3;}
  |E'/'E {$$=$1/$3;}
  |'C'E')' {$$=$2;}
  |digit {$$=$1;}
  |id {$$=val[$1];}
  ;

%%
int main()
{
  yyparse();
}
void yyerror(char *c)
{
   printf("%s",c);
}
