// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).split('\n');
main();
 
// ここから
function main(){

  var primeNumbers = new Int32Array(65535);
  var maxNum = 0;

  // 最大値
  for(var line = 0, inputLength = input.length; line < inputLength - 1; line++){
    var num = input[line] - 0;
    maxNum = maxNum < num ? num : maxNum;
  }

  // 素数計算
  primeNumbers[0] = 2;
  var pcount = 1;
  for(var i = 3; i <= maxNum; i+=2){
    var isPrime = true;
    for(var j = 3, maxJ = ~~Math.sqrt(i); j <= maxJ; j+=2){
      if(!(i % j)){
        isPrime = false;
        break;
      }
    }

    if(isPrime){
      primeNumbers[pcount] = i;
      pcount++;
    }
  }

  // 出力
MLOOP: for(var line = 0, inputLength = input.length; line < inputLength - 1; line++){
    for(var k = 0; k < pcount; k++){
      var prime = primeNumbers[k];
      if(prime > (input[line] - 0)){
        console.log(k);
        continue MLOOP;
      }
    }
  console.log(pcount);
  
  }

  
  
}