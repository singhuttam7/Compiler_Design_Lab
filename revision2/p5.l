%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int num;
int sum;
%}
%%
[0-9]+ {
int digits = yyleng;
num = atoi(yytext);
int remainder;
int temp;
sum = 0;
temp = num;
while(temp != 0){
remainder = temp % 10;
sum = sum + pow(remainder, digits);
temp = temp / 10;
}
}
[^0-9\n][^\n]* {printf("Invalid Entry.\n"); return 0;}
\n {if(sum == num){
printf("The given number %d is a armstrong number.\n", num);
}else{
printf("The given number %d is not a armstrong number.\n", num);
}}
%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the number: \n");
yylex();
return 0;
}
