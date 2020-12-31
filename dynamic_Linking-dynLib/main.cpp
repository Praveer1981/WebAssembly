// em++ main.cpp -s MAIN_MODULE=1 --pre-js pre.js -o main.html
// em++ main.cpp -s MAIN_MODULE=1 --pre-js pre.js -s EXPORTED_FUNCTIONS=['_putchar','_main'] -o main.html

// emrun --no_browser --port 8080 .
#include <cstdlib>
#include <stdio.h>

#ifdef __EMSCRIPTEN__
    #include<emscripten.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif
//Because the findEvenNumbers function is part of a different module, you need to 
//include its function signature, prefixed with the extern keyword, so that the 
//compiler knows that the function will be available when the code is run
extern void findEvenNumbers(int start, int end);


// The last thing you need to do in the main.cpp file is add the main function 
// so that the code is run automatically when the WebAssembly module is instantiated

int main () {
    findEvenNumbers(3, 200);
    return 0;
}


#ifdef __cplusplus
}
#endif


