%{
#include<stdio.h>
%}
%%
[a-zA-Z]+ {
if(yyleng > 5 && yyleng < 10){
printf("%s comes under range.\n", yytext);
}else{
printf("%s doesnot comes under range.\n", yytext);
}
}
.* {printf("Invalid Entry\n");}

%%
int yywrap(){
return 1;

}
int main(){
printf("Enter the strings: \n");
yylex();
return 0;
}
