// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).trim().split('\n');
main();
 
function main(){
  
  for(var i = 0, len = input.length; i < len; i++){
    var c = input[i].split(',');
    
    console.log(
         !isInner(c[0],c[1],c[2],c[3],c[4],c[5],c[6],c[7])
      && !isInner(c[2],c[3],c[4],c[5],c[6],c[7],c[0],c[1])  
      && !isInner(c[4],c[5],c[6],c[7],c[0],c[1],c[2],c[3])
      && !isInner(c[6],c[7],c[0],c[1],c[2],c[3],c[4],c[5]) ?
            'YES':'NO');
  }
  
}

function isInner(x1,y1,x2,y2,x3,y3,x4,y4){
    var v1 = new Vector2D(x1, y1);
    var v2 = new Vector2D(x2, y2);
    var v3 = new Vector2D(x3, y3);
    var vp = new Vector2D(x4, y4);
 
    var v12 = v2.sub(v1);
    var v2p = vp.sub(v2);
     
    var v23 = v3.sub(v2);
    var v3p = vp.sub(v3);
 
    var v31 = v1.sub(v3);
    var v1p = vp.sub(v1);
 
    var c1 = v12.cross(v2p);
    var c2 = v23.cross(v3p);
    var c3 = v31.cross(v1p);
 
    return (c1 >= 0 && c2 >= 0 && c3 >= 0) || (c1 < 0 && c2 < 0 && c3 < 0);
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