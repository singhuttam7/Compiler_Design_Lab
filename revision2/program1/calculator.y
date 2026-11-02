%{
#include<stdio.h>
int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER
%%
expression: 
     NUMBER '+' NUMBER
     {
        printf("Valid Expression");
      }
      ;
%%

int main()
 {
 printf("Enter an expression: ");
 yyparse();
 return 0;
 }
 
 int yyerror(const char *s)
 {
 printf("Invalid Expression\n");
 return 0;
 }
