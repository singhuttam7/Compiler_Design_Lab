%{
# include <stdio.h>
int num;
%}

%%
[0-9]+ {
num = atoi(yytext);
if(num % 2 == 0){
printf("%d is an even number\n", num);
}else{
printf("%d is an odd number\n", num);
}
}

.* {printf("Invalid Entry\n");}

%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the number: \n");
yylex();

return 0;
}
