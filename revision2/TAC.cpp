#include<iostream>
#include<string>
#include<vector>
#include<cctype>
using namespace std;

int temp = 1;
//precendence function
int precedence(char op){
if(op == '*'|| op == '/'){
return 2;
}
if(op == '+'|| op == '-'){
return 1;
}
return 0;
}
//TAC function

void TACgenerate(std::string expr){
std::vector<string> operands;
std::vector<char> operators;

for (int i = 0; i < expr.length(); i++){
char c = expr[i];

if(isspace(c)) continue;
if(isalnum(c)){
std::string s = "";
while(i < expr.length() && isalnum(expr[i])){
s += expr[i++];
}
i--;
operands.push_back(s);
} 
else if(c == '('){
operators.push_back(c);
}else if(c == ')'){
while(operators.back() != '('){
std::string b = operands.back(); operands.pop_back();
std::string a = operands.back(); operands.pop_back();
char op = operators.back(); operators.pop_back();

string t = "t" + to_string(temp++);
std::cout<<t<<" = "<<a<<" "<<op<<" "<<b<<std::endl;
operands.push_back(t);
}
operators.pop_back();

}else{
while(!operators.empty() && operators.back() != '(' && precedence(operators.back()) >= precedence(c)){
string b = operands.back(); operands.pop_back();
string a = operands.back(); operands.pop_back();
char op = operators.back(); operators.pop_back();

std::string t = "t" + to_string(temp++);
cout<<t<<" = "<<a<<" "<<op<<" "<<b<<std::endl;

operands.push_back(t);
}
operators.push_back(c);
}
}
while(!operators.empty()){
string b = operands.back(); operands.pop_back();
string a = operands.back(); operands.pop_back();
char op = operators.back(); operators.pop_back();

std::string t = "t" + to_string(temp++);
cout<<t<<" = "<<a<<" "<<op<<" "<<b<<std::endl;
operands.push_back(t);
}

std::cout<<"Result: "<<operands.back()<<std::endl;
}


int main(){
std::string expr;

cout<<"Enter the arithmetic expression: ";
getline(cin, expr);

cout<<"\nThree address Code:\n";
TACgenerate(expr);
return 0;
}
