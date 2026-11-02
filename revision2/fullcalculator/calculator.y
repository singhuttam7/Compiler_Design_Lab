%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%union{
int value;
}
%token <value> NUMBER
%type <value> expression
%type <value> input

%left '+' '-'
%left '*' '/'
%right UMINUS

%%
input: 
  expression
  {
  printf("Result: %d\n", $1);
  }
  ;
expression: 
  expression '+' expression
  {
  $$ = $1 + $3;
  }
  | expression '-' expression
  {
  $$ = $1 - $3;
  }
  | expression '*' expression
  {
  $$ = $1 * $3;
  }
  | expression '/' expression
  {
  if($3 == 0){
  printf("Division by Zero is not defined.\n");
  YYERROR;
  }
  $$ = $1 / $3;
  }
  | '-' expression %prec UMINUS
  {
  $$ = -$2;
  }
  | '(' expression ')'
  {
  $$ = $2;
  }
  | NUMBER
  {
  $$ = $1;
  }
  ;
%%
int main(){
printf("Enter the multiple expressions:\n");
yyparse();
return 0;
}
int yyerror(const char *s){
printf("Invalid Expression\n");
return 1;
}

