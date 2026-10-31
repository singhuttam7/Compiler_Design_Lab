%{
#include<stdio.h>
%}

%%
[a-zA-Z]+ {
if(yyleng > 5 && yyleng < 10){
printf("Result...\n");
printf("%s comes under range.\n", yytext);

}else{
printf("%s doesnot comes under range.\n", yytext);
}
}
[^a-zA-Z\n] {printf("Invalid Entry\n");
}
%%

int yywrap(){
return 1;
}
int main(){
printf("Enter the string\n");
yylex();
return 0;
}
