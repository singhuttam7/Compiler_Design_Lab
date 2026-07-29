%{
#include <stdio.h>

int count = 0;
%}

%%

[0-9]+ {
    count += yyleng;
}

\n {
    printf("The total number of digits: %d\n", count);
    return 0;
}

. ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input: ");
    yylex();
    return 0;
}
