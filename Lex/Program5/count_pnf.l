%{
#include<stdio.h>
%}
%%
-?[0-9]+\.[0-9]+ {
float num = atof(yytext);
printf("%f is a fractional number\n", num);
}
-?[0-9]+ {
int num = atoi(yytext);
if(num > 0){
printf("%d is a positive number\n", num);
}else if(num < 0){
printf("%d is a negative number\n", num);
}else{
printf("Zero is neither a positive nor negative.\n");
}
}
[\t\n];
.; 

%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the number:\n");
yylex();
return 0;
}
