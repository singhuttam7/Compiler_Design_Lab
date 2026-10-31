#include<iostream>
#include<string>
#include<cstdlib>
#include<vector>

int main(){
std::string nonterminal;
int n;
std::cout<<"Enter the nonterminal symbol: "<<std::endl;
std::cin>>nonterminal;
std::cout<<"Enter the total number of productions: "<<std::endl;
std::cin>>n;

std::vector<std::string> alpha;
std::vector<std::string> beta;

std::string production;
std::cout<<"Enter the production: "<<std::endl;
for(int i = 0; i < n; i++){
std::cin>>production;
//check immediate left recursion
if(production[0] == nonterminal[0]){
alpha.push_back(production.substr(1));
}else{
beta.push_back(production);
}
}

if(alpha.empty()){
std::cout<<"There is no any left recursion..."<<std::endl;
}else{
std::cout<<"Left recursion detected."<<std::endl;
std::cout<<"After eleminating the left recursion."<<std::endl;

//A -> BetaA'
std::cout<<nonterminal<<" -> ";
for(int i = 0; i < beta.size(); i++){
std::cout<<beta[i]<<nonterminal<<"'";

if(i != beta.size() -1){
std::cout<<" | ";
} 
}
//A' -> alphaA'|epsilon
std::cout<<nonterminal<<"'"<<" -> ";
for(int i = 0; i < alpha.size(); i++){
std::cout<<alpha[i]<<nonterminal<<"'";
if(i != alpha.size() - 1){
std::cout<<" | ";
}else{
std::cout<<" | epsilon"<<std::endl;
}
}
}
return 0;
}
