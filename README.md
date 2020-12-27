
reference:<br />
https://anonyco.github.io/WasmFiddlePlusPlus/<br />
https://developer.mozilla.org/en-US/docs/WebAssembly<br />
https://webassembly.org/getting-started/developers-guide/<br />
https://emscripten.org/docs/<br />


How to install emsdk? <br />
https://emscripten.org/docs/getting_started/downloads.html
On windows platform :<br />
1. get the emsdk repo <br />
   `git clone https://github.com/emscripten-core/emsdk.git`<br />
2. Change directory to `emsdk`<br />
   `cd emsdk`<br />
3. Fetch the latest version of the emsdk (not needed the first time you clone)<br />
   `git pull`<br />
4. Download and install the latest SDK tools<br />
  `emsdk install latest`<br />
5. Make the "latest" SDK "active" for the current user. (writes .emscripten file)<br />
   `emsdk activate latest`<br />
6. Activate PATH and other environment variables in the current terminal<br />
   `emsdk_env.bat`<br />


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
