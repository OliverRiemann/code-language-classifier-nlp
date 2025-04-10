var perm=[];
var flag=[];
for(var i=0;i<4;i++)flag[i]=false;
var cnt=0;
for(var i=0;i<4;i++){flag[i]=true;
for(var ii=0;ii<4;ii++){if(flag[ii])continue;flag[ii]=true;
for(var iii=0;iii<4;iii++){if(flag[iii])continue;flag[iii]=true;
for(var iiii=0;iiii<4;iiii++){if(flag[iiii])continue;
perm[cnt]=[i,ii,iii,iiii];
cnt++;
}flag[iii]=false;
}flag[ii]=false;
}flag[i]=false;
}
var input = require('fs').readFileSync('/dev/stdin', 'utf8');
 
var Arr=(input.trim()).split("\n");
while(true){
var abcd=Arr.shift();
if(abcd=="0 0 0 0")break;
var ary=abcd.split(" ").map(Number);
var ans=0;
var s=["+","-","*"];
for(var i=0;i<3;i++){
for(var j=0;j<3;j++){
for(var k=0;k<3;k++){
perm.forEach(function(v){
var a=ary[v[0]];
var b=ary[v[1]];
var c=ary[v[2]];
var d=ary[v[3]];
if(ans==0 && eval(a+s[i]+b+s[j]+c+s[k]+d)==10)ans=a+s[i]+b+s[j]+c+s[k]+d;
if(ans==0 && eval("("+a+s[i]+b+s[j]+c+")"+s[k]+d)==10)ans="("+a+s[i]+b+s[j]+c+")"+s[k]+d;
if(ans==0 && eval("("+a+s[i]+b+")"+s[j]+"("+c+s[k]+d+")")==10)ans="("+a+s[i]+b+")"+s[j]+"("+c+s[k]+d+")";
if(ans==0 && eval("("+"("+a+s[i]+b+")"+s[j]+c+")"+s[k]+d)==10)ans="("+"("+a+s[i]+b+")"+s[j]+c+")"+s[k]+d;
});
}
}
}
 
console.log(ans);
}