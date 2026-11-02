#include<iostream>
#include<string>
#include<sstream>
#include<vector>
#include<map>
#include<set>
using namespace std;

int main(){
int n;
cout<<"Enter the total number of instructions: "<<endl;
cin>>n;
cin.ignore();

vector<string> code(n);

for(int i = 0; i < n; i++){
getline(cin, code[i]);
}

//Find labels position
map<string, int> labels;
for(int i = 0; i < n; i++){
string s = code[i];

if(!s.empty() && s.back() == ':'){
labels[s.substr(0, s.size() - 1)] = i;
}
}

//find leaders;
set<int> leaders;
leaders.insert(0);
for(int i = 0; i < n; i++){
stringstream ss(code[i]);
string word, target;
ss >> word;
if(word == "goto" || word == "if"){
if(i+1 < n){
leaders.insert(i+1);
}
if(word == "goto"){
ss>>target;
}else{
while(ss>> word){
if (word == "goto"){
ss>>target;
break;
}
}
}
//Target is label
if(labels.count(target)){
leaders.insert(labels[target]);
}
//Target is integer
else{
try{
int t = stoi(target);
if(t >= 1 && t<= n){
leaders.insert(t-1);
}
}catch(...)  { }
}
}
}
//Display leaders
cout<<"Leaders "<<std::endl;
for (int x: leaders){
cout<<"Instructions "<<x + 1<<":"<<code[x]<<endl;
}

//Display the basic blocks
vector<int> L(leaders.begin(), leaders.end());
for(int k = 0; k < L.size(); k++){
int start = L[k];
int end = (k + 1 < L.size())?L[k + 1] - 1: n-1;

cout<<"Basic Block: "<<k+1<<":\n";
for(int i = start; i <= end; i++){
cout<<"Instruction "<<i + 1<<":"<<code[i]<<std::endl;
}
}
return 0;
}
