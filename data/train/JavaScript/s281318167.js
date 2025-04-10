function main() {
  input.forEach(function(str) {
    var
    num = str.split(' ').map(parseFloat);
    if(num.length !== 4 || str.indexOf('0 0 0 0') === 0) return;
    console.log(expr(num));
  });
}

var
op = ['+','-','*']
ex = ['(@%@)%(@%@)','@%(@%@)%@','@%@%@%@', '(@%(@%@))%@'];
function format(txt,a,b){
 var
 i,j = i = 0;
 return txt.replace(/@/g,function(){
  return a[i++];
 }).replace(/%/g,function(){
  return b[j++];
 });
}
function perm(xs) {
 var
 x, i, len = xs.length,
 ret = [];
 if(len === 0) return [[]];
 for(i = 0; i < len; i++){
  x = xs.shift();
  ret = ret.concat(perm(xs).map(function(ys){
   return (ys.unshift(x), ys);
  }));
  xs.push(x);
 }
 return ret;
}
function expr(src){
 var
 i,j,k,m,n,r;
 src = perm(src); 
 for(i = 0; i < 24; i++)for(j = 0; j < 3; j++)for(k = 0; k < 3; k++)for(m = 0; m < 3; m++)for(n = 0; n < 3; n++){
  r = format(ex[n],src[i],[op[j],op[k],op[m]]);
      if(eval(r) === 10) return r;
 }
 return 0;
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