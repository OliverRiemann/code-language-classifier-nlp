// 標準入力
var fs = require('fs'),
length = fs.fstatSync(process.stdin.fd).size,
buffer = new Buffer(length),
bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0),
input = buffer.toString('utf8', 0, bytesRead).trim().split('\n');
main();

function main(){
  var x=y=0;
  var d='R';
  var route='';

  while(true){
    var dy = y*2+1;
    var uy = y*2-1;
    var ny = y*2;
    var lx = x-1;
    var rx = x+1;
    var nx = x;

    switch(d){
    case 'L':
      if(dy < input.length && +input[dy][nx]){//↓に行ける
        d='D';y++;
      }else if(+input[ny][lx]){// ←に行ける
        d='L';x--;
      }else if(uy > 0 && +input[uy][nx]){//↑に行ける
        d='U';y--;
      }else{
        d='R';x++;
      }
      break;
    case 'R':
      if(uy > 0 && +input[uy][nx]){//↑に行ける
        d='U';y--;
      }else if(+input[ny][nx]){// →に行ける
        d='R';x++;
      }else if(dy < input.length && +input[dy][nx]){//↓に行ける
        d='D';y++;
      }else{
        d='L';x--;
      }
      break;
    case 'D':
      if(+input[ny][nx]){// →に行ける
        d='R';x++;
      }else if(dy < input.length && +input[dy][nx]){// ↓に行ける
        d='D';y++;
      }else if(+input[ny][lx]){// ←に行ける
        d='L';x--;
      }else{
        d='U';y--;
      }
      break;
    case 'U':
      if(+input[ny][lx]){// ←に行ける
        d='L';x--;
      }else if(uy > 0 && +input[uy][nx]){// ↑に行ける
        d='U';y--;
      }else if(+input[ny][nx]){// →に行ける
        d='R';x++;
      }else{
        d='D';y++;
      }
      break;
    default:
      return;
    }
    route+=d;
    if(!x && !y)
      break;
  }
  console.log(route);
}