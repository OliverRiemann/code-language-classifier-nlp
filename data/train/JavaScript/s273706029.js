// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).trim().split('\n');
main();

function main(){
  for(var i = 0, len = input.length; i < len; i++){
    var iarr = input[i].split(' ');
    j = 0;
    var v1 = new Vector2D(iarr[j++], iarr[j++]);
    var v2 = new Vector2D(iarr[j++], iarr[j++]);
    var v3 = new Vector2D(iarr[j++], iarr[j++]);
    var vp = new Vector2D(iarr[j++], iarr[j++]);

    var v12 = v2.sub(v1);
    var v2p = vp.sub(v2);
    
    var v23 = v3.sub(v2);
    var v3p = vp.sub(v3);

    var v31 = v1.sub(v3);
    var v1p = vp.sub(v1);

    var c1 = v12.cross(v2p);
    var c2 = v23.cross(v3p);
    var c3 = v31.cross(v1p);

    if((c1 > 0 && c2 > 0 && c3 > 0) || (c1 < 0 && c2 < 0 && c3 < 0) ){
      console.log('YES');
    }else{
      console.log('NO');
    }
    
  }
}

function Vector2D(x, y){
  this.x = x - 0, this.y = y - 0;
  this.sub = function(v){
    return new Vector2D(this.x - v.x, this.y - v.y);
  };
  this.cross = function(v){
    return this.x * v.y - this.y * v.x;
  };
}