#include<iostream>
#include<vector>
#include<string>
#include<sstream>
#include<map>
#include<set>
#include<algorithm>
using namespace std;

struct Instruction{
  std::string lhs, op1, op, op2;
  bool isAssignment = false;
}

//Check constants
bool isConstant(std::string s){
if(s.empty()){
return false;
}
int start = (s[0] == '-')?1:0;
if(start == (int)s.size()) return false;
for(int i = start; i < (int)s.size(); i++){
if(!isdigit(s[i])) return false;
}
return true;
}

//Parsing the TAC
Instruction parse(std::string line){
Instruction ins;
std::stringstream ss(line);
std::string lhs, equal, op1, op, op2;

ss>>lhs>>equal>>op1;
if (equal != '=') return ins;
ins.lhs = lhs;
ins.op1 = op1;
ins.isAssignment = true;

if(ss>>op>>op2){
ins.op = op;
ins.op2 = op2;
}
return ins;

}

//Converting instruction back to the string
std::string toString(Instruction ins){
if(ins.op.empty())
return ins.lhs +" = "+ ins.op1;

return ins.lhs + " = " + ins.op1 +" "+ins.op+ " " +ins.op2;
}

//Constant Folding: Constant folding means evaluating expressions containing only constant values during compilation instead of waiting until runtime

void constantFolding(std::vector<Instruction>& block){
for(auto& ins: block){
if(ins.op.empty()) continue;
if(isConstant(ins.op1) && isConstant(ins.op2){
int a = stoi(ins.op1);
int b = stoi(ins.op2);
int result = 0;
bool valid = true;

if(ins.op == '+') result =  a + b;
else if(ins.op == '-') result = a -b;
else if(ins.op == '*') result =  a * b;
else if(ins.op == '/' && b != 0) result =  a / b;
else valid = false;

if(valid){
ins.op1 = to_string(result);
ins.op.clear();
ins.op2.clear();
}
}
}
}

//Common Subexpression Elimination (CSE)
//Common Subexpression ELimination identifies repeated expressions and reuses the previously calculated result instead of calculating the same expression again
void commonSubexpression(std::vector<Instruction>& block){
map<string, string> expressions;
for(auto& ins: block){
if(!ins.op.empty()){
std::string key = ins.op1 + " "+ins.op+" "+ins.op2;

if((ins.op == "+" || ins.op == "*") && ins.op1 > ins.op2){
key = ins.op2 + " "+ins.op+" "+ins.op1;
}

if(expressions.count(key)){
ins.op1 = expressions[key];
ins.op.clear();
ins.op2.clear();
}else{
expressions[key] = ins.lhs;
}
}

for(auto it = expressions.begin(); it != expressions.end();){
bool contains = it->first.find(ins.lhs) != string::npos;

if(contains && it->second != ins.lhs)
it = expressions.erase(it);
else
  ++it;
}
}
}

//Dead Code Elimination (DCE)
//Dead code Elimination removes instructions whose calculated results are never  used
void deadCodeElimination(std::vector<Instruction>& block){
set<string> used;
vector<bool> keep(block.size(), false);
bool changed = true;
while(changed){
changed = false;

for(int i = (int)block.size() -1; i >= 0; i--){
if(!block[i].isAssignment) continue;
if(used.count(block[i].lhs)){
if(!keep[i]){
keep[i] = true;
changed = true;
}
used.erase(block[i].lhs);
if(!isConstant(block[i].op1))
used.insert(block[i].op1);

if(!block[i].op.empty() && !isConstant(block[i].op2))
used.insert(block[i].op2);

} 
}
}
vector<Instruction> optimized;
for(int i = 0; i < (int)block.size(); i++){
if (keep[i])
optimized.push_back(block[i]);
}
block = optimized;

}
