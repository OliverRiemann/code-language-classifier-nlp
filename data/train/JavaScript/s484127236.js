(function(input) {
  var p = input.replace(/\n$/, '').split('\n');
  var m = [];
  for (var i = 0; i < p.length; i++) {
    m.push(p[i].split('').map(Number))
  }
  console.log('R' + move(m, 0, 0, 'R'));
})(require('fs').readFileSync('/dev/stdin', 'utf8'));

function move(m, x, y, d) {
  //console.log(m, x, y, d);
  if (x === 0 && y === 0 && d === 'L') {
    return '';
  }
  if (d === 'R') {
    if (mm(m, x + 1, y - 1)) {
      return 'U' + move(m, x + 1, y - 1, 'U');
    }
    if (mm(m, x + 1, y)) {
      return 'R' + move(m, x + 1, y, 'R');
    }
    if (mm(m, x + 1, y + 1)) {
      return 'D' + move(m, x + 1, y + 1, 'D');
    }
    return 'L' + move(m, x, y, 'L');
  }
  if (d === 'L') {
    if (mm(m, x, y + 1)) {
      return 'D' + move(m, x, y + 1, 'D');
    }
    if (mm(m, x - 1, y)) {
      return 'L' + move(m, x - 1, y, 'L');
    }
    if (mm(m, x, y - 1)) {
      return 'U' + move(m, x, y - 1, 'U');
    }
    return 'R'+ move(m, x, y, 'R');
  }
  if (d === 'D') {
    if (mm(m, x, y + 1)) {
      return 'R' + move(m, x, y + 1, 'R');
    }
    if (mm(m, x, y + 2)) {
      return 'D' + move(m, x, y + 2, 'D');
    }
    if (mm(m, x - 1, y + 1)) {
      return 'L' + move(m, x - 1, y + 1, 'L');
    }
    return 'U' + move(m, x, y, 'U');
  }
  if (d === 'U') {
    if (mm(m, x - 1, y - 1)) {
      return 'L' + move(m, x - 1, y - 1, 'L');
    }
    if (mm(m, x, y - 2)) {
      return 'U' + move(m, x, y - 2, 'U');
    }
    if (mm(m, x, y - 1)) {
      return 'R' + move(m, x, y - 1, 'R');
    }
    return 'D' + move(m, x, y, 'D');
  }
}

function mm(m, x, y) {
  if (y < 0 || y >= m.length) {
    return 0;
  }
  if (x < 0 || x >= m[y].length) {
    return 0;
  }
  return m[y][x] === 1;
}