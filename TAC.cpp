#include <iostream>
#include <stack>
#include <string>
#include <cctype>

using namespace std;

int precedence(char op){
if(op == '^')
  return 3;
if(op == '*' || op == '/')
  return 2;
if (op == '+' || op == '-')
  return 1;

return 0;
}

//Convert infix expression to postfix
string infixToPostfix(string exp){
stack<char> st;
string postfix;

for (char c : exp){
if(isalnum(c))
{
postfix += c;
}else if (c == '('){
st.push(c);
}
else if ( c == ')')
{
while (!st.empty() && st.top() != '(')
{
postfix += st.top();
st.pop();
}
}
else {
while(!st.empty() &&
precedence(st.top()) >= precedence(c))
{
postfix += st.top();
st.pop();
}
st.push(c);
}
}
while( !st.empty()){
postfix += st.top();
st.pop();
}
return postfix;
}
//Generate Three Address Code
void generateTAC(string postfix)
{stack<string> st;
int temp = 1;

for(char c: postfix){
if(isalnum(c))
{
st.push(string(1, c));
}
else
{
string op2 = st.top();
st.pop();
string op1 = st.top();
st.pop();

string t = "t" + to_string(temp++);
cout << t<< "=" << op1 << " "
<<c<< " " << op2 << endl;
st.push(t);
}

}
}
int main(){
string expression;
cout<< "Enter arithmetic expression: ";
cin >> expression;
string postfix = infixToPostfix(expression);
cout << "\nThree Address Code: \n";
generateTAC(postfix);
return 0;
}
