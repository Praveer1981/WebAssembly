// This example shows how to pass the data from the java script to webassembly.
if ('WebAssembly' in window) {
	// 1. make a memory object as a part of the import object
	var memObj = new WebAssembly.Memory({initial: 256, maximum: 256});
	// 2. make the memory object part of the import 
	var importObj = {
		env: {
			memory:memObj
		}
	};

	WebAssembly.instantiateStreaming(fetch('quicksort.wasm'), importObj)
	.then( result => {
	 // 3. obtain the address of the input array
	 offset = result.instance.exports._getOffset();
	 //4. create and initialize two typed arrays
	var i;
	var mem = new Uint32Array(memObj.buffer, offset, 16);
	for (let index = 0; index < 16; index++) {
		mem[index] = Math.floor(16 * Math.random());
	}
	console.log(mem);
	 //5. call the quicksort function to sort the array.
	result.instance.exports._quicksort(0,15);
	//6 . display the result:
	resultString = "";
	for (let index = 0; index < 16; index++) {
		resultString += " " + mem[index];
	}
	//7. display in the page
	document.getElementById("wasm").innerHTML = "Output : " + resultString;
	});


}