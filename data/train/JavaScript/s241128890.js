// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('hex', 0, bytesRead).split('0a'); // hexでreadしたら早い？
main();
 
function main(){
  // 26と互いに素の値
  var multiply = new Int8Array([1,3,5,7,9,11,15,17,19,21,23,25]);
  var lenj = multiply.length;
  var alphabets = new Int8Array(26);
  var convertTable = new Int8Array(123);
  for(var init = 123; init--;)
    convertTable[init] = init;

FIRST:for(var i = 1, leni = input.length - 1; i < leni; i++){
    var inp = input[i];
    var c = inp.split('20');
    var clen = c.length;
  
    for(var j = 0; j < lenj; j++){
      var alpha = multiply[j];
      for(var beta = 26; beta--;){
        for(var conv = 26; conv--;){ // a-zの変換表作成
          alphabets[conv] = (conv * alpha + beta) % 26 + 97;
        }

        // thatとthisの変換後のacsiiコードを取得
        var thatIs = alphabets[19].toString(16) + alphabets[7].toString(16) + alphabets[0].toString(16) + alphabets[19].toString(16);
        var thisIs = alphabets[19].toString(16) + alphabets[7].toString(16) + alphabets[8].toString(16) + alphabets[18].toString(16);

        var found = false;
        for(var d = clen; d--;){
          var cd = c[d];
          if(cd == thatIs || cd == thisIs){
            found = true;
            break;
          }
        }
        
        if(found){
          for(var conv = 26; conv--;){
            var fromCode = alphabets[conv];
            convertTable[fromCode] = conv + 97; // key-valueの入れ替え
          }
          
          var result = "";
          for(var k = 0; k < inp.length; k+=2){
            result += String.fromCharCode(convertTable[parseInt(inp[k] + inp[k+1], 16)]);
          }
          console.log(result);
          continue FIRST;
        }
        
      }
    }
  
  }
}