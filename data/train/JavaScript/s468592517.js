function main(){
  for(var y=0;y<14;y++){
    for(var x=0;x<14;x++){
      eval("f"+ x + "" + y + " = 0;");
    }
  }
  
  for(var i=0,len=input.length - 1;i<len;i++){
    eval("d"+input[i][4]+"("+(input[i][0]-0+2)+","+(input[i][2]-0+2)+");");
  }

  var nd=0;//not dropped
  var md=0;//most dropped
  for(var y=2;y<12;y++){
    for(var x=2;x<12;x++){
      if(eval("f"+ x + "" + y) == 0)
        nd++;
      if(eval("f"+ x + "" + y) > md)
        md = eval("f"+ x + "" + y);
    }
  }

  console.log(nd);
  console.log(md);
}

function d1(x, y){
  eval("f"+ x + "" + y + "++;");
  eval("f"+ (x-0+1) + "" + y + "++;");
  eval("f"+ (x-1) + "" + y + "++;");
  eval("f"+ x + "" + (y-0+1) + "++;");
  eval("f"+ x + "" + (y-1) + "++;");
}

function d2(x, y){
  d1(x, y);
  eval("f"+ (x-0+1) + "" + (y-0+1) + "++;");
  eval("f"+ (x-0+1) + "" + (y-1) + "++;");
  eval("f"+ (x-1) + "" + (y-0+1) + "++;");
  eval("f"+ (x-1) + "" + (y-1) + "++;");
}

function d3(x, y){
  d2(x, y);
  eval("f"+ x + "" + (y-0+2) + "++;");
  eval("f"+ x + "" + (y-2) + "++;");
  eval("f"+ (x-0+2) + "" + y + "++;");
  eval("f"+ (x-2) + "" + y + "++;");
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