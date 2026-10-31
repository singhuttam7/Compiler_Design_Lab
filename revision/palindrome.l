%{
#include<stdio.h>
#include<string.h>
int isPalindrome(char str[]){
int len = strlen(str);
int i = 0;
int j = len - 1;
while(i < j){
if(str[i] != str[j]){
return 0;
}else{
i++;
j--;
}
}
return 1;
}
%}
%%

[a-zA-Z0-9]+ {
if(isPalindrome(yytext)){
printf("This is a palindrome...\n");
}else{
printf("This is not a palindrome...\n");
}
}

[\t\n] ; 
. ;

%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the characters: \n");
yylex();
return 0;
}

