%{
#include<stdio.h>

int count_l = 0;
int count_s = 0;
int count_T = 0;
%}

%%
\n count_l++;
\t count_T++;
[ ] count_s++;
.; 
%%
int yywrap(){
return 1;
}

int main(){
//printf("Enter the characters: \n");
printf("\n");
yylex();
printf("Total number of lines: %d\n", count_l);
printf("Total number of tab_space: %d\n", count_T);
printf("Total number of spaces: %d\n", count_s);

return 0;
}

