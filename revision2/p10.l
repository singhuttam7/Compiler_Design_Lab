%{
#include<stdio.h>
int counts = 0;
%}

%%
[\t\n] ;
"//".* ;
" " ;

"int"|"float"|"char"|"double"|"long"|"void"|"while"|"for"|"if"|"else"|"do"|"signed"|"unsigned"|"static"|"bool"|"return"|"break"|"continue"|"switch"|"struct" {counts++;
}
[a-zA-Z_][a-zA-Z0-9_]* {counts++;}
[0-9]+ {counts++;}
"+"|"-"|"="|"=="|"+="|"*="|"/"|">"|"<"|">="|"<="|"&"|"&&"|"!"|"++"|"--"|"!="|"||"|"->" {counts++;}
[(){}\[\],;:.] {counts++;}
\"([^\"\\]|\\.)*\" {counts++;}
\'([^\'\\]|\\.)*\' {counts++;}
. {counts++;}
%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the statements:\n");
yylex();
printf("The total number of tokens: %d\n", counts++);
return 0;
}
