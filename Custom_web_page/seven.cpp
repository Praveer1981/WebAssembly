#include <iostream>
using namespace std;

int multiplyByTen(int x ){
    return x * 10;
}
extern "C" {
    int seven() {
        int x = multiplyByTen(7);
        return x;
    }
}

int main() {
    seven();
    return 0;
}



