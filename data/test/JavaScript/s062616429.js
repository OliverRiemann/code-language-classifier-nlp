  
function main(){
  var localInput = input;
  var f = [];
  for(var y=-2;y<12;y++){
    f[y] = [];
    for(var x=-2;x<12;x++){
      f[y][x] = 0;// initialize:undefined -> 0
    }
  }
  
  var len = localInput.length - 1;
  for(;len--;){
    var l = localInput[len];
    var ix = parseInt(l[0]);
    var iy = parseInt(l[2]);
    switch(l[4]){
    case '3': // no-break case;
      f[iy+2][ix]++;
      f[iy-2][ix]++;
      f[iy][ix-2]++;
      f[iy][ix+2]++;
    case '2':
      f[iy+1][ix-1]++;
      f[iy+1][ix+1]++;
      f[iy-1][ix-1]++;
      f[iy-1][ix+1]++;
    case '1':
      f[iy+1][ix]++;
      f[iy][ix-1]++;
      f[iy][ix]++;
      f[iy][ix+1]++;
      f[iy-1][ix]++;
      break;
    }
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