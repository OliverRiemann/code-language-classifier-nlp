// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).split('\n');
main();
    
// ここから
function main(){
  var intInput = new Int32Array(input);
  var primeNumbers = calcPrimeNumbers();
  for(var i = 0, len = input.length - 1; i < len; i++){
    console.log(primeNumbers[intInput[i]]);
  }
   
     
}
   
function calcPrimeNumbers(){
  var max = 999999;
  var primeNumbers = new Int32Array(max + 1);
   
  // 除外
  primeNumbers[0] = primeNumbers[1] = 0;// あえて0,1を素数とみなす
  for(var i = 2, maxI = ~~Math.sqrt(max); i <= maxI; i++){
    if(primeNumbers[i]){
      continue;
    }
       
    for(var j = (i<<1); j <= max; j+=i){
      primeNumbers[j] = 1;
    }
  }
   
   for(var i = 2; i <= max; i++){
     // と、ここがこうなる
     primeNumbers[i] = primeNumbers[i-1] - primeNumbers[i] + 1;
  }
     
  return primeNumbers;
}