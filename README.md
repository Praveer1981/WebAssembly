
reference:<br />
https://anonyco.github.io/WasmFiddlePlusPlus/<br />
https://developer.mozilla.org/en-US/docs/WebAssembly<br />
https://webassembly.org/getting-started/developers-guide/<br />
https://emscripten.org/docs/<br />


How to install emsdk? <br />
https://emscripten.org/docs/getting_started/downloads.html
On windows platform :<br />
1. get the emsdk repo <br />
   `git clone https://github.com/emscripten-core/emsdk.git`
2. Change directory to `emsdk`   
   `cd emsdk`
3. Fetch the latest version of the emsdk (not needed the first time you clone)
   `git pull`
4. Download and install the latest SDK tools
  `emsdk install latest`
5. Make the "latest" SDK "active" for the current user. (writes .emscripten file)
   `emsdk activate latest`
6. Activate PATH and other environment variables in the current terminal
   `emsdk_env.bat`


List of some sample:

1. just_Normal
2. using_emmake
3. Call_JS_Fn_To_Wasm
4. Custom_web_page
5. Memory-Object-example
6. QuickSort
7. create Side module
8. Dynamic linking - dlopen
9. Dynamic linking - dynamicLibraries 
