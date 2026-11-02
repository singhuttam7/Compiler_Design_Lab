%{
#include<stdio.h>
#include<string.h>

int isPalindrome(char str[]){
int i = 0;
int j = strlen(str) - 1;
while(i < j){
if(str[i] != str[j]){
return 0;
}
i++;
j--;
}
return 1;
}
%}

%%
[0-9a-zA-Z]+ {if(isPalindrome(yytext)){
printf("The given %s string or text is a palidrome.\n", yytext);
}else{
printf("The given %s string or text is not a palidrome.\n", yytext);
}
}
\n ;
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter the string: \n");
yylex();
return 0;
}
