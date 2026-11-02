%{
#include<stdio.h>
int yylex(void);
int yyerror(const char *s);
%}
%union {
int value;
}
%token <value> NUMBER
%type <value> Expression
%%
Expression:
  NUMBER '+' NUMBER{
  $$ = $1 + $3;
  printf("Result: %d\n", $$);
  }
  ;
%%
int main(){
printf("Enter the expression\n");
yyparse();
return 0;
}
int yyerror(const char *s){
printf("Invalid Expression\n");
return 1;
}
