// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).split('\n');
main();
  
function main(){
  var read = 0;
  var resultCase = 1;
  while(true){
    var maxWeight = +input[read++];
    if(!maxWeight){
      break;
    }
      
    var treasures = +input[read++];
    var dp = new Int16Array(maxWeight + 1);
    for(var i = treasures; i--;){
      var c = input[read++].split(",");
      var tv = +c[0];
      var tw = +c[1];
  
      for(var w = maxWeight; w - tw >= 0; w--){
        dp[w] = max(dp[w-tw] + tv, dp[w]);
      }
    }
  
    var resultWeight = 1001;
    var resultCost = 0;
    for(var i = 0; i <= maxWeight; i++){
      var dpi = dp[i];
      if(dpi > resultCost){
        resultCost = dpi;
        resultWeight = i;
      }
    }
      
    console.log("Case " + resultCase++ + ":\n" + resultCost + "\n" + resultWeight);
  }
}
 
 
function max(a, b) {
  var t = a - b;
  return a - (t & (t >> 31));
}