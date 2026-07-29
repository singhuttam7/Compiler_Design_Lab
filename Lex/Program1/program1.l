%{
#include <stdio.h>
%}

%%

hello   { printf("Hello found\n"); }
[0-9]+  { printf("Number: %s\n", yytext); }
[a-zA-Z]+ { printf("Word: %s\n", yytext); }
\n      ;
.       ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter text:\n");
    yylex();
    return 0;
}
