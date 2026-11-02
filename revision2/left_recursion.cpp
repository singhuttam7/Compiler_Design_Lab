#include<iostream>
#include<string>
#include<vector>

int main(){
std::string nonterminal;
int n;
std::cout<<"Enter the Non Terminal Symbol: "<<std::endl;
std::cin>>nonterminal;
std::cout<<"Enter the total number of productions: "<<std::endl;
std::cin>>n;

std::vector<std::string> alpha;
std::vector<std::string> beta;

std::cout<<"Enter the productions: "<<std::endl;

for(int i = 0; i < n; i++){
std::string production;
std::cin>>production;
//Immediate check the left recursion
if(production.substr(0, nonterminal.length())== nonterminal){
alpha.push_back(production.substr(nonterminal.length()));
}else{
beta.push_back(production);
}
}

if(alpha.empty()){
std::cout<<"There is no left recursion exist."<<std::endl;
}else{
std::cout<<"Left recursion exist."<<std::endl;
}
std::cout<<"After removing the left recursion"<<std::endl;
//A-> betaA'
std::cout<<nonterminal<<" -> ";
for(int i = 0; i < beta.size(); i++){
std::cout<<beta[i]<<nonterminal<<"'";
if(i != beta.size() - 1){
std::cout<<" | ";
}
}
std::cout<<"\n";
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

return 0;
}
