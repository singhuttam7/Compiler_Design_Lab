%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int yylex(void);
int yyerror(char *str);

%}
%union{
char* str;
}

%token <str> NUMBER ID
%type <str> expression

%left '+' '-'
%left '*''/'
%%
input: 
  expression 
  {
  printf("Postfix expression generated\n");
  }
  ;
expression: 
           expression '+' expression {printf("+ ");}
           | expression '-' expression {printf("- "); }
           | expression '*' expression {printf("* "); }
           |expression '/' expression {printf("/ "); }
           | NUMBER {printf("%s" , $1); }
           | ID {printf("%s", $1); }
           ;
           
%%

int main(){
printf("Enter the infix expression\n");
yyparse();
return 0;
}
int yyerror(char *str){
printf("Invalid expression\n");
return 1;
}
