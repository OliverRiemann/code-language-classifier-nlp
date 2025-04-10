(function(input) {
  var p = input.replace(/\n$/, '').split('\n');
  var a;
  while (a = p.shift().split(' ').map(Number)) {
    if (a.every(function(e) {
        return e ===  0;
      })) {
      return;
    }
    //console.log(result(a));
    console.log(conv(result(a)));
  }
})(require('fs').readFileSync('/dev/stdin', 'utf8'));

function result(a) {
  for (var i = 0; i < 4; i++) {
    var r = Array(4);
    r[i] = a[0];
    for (var j = 0; j < 4; j++) {
      if (r[j] !== undefined) {
        continue;
      }
      r[j] = a[1];
      for (var k = 0; k < 4; k++) {
        if (r[k] !== undefined) {
          continue;
        }
        r[k] = a[2];
        for (var l = 0; l < 4; l++) {
          if (r[l] !== undefined) {
            continue;
          }
          r[l] = a[3];
          //console.log(r);
          var op = ['+', '-', '*'];
          for (var m = 0; m < 3; m++) {
            for (var n = 0; n < 3; n++) {
              for (var o = 0; o < 3; o++) {
                for (var p = 0; p < 3; p++) {
                  var f = [];
                  if (p == 0) {
                    f = [r[0], r[1], r[2], op[m], op[n], r[3], op[o]];
                  } else if (p == 1) {
                    f = [r[0], r[1], op[m], r[2], op[n], r[3], op[o]];
                  } else {
                    f = [r[0], r[1], op[m], r[2], r[3], op[n], op[o]];
                  }
                  //console.log(d);
                  if (calc(f) == 10) {
                    //console.log(f);
                    return f;
                  }
                }
              }
            }
          }
          r[l] = undefined;
        }
        r[k] = undefined;
      }
      r[j] = undefined;
    }
  }
  return false;
}

function calc(a) {
  var stack = [];
  for (var i = 0; i < a.length; i++) {
    var n = a[i];
    //console.log(n);
    if (isNaN(n)) {
      var str = stack.pop();
      str = stack.pop() + ' ' + n + ' ' + str;
      //console.log(str);
      var acm = eval(str);
      //console.log(acm);
      stack.push(acm);
      continue;
    }
    stack.push(Number(n));
  }
  return stack.pop();
}

function conv(a) {
  if (!a) {
    return '0';
  }
  var stack = [];
  for (var i = 0; i < a.length; i++) {
    var n = a[i];
    //console.log(n);
    if (isNaN(n)) {
      var str = stack.pop();
      str = '(' + stack.pop() + ' ' + n + ' ' + str + ')';
      //console.log(str);
      //var acm = eval(str);
      //console.log(acm);
      stack.push(str);
      continue;
    }
    stack.push(Number(n));
  }
  return stack.pop();
}