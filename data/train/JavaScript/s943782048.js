(function(input) {
  var p = input.replace(/\n$/, '').split('\n\n');
  for (var j = 0; j < p.length; j++) {
    var b = p[j].split('\n');
    var m = [];
    for (var i = 0; i < b.length; i++) {
      m.push(b[i].split('').map(Number));
    }
    console.log(exists(m));
    //console.log(m);
  }
})(require('fs').readFileSync('/dev/stdin', 'utf8'));

function exists(m) {
  for (var i = 0; i < 8; i++) {
    for (var j = 0; j < 8; j++) {
      if (m[i][j] === 1) {
        return exists_(m, j, i);
      }
    }
  }
}

function exists_(m, x, y) {
  if (check(m, x + 1, y) && check(m, x, y + 1) && check(m, x + 1, y + 1)) {
    return 'A';
  }
  if (check(m, x, y + 1) && check(m, x, y + 2) && check(m, x, y + 3)) {
    return 'B';
  }
  if (check(m, x + 1, y) && check(m, x + 2, y) && check(m, x + 3, y)) {
    return 'C';
  }
  if (check(m, x, y + 1) && check(m, x - 1, y + 1) && check(m, x - 1, y + 2)) {
    return 'D';
  }
  if (check(m, x + 1, y) && check(m, x + 1, y + 1) && check(m, x + 2, y + 1)) {
    return 'E';
  }
  if (check(m, x, y + 1) && check(m, x + 1, y + 1) && check(m, x + 1, y + 2)) {
    return 'F';
  }
  if (check(m, x + 1, y) && check(m, x, y + 1) && check(m, x - 1, y + 1)) {
    return 'G';
  }

}

function check(m, x, y) {
  if (x < 0 || x > 7 || y < 0 || y > 7) {
    return false;
  }
  return m[y][x] === 1;
}