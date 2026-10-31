%{
#include<stdio.h>
int counts = 0;
%}

%%
[\t\n] ;
"//".* ;
" " ;
"int"|"float"|"double"|"char"|"for"|"while"|"long"|"else"|"return"|"void"|"do"|"break"|"continue"|"switch"|"struct"|"short"|"unsigned"|"signed"|"if" {counts++;}
[a-zA-Z_][a-zA-Z0-9_]* {counts++; }

"+"|"-"|"="|"+="|"=="|"*="|"*"|"/"|">"|"<"|">="|"<="|"&"|"&&"|"!"|"--" {counts++;}
[0-9]+ {counts++; }
[(){}\[\],;:.] {counts++;}
\"([^\"\\]|\\.)*\" {counts++;}
\'([^\"\\]|\\.)*\' {counts++;}
. {counts++;}

%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the expression...\n");
yylex();
printf("The total number of tokens = %d\n", counts);
return 0;
}

