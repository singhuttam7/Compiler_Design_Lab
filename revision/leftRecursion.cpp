#include<iostream>
#include<string>
#include<vector>
using namespace std;

int main(){
string nonterminal;
int n;
cout<<"Enter the nonTerminal symbol..."<<endl;
cin>>nonterminal;
cout<<"Enter the total number of production.."<<endl;
cin>>n;

vector<string> alpha;
vector<string> beta;

cout<<"Enter the production..."<<endl;
for(int i = 0; i < n; i++){
string production;
cin>>production;
//check for immediate left recursion
if(production[0] == nonterminal[0]){
alpha.push_back(production.substr(1));
}else{
beta.push_back(production);
}
}
//Check whether left recursion exists
if(alpha.empty()){
cout<<"There is no any left recursion exists..."<<endl;
}else{
cout<<"Left recursion detected..."<<endl;
cout<<"After eleminating left recursion"<<endl;
//A->BetaA'
cout<<nonterminal<<" -> ";
for(int i = 0; i < beta.size(); i++){
cout<<beta[i]<<nonterminal<<"'";
if(i != beta.size() - 1){
cout<<"|";
}
}
cout<<endl;
//A' -> alphaA'|epsilon
cout<<nonterminal<<"'"<<" -> ";
for(int i = 0; i < alpha.size(); i++){
cout<<alpha[i]<<nonterminal<<"'";
if(i != alpha.size() - 1){
cout<<"|";
}else{
cout<<"| epsilon"<<endl;
}

}
}
return 0;
}
