%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int yylex(void);
int yyerror(const char* s);
%}

%union{
char* str;
}
%token <str> STRING

%%
input: 
      | input STRING '\n'
      {
      int len = strlen($2);
      if($2[0] == $2[len-1]){
      printf("Accepted\n");
      }else{
      printf("Rejected\n");
      }
      free($2);
      }
      ;
%%

int main(){
printf("Enter the binary string: \n");
yyparse();
return 0;
}
int yyerror(const char* s){
printf("Invalid expression\n");
return 0;
}

