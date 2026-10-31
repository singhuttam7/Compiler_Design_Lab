%{
#include <stdio.h>
#include<stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right '^'

%%

input:
expr '\n' {printf("\n");}
;

expr:
expr '+' expr {printf("+ ");}
|expr '_' expr {printf("_ ");}
|expr '*' expr {printf("* ");}
|expr '/' expr {printf("/ ");}
|expr '^' expr {printf("^ ");}
| NUMBER {printf("%d ", yylval); }
;
%%

void yyerror(const char *s)
{
printf("Invalid expressiong\n");
}

int main(){
printf("Enter an infix expression: ");
yyparse();
return 0;
}
