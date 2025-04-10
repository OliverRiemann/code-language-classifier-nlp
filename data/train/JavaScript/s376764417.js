// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).trim().split('\n');
main();
    
// ここから
function main(){
  var primeNumbers = calcPrimeNumbers();
  for(var i = 0, len = input.length; i < len; i++){
    console.log(primeNumbers[parseInt(input[i], 10)]);
  }
}
   
function calcPrimeNumbers(){
  var max = 999999;
  var primeNumbers = new Int32Array(max + 1);
   
  // 除外
  primeNumbers[0] = primeNumbers[1] = 0;// ここをこうすると
  // for(var i = 2, maxI = ~~Math.sqrt(max); i <= maxI; i++){
  for(var i = 2; i <= 1000; i++){
  if(primeNumbers[i]){
      continue;
    }
       
    for(var j = (i<<1); j <= max; j+=i){
      primeNumbers[j] = 1;
    }
  }
   
   for(var i = 2; i <= max; i++){
    // これがこうなる
    primeNumbers[i] = primeNumbers[i-1] + 1 - primeNumbers[i];
  }
     
  return primeNumbers;
}