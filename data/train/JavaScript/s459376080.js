(function(input) {
  var p = input.replace(/\n$/, '').split('\n');
  var n = p.length;
  var m = new Array(10);
  for (var i = 0; i < m.length; i++) {
    m[i] = (new Array(11)).join('0').split('').map(Number);
  }
  for (i = 0; i < n; i++) {
    var a = p.shift().split(',').map(Number);
    var x = a.shift();
    var y = a.shift();
    var s = a.shift();
    drop(m, x, y, s);
  }
  var max = 0;
  var space = 0;
  //console.log(m);
  for (i = 0; i < 10; i++) {
    for (var j = 0; j < 10; j++) {
      var c = m[i][j];
      //console.log(c);
      if (c > max) {
        max = c;
      }
      if (c === 0) {
        space++;
      }
    }
  }
  console.log(space);
  console.log(max);
})(require('fs').readFileSync('/dev/stdin', 'utf8'));

function drop(m, x, y, s) {
  drop_(m, x, y);
  drop_(m, x, y - 1);
  drop_(m, x - 1, y);
  drop_(m, x + 1, y);
  drop_(m, x, y + 1);
  if (s >= 2) {
    drop_(m, x - 1, y - 1);
    drop_(m, x + 1, y - 1);
    drop_(m, x - 1, y + 1);
    drop_(m, x + 1, y + 1);
  }
  if (s >= 3) {
    drop_(m, x, y - 2);
    drop_(m, x - 2, y);
    drop_(m, x + 2, y);
    drop_(m, x, y + 2);
  }
}

function drop_(m, x, y) {
  if (x < 0 || x > 9 || y < 0 || y > 9) {
    return;
  }
  m[x][y]++;
}