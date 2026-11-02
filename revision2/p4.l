%{
#include<stdio.h>
int count = 0;
%}
%%
[0-9]+\.[0-9]+ {
for(int i = 0; yytext[i] != '\0'; i++){
if (yytext[i] == '.'){
i++;
while(yytext[i] != '\0'){
count ++;
i++;
}
printf("The total number of digits after decimal is %d\n", count);
}
}
}
.* ;

%%
int yywrap(){
return 1;

}
int main(){
printf("Enter the fractional number: \n");
yylex();
return 0;

}
