%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%%

S : 'a'
  ;

%%

int main()
{
    printf("Enter character a:\n");
    yyparse();
    printf("Accepted\n");
    return 0;
}

void yyerror(const char *s)
{
    printf("Invalid input\n");
}
