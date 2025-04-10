// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).trim().split('\n');
main();
  
// ここから
function main(){
  var i = 1;
  for(var len = input[0] - 0;len--;){
    var x = input[i++].split('').reverse().join('').trim();
    var y = input[i++].split('').reverse().join('').trim();

    var loop = x.length > y.length ? x.length : y.length;
    var results = new Int8Array(loop + 1);
    for(var j = 0; j < loop; j++){
      var xj = x.length > j ? x[j] - 0 : 0;
      var yj = y.length > j ? y[j] - 0 : 0;
      var rj = results[j] - 0;
      var sum = xj + yj + rj;
      if(sum >= 10){
        sum -= 10;
        results[j + 1]++;
      }
      results[j] = sum;
    }

    var result = "";
    for(loop++;loop--;){
      result += results[loop];
    }
    result=result.replace(/^0/g, "");


    console.log(result.length > 80 ? 'overflow' : result);
  }
}