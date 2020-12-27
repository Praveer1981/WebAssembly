// this is the main module which will use find_event.wasm as side module.
// emcc main.cpp -s MAIN_MODULE=1 -o main.html
// emrun --no_browser --port 8081 .
#include <stdlib.h>
#include <stdio.h>
#ifdef __EMSCRIPTEN__
    #include <emscripten.h>
    #include <dlfcn.h> //The header file needed for dlopen-related logic
#endif

typedef void(*findEvenNumbers) (int, int);

#ifdef __cplusplus
extern "C" {
#endif

void searchEvenNumbers(const char* file_name) {
    printf("This is the searchEvenNumbers function +\n");
    // lopen function from your C++ code to link to the calculate_primes side module
    void* handle = dlopen(file_name, RTLD_NOW); // opens the side module
    if( handle == nullptr) {
        return;
    }
    // gets the reference to the findEvenNumbers function
    findEvenNumbers find_evenNumbers = (findEvenNumbers)dlsym(handle, "findEvenNumbers"); 
    if (find_evenNumbers == NULL) { 
        return; 
        }
    // calls the function in the side module
    find_evenNumbers(3, 100);  
    // close the side module
    dlclose(handle);
    printf("This is the findEvenNumbers function -\n");
}

int main() {
    // emscripten_async_wget function to download the side module to Emscripten’s file system
    emscripten_async_wget("find_even.wasm", // File Download
    "find_even.wasm",       // name give to the file in the Emscripten's File System
    searchEvenNumbers,  // This is the callback function which will be called back upon succesful download of find_even.wasm
    NULL); // 
    return 0;
}
#ifdef __cplusplus
}
#endif