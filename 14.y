%{
 #include<stdio.h>
 int yylex(void);
 void yyerror(char *);
%}

%token digit
%left '+' '-'
%left '*' '/'

%%
S:E'\n' {printf("\n");}
E:E'+'E {printf("+");}
 |E'-'E {printf("-");}
 |E'*'E {printf("*");}
 |E'/'E {printf("/");}
 |digit {printf("%d",yylval);}
 |'-'E {printf("-");}
 | 'C'E')' 
%%

int main()
{
   yyparse();
}
void yyerror(char * err)
{
  printf("Erorr=%s",err);
}
