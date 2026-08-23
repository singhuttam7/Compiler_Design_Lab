%{

#include <stdio.h>
int tokens = 0;
%}

%%
[\t\n]+ ;
"//".* ;
" " ;

"int"|"float"|"char"|"double"|"for"|"while"|"long"|"else"|"return"|"void"|"do"|"break"|"continue"|"switch"|"struct"|"short"|"unsigned"|"signed"

{
tokens++ ;
}

[a-zA-Z_][a-zA-Z0-9_]* {
tokens++;
}

"+"|"="|"=="|"+="|"-="|"*="|"*"|"/"|">"|">="|"<"|"<="|"&"|"&&"|"!"|"--" {
tokens ++;
}

[0-9]+ {
tokens++;
}

[()\{}\[\], ;:.] {
tokens ++;
}
\"([^\"\\]|\\.)*\" {
tokens ++;
}
\'([^\"\\]|\\.)*\' {
tokens++;
}
. {
tokens++;
}
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter the expression to count the total number of tokens.\n");
yylex();
printf("The total number of tokens: %d\n", tokens);
}

