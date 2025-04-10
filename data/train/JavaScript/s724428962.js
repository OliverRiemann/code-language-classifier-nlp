var f = [];
 
function main(){
  var localInput = input;
  
  for(var y=-2;y<12;y++){
    f[y] = [];
    for(var x=-2;x<12;x++){
      f[y][x] = 0;// initialize:undefined -> 0
    }
  }
 
  var len = localInput.length - 1;
  for(;len--;){
    var l = localInput[len];
    eval("d"+localInput[len][4]+"("+localInput[len][0]+","+localInput[len][2]+");");
  }
 
  var nd=0;//not dropped
  var md=0;//most dropped
  var y = 10;
  for(;y--;){
    var x = 10;
    for(;x--;){
      nd += !(f[y][x]);
      md = mx(f[y][x], md);
    }
  }
 
  console.log(nd);
  console.log(md);
}
 
function d1(x, y){
  f[y+1][x]++;
  f[y][x-1]++;
  f[y][x]++;
  f[y][x+1]++;
  f[y-1][x]++;
}
 
function d2(x, y){
  d1(x, y);
  f[y+1][x-1]++;
  f[y+1][x+1]++;
  f[y-1][x-1]++;
  f[y-1][x+1]++;
}
 
function d3(x, y){
  d2(x, y);
  f[y+2][x]++;
  f[y-2][x]++;
  f[y][x-2]++;
  f[y][x+2]++;
}

function mx(a, b){
 var t = (a-b);
 return a - (t & (t >> 31));
}
 
var
input = '';
 
process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(chunk) {
  input += chunk;
});
process.stdin.on('end', function() {
  input = input.split('\n');
  main();
});