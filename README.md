# Compiler Design Lab

A collection of **Compiler Design laboratory programs** implemented using **Lex (Flex)**, **Yacc (Bison)**, and **C**. This repository contains practical experiments commonly performed in Compiler Design labs, with well-commented code to help students understand lexical analysis, parsing, and compiler construction concepts.

## 📚 Topics Covered

* Lex (Flex) Programs
* Yacc (Bison) Programs
* Lex and Yacc Integration
* Token Recognition
* Lexical Analysis
* Syntax Analysis
* Expression Evaluation
* Symbol Table
* Regular Expressions
* Error Detection and Handling
* Other Compiler Design Laboratory Programs

## 🎯 Objectives

* Learn the fundamentals of compiler construction.
* Understand lexical and syntax analysis.
* Implement compiler design algorithms using Lex and Yacc.
* Prepare for laboratory practicals, viva, and university examinations.

## 🛠️ Technologies Used

* **Language:** C
* **Tools:** Lex (Flex), Yacc (Bison)
* **Compiler:** GCC
* **Platform:** Linux (Ubuntu)

## 📂 Repository Structure

```text
compiler-design-lab/
├── Lex/
├── Yacc/
├── Lex_Yacc/
├── Notes/
└── README.md
```

## 🚀 How to Run

### Compile a Lex program

```bash
lex program.l
gcc lex.yy.c -o program -ll
./program
```

### Compile a Yacc program

```bash
yacc -d program.y
gcc y.tab.c -o program
./program
```

### Compile a Lex + Yacc program

```bash
yacc -d program.y
lex program.l
gcc y.tab.c lex.yy.c -o program -ll
./program
```

## 🤝 Contributing

Contributions are welcome. Feel free to fork the repository, improve the code, and submit a pull request.

## ⭐ Support

If you find this repository helpful, consider giving it a ⭐ on GitHub.

