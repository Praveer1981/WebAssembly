#include <stdlib.h>
#include <string.h>
#include <stdio.h>

// dynamic linking is the process of joining two or more modules together at 
// runtime, where the unresolved symbols from one module (functions, for example)
// resolve to symbols existing in another

// 1. This is the side module so once we build it , It will generate only .wasm file
// 2. This webassembly module will be linked with the main module when a function will be called from the main webassembly module.


// command to build : emcc find_even.cpp -s SIDE_MODULE=2 -01 -o find_even.wasm
#ifdef __EMSCRIPTEN__
    #include<emscripten.h>
#endif

#ifdef __cplusplus
   //  extern "C" : prevent function names from being mangled when compiled so that your 
   // JavaScript code can use the expected function name
    extern "C"
    {
#endif

//Added  EMSCRIPTEN_KEEPALIVE declaration above the findEvenNumbers function so that 
//the function is automatically added to the list of exported functions when we  
// compile
#ifdef __EMSCRIPTEN__
    EMSCRIPTEN_KEEPALIVE
#endif

void findEvenNumbers( int begin, int end) {
    printf("List of even numbers between %d and %d\n", begin, end);
    for(int i=begin; i<end; i++) {
        if( i%2 == 0)
        {
            printf("%d ",i);
        }
    }
}

int main() {

    printf("This is side webassembly module \n");

    int start = 4;
    int end   = 100;

    findEvenNumbers(start, end);
    printf("\n");
    return 0;
}

#ifdef __cplusplus
    }
#endif