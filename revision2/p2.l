%{
#include<stdio.h>
int countDigit = 0;
int countLetter = 0;
%}
%%

[0-9] {countDigit++;}
[a-zA-Z] {countLetter++;}

. ;
\n {printf("The total number of digit is %d\n", countDigit);
printf("The total number of letter is %d\n", countLetter);}

%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the string: \n");
yylex();

return 0;
}
