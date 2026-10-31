%{
#include<stdio.h>
int count = 0;
%}

%%
[0-9] {
count ++;

}
[^0-9\n] ;
\n {
printf("The total number of digit = %d\n", count);
}

%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the string...\n");
yylex();
return 0;
}
