@echo off
rem emcc -O3 --emrun -s WASM=1 -s ASSERTIONS=1 -s "EXPORTED_FUNCTIONS=['_seven']"  -o seven.wasm seven.cpp --std=c++11
rem emcc -s WASM=1 --emrun -O3 -emit-llvm -s ONLY_MY_CODE=1 -s "EXPORTED_FUNCTIONS=['_seven']" -o seven.bc seven.cpp
emcc -s WASM=1 --emrun -O3 -s ONLY_MY_CODE=1 -s "EXPORTED_FUNCTIONS=['_seven']" -o seven.js seven.cpp