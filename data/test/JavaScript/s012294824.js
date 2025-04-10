(function(input) {
  var p = input.replace(/\n$/, '').split('\n');
  var n = p.length;
  for (var i = 0; i < n; i++) {
    var a = p.shift().split(',').map(Number);
    var r = {};
    for (var j = 0; j < a.length; j++) {
      if (a[j] in r) {
        r[a[j]]++;
      } else {
        r[a[j]] = 1;
      }
    }
    var c = [];
    for (var k in r) {
      if (r[k] in c) {
        c[r[k]].push(k);
      } else {
        c[r[k]] = [k];
      }
    }
    console.log(check(c));
  }
})(require('fs').readFileSync('/dev/stdin', 'utf8'));

function check(c) {
  if (c[4]) {
    return 'four card';
  }
  if (c[3] && c[2]) {
    return 'full house';
  }
  if (c[1] && c[1].length === 5) {
    var a = c[1];
    a = a.map(Number).sort(function (a, b) {
      return a - b;
    });
    //console.log(a);
    if (a[0] > 9) {
      return 'null';
    }
    if (a[1] === 10) {
      return 'straight';
    }
    if (a[1] === a[0] + 1 &&
      a[2] === a[1] + 1 &&
      a[3] === a[2] + 1 &&
      a[4] === a[3] + 1
    ) {
      return 'straight';
    }
  }
  if (c[3]) {
    return 'three card';
  }
  if (c[2] && c[2].length === 2) {
    return 'two pair';
  }
  if (c[2]) {
    return 'one pair';
  }
  return 'null';
}