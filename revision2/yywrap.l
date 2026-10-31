%{
# include<stdio.h>
extern FILE *yyin;
%}

%%
[0-9]+ {printf("Number: %s\n", yytext);}
[ \t\n]+ {}
. {printf("Character: %s\n", yytext);}
%%
int yywrap(){
static int count = 0;
if(count == 0){
count++;
yyin = fopen("file2.txt", "r");
return 0;
}
else{
return 1;
}
}

int main(){
yyin = fopen("file1.txt", "r");
yylex();
return 0;
}
