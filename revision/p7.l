%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int num;
int sum;
%}

%%
[0-9]+ {
num = atoi(yytext);
int digits = yyleng;
sum = 0;
int temp = num;
int remainder;
while(temp != 0){
remainder = temp % 10;
sum = sum  + pow(remainder, digits);
temp = temp / 10; // for digit removal
}
}
\n {
if (sum == num){
printf("This is a armstrong number.\n");
}else{
printf("This is not a armstrong number.\n");
}
}
[^0-9\n] {printf("Invalid entry\n");}
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter the number to check, is it Armstrong or not...\n");
yylex();
return 0;
}
