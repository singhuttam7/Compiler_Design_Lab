#include<iostream>
#include<string>
#include<cstdlib>

using namespace std;
std::string input;
int pos = 0;
//function Declarations
void E();
void Eprime();
void T();
void Tprime();
void F();
void error(){
std::cout<<"Invalid input"<<std::endl;
exit(0);
}

//E -> TEprime
void E(){
T();
Eprime();
}

//E' -> +TE'| epsilon
void Eprime(){
if(input[pos] == '+'){
pos ++;
T();
Eprime();
}
//else error
}

//T-> FT'
void T(){
F();
Tprime();
}

//Tprime -> *FTprime
void Tprime(){
if(input[pos] == '*'){
pos ++;
F();
Tprime();
}
//else error
}

//F -> (E)|id
void F(){
if (input[pos] == '('){
pos ++;
E();
if(input[pos] == ')'){
pos ++;
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
std::cout<<"Enter the input: "<<std::endl;
std::cin>>input;
input = input + '$';
E();
if(input[pos] == '$'){
std::cout<<"Valid input"<<std::endl;
}else{
std::cout<<"Invalid input"<<std::endl;
}
return 0;
}

