// tested on node version 0.10.36
var fs = require("fs");

// Note: solution is based on information from the following page 
// https://www.chilimath.com/algebra/advanced/cramers/2x2.html

/*
    determinant of 2x2 matrix
    [ a  b ]
    [ c  d ]
*/
function det(a, b, c, d) {
    return a * d - b * c;
}
/*
    ax+by=c
    dx+ey=f

    [a b] = [c]
    [d e] = [f]

    x matrix:
    [c b]
    [f e]

    y matrix:
    [a c]
    [d f]
*/
function solve_xy(a, b, c, d, e, f) {
    var D = det(a, b, d, e)
    var x = det(c, b, f, e) / D;
    var y = det(a, c, d, f) / D;
    return { x: x, y: y }
}
var input = fs.readFileSync('/dev/stdin').toString();
var lines = input.split("\n");
for(var i = 0; i < lines.length; i++) {
    var parts = lines[i].split(" ");
    var a = parseInt(parts.shift());
    var b = parseInt(parts.shift());
    var c = parseInt(parts.shift());
    var d = parseInt(parts.shift());
    var e = parseInt(parts.shift());
    var f = parseInt(parts.shift());
    if(!isNaN(a)) {
        var solution = solve_xy(a, b, c, d, e, f);
        console.log(solution.x.toFixed(3), solution.y.toFixed(3));
    }
}