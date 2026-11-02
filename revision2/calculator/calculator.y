%{
#include<stdio.h>
int yylex(void);
int yyerror(const char *s);
%}
%token NUMBER
%%
input: 
  | input expression '\n'
  ;
expression: 
  NUMBER '+' NUMBER
  {
  printf("Valid Expression\n");
  }
  
  | NUMBER '-' NUMBER
  {
  printf("Valide Expression\n");
  }
  | NUMBER '*' NUMBER
  {
  printf("valid Expression\n");
  }
  | NUMBER '/' NUMBER
  {
  printf("Valid Expression\n");
  }
  ;
%%
int main(){
printf("Enter the expression: \n");
yyparse();
return 0;
}
int yyerror(const char *s){
printf("Invalid Expression.\n");
return 1;
}


