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
    var pdp = new Array(maxWeight + 1);//new Int16Array(maxWeight + 1);
    for(var i = treasures; i--;){
      var c = input[read++].split(",");
      var tv = +c[0];
      var tw = +c[1];
 
      var dp = new Array(maxWeight + 1);//new Int16Array(maxWeight + 1);
      for(var w = 1; w <= maxWeight; w++){
        var pdpw = pdp[w]|0;
        dp[w] = pdpw;
        if(w - tw >= 0){
          dp[w] = max((pdp[w-tw]|0) + tv, pdpw);
        }
      }
      pdp = dp;
    }
 
    var resultWeight = 1001;
    var resultCost = 0;
    for(var i = 0; i <= maxWeight; i++){
      var pdpi = pdp[i];
      if(pdpi > resultCost){
        resultCost = pdpi;
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