// This example shows how to pass the data from the java script to webassembly.
if ('WebAssembly' in window) {
	// 1. make a memory object as a part of the import object
	var memObj = new WebAssembly.Memory({initial: 256, maximum: 256});
	var importObj = {
		env: {
			memory:memObj
		}
	};
	//2. provide the import object in instantiateStreaming
	WebAssembly.instantiateStreaming(fetch('dot.wasm'), importObj)
	.then( result => {
	 // 3. obtain the address of the input array
	 offset1 = result.instance.exports._getFirstOffset();
	 offset2 = result.instance.exports._getSecondOffset();

	 //4. create and initialize two typed arrays
	 var firstArray = new Uint32Array(memObj.buffer, offset1, 8);
	 firstArray.fill(2);

	 var secondArray = new Uint32Array(memObj.buffer, offset2, 8);
	 secondArray.fill(3);
	 //5. compute the dot product
	 product = result.instance.exports._dot_product();
	 document.getElementById('wasm').innerHTML = 'Dot product: ' + product
	})


}