emcc -s WASM=1 --emrun -O3 -s ONLY_MY_CODE=1 -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s "EXPORTED_FUNCTIONS=['_getFirstOffset','_getSecondOffset','_dot_product']" -o dot.js dot.cpp