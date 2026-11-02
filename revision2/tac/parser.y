%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int yylex(void);
int yyerror(char* str);

int temp = 1;
int reg = 1;

char* generate(char* a, char op, char* b){
char* result = malloc(20);

sprintf(result, "t%d", temp);
printf("%s = %s %c %s -> R%d\n", result, a, op, b, reg);

temp++;
reg++;

return result;
}

%}
%union{
char* str;
}
%token <str> ID NUM
%type <str> expr

%left '+' '-'
%left '*' '/'
%%
input: 
  expr
  {
  printf("Valid Expression\n");
  }
  ;
expr:
  ID 
  {
  $$ = $1;
  }
  | NUM
  {
  $$ = $1;
  }
  | expr '+' expr
  {
  $$ = generate($1, '+', $3);
  }
  | expr '-' expr
  {
  $$ = generate($1, '-', $3);
  }
  | expr '*' expr
  {
  $$ = generate($1, '*', $3);
  }
  | expr '/' expr 
  {
  if (strcmp($3, "0") == 0){
  printf("Division by zero is not defined\n");
  YYERROR;
  }
  $$ = generate($1, '/', $3);
  }
  | '(' expr ')'
  {
  $$ = $2;
  }
  ;
%%

int main(){
printf("Enter the arithmetic expression: \n");
yyparse();
return 0;
}
int yyerror(char* str){
printf("Invalid Expression\n");
return 1;
}

