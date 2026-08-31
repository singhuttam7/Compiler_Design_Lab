
// Write a program to eliminate left recursion in C/C++

#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {

    string nonTerminal;
    int n;

    cout << "Enter the non-terminal: ";
    cin >> nonTerminal;

    cout << "Enter number of productions: ";
    cin >> n;

    vector<string> alpha;
    vector<string> beta;

    cout << "Enter the productions:\n";

    for (int i = 0; i < n; i++) {

        string production;
        cin >> production;

        // Check for immediate left recursion
        if (production[0] == nonTerminal[0]) {

            // Remove A from Aα
            alpha.push_back(production.substr(1));
        }
        else {

            // β production
            beta.push_back(production);
        }
    }

    // Check whether left recursion exists
    if (alpha.empty()) {

        cout << "\nNo left recursion found.\n";
    }
    else {

        cout << "\nLeft recursion detected!\n";

        cout << "\nAfter eliminating left recursion:\n";

        // A -> βA'
        cout << nonTerminal << " -> ";

        for (int i = 0; i < beta.size(); i++) {

            cout << beta[i] << nonTerminal << "'";

            if (i != beta.size() - 1)
                cout << " | ";
        }

        cout << endl;

        // A' -> αA' | epsilon
        cout << nonTerminal << "' -> ";

        for (int i = 0; i < alpha.size(); i++) {

            cout << alpha[i] << nonTerminal << "'";

            if (i != alpha.size() - 1)
                cout << " | ";
        }

        cout << " | epsilon" << endl;
    }

    return 0;
}

