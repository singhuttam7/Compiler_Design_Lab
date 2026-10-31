//Write a Program for Recursive Descent Parser
#include<iostream>
#include<string>
#include<cstdlib>
using namespace std;
string input;
int pos = 0;

//Function declarations
void E();
void Eprime();
void T();
void Tprime();
void F();
void error(){
std::cout<<"Invalid String."<<std::endl;
exit(0);
}

//E -> TEprime
void E(){
T();
Eprime();
}

//E -> +TE'|epsilon
void Eprime(){
if(input[pos] == '+'){
pos++ ;
T();
Eprime();
}
//else error
}

//T -> FT'
void T(){
F();
Tprime();
}

//Tprime -> *FTprime | epsilon
void Tprime(){
if(input[pos] == '*'){
pos++ ;
F();
Tprime();
}
//else error
}

// F -> (E)|id
void F(){
if(input[pos] == '('){
pos++ ;
E();
if(input[pos] == ')'){
pos++ ;
}else{
error();
}
}else if(input.substr(pos, 2) == "id"){
pos = pos + 2;
}else{
error();
}
}



int main(){
cout<<"Enter the string..."<<endl;
cin>>input;
input = input + '$';
E();
if(input[pos] == '$'){
cout<<"Valid string..."<<endl;
}else{
cout<<"Invalid String..."<<endl;
}
return 0;
}


