%{
#include <stdio.h>
#include<string.h>
#include<math.h>
int total_digit = 0;
int sum = 0;
%}
%%
[0-9]+ {
int num;
num = atoi(yytext);
printf("The entered number: %d\n", num);
int temp = num;
while(temp != 0){
total_digit++;
temp = temp/10;
}
int result;

int temp2 = num;
while(temp2 != 0){
int rem = temp2 % 10;
result = (int)pow(rem, total_digit);
sum = sum + result;
temp2 = temp2/10;
}

if(sum == num){
printf("This is the armstong number.\n");
}else{
printf("This is not the armstrong number.\n");
}
}
\n {printf("\n");
return 0;
}
. ;
%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the number: \n");
yylex();
return 0;
}
