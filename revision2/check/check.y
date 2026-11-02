%{
#include<stdio.h>
#include<stdlib.h>

int yylex(void);
int yyerror(const char* s);
%}
%token ID
%%
input: 
  E '\n' {
  printf("Valid Expression\n");
  }
  ;
E:
  E '+' T 
  | T
  ;
T:
  T '*' F
  | F
  ;
F:
  '(' E ')'
  | ID
  ;
%%
int main(){
printf("Enter the grammar: \n");
yyparse();
return 0;
}
int yyerror(const char* s){
printf("Invalid Expression\n");
return 0;
}
