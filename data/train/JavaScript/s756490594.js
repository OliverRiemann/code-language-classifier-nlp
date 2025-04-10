function Vector(x, y) {
  this.x = x;
  this.y = y;
}
Vector.prototype.sub = function(v) {
  return new Vector(this.x - v.x, this.y - v.y);
};
Vector.prototype.product = function(v) {
  return this.x * v.y - this.y * v.x;
};

(function(input) {
  var p = input.replace(/\n$/, '').split('\n');
  var n = p.length;
  for (var i = 0; i < n; i++) {
    var a = p.shift().split(',').map(Number);
    console.log(cross.apply(null, a));
  }
})(require('fs').readFileSync('/dev/stdin', 'utf8'));

function cross(xa, ya, xb, yb, xc, yc, xd, yd) {
  var va = new Vector(xa, ya);
  var vb = new Vector(xb, yb);
  var vc = new Vector(xc, yc);
  var vd = new Vector(xd, yd);

  var vba = vb.sub(va);
  var vcb = vc.sub(vb);
  var vdc = vd.sub(vc);
  var vad = va.sub(vd);

  var c1 = vba.product(vcb);
  var c2 = vcb.product(vdc);
  var c3 = vdc.product(vad);
  var c4 = vad. product(vba);

  if ((c1 > 0 && c2 > 0 && c3 > 0 && c4 > 0) ||
    (c1 < 0 && c2 < 0 && c3 < 0 && c4 < 0)) {
    return 'YES';
  }
  return 'NO';
}

function cross_(x1, y1, x2, y2) {
  return x1 * y2 - x2 * y1;
}