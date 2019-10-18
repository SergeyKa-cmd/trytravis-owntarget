#include <cstdlib>
#include <fstream>
#include <iostream>

#define BASHSCRIPT "\
ansible -m ping all\
"

int main() {
   std::system(BASHSCRIPT "> inventory.json");
   std::cout << std::ifstream("inventory.json").rdbuf();
    return 0;
}