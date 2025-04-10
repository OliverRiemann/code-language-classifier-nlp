var Triangle;
(function (Triangle) {
    var RightAngle = (function () {
        function RightAngle(a, b, c) {
            this.a = a;
            this.b = b;
            this.c = c;
        }
        RightAngle.prototype.isRightAngle = function () {
            var values = [this.a, this.b, this.c].sort(function (a, b) {
                return b - a;
            });
            return Math.pow(values[0], 2.0) == (Math.pow(values[1], 2.0) + Math.pow(values[2], 2.0));
        };
        return RightAngle;
    })();
    Triangle.RightAngle = RightAngle;
})(Triangle || (Triangle = {}));
process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function (chunk) {
    chunk.trim().split('\n').forEach(function (line) {
        var items = line.trim().split(' ');
        if (items.length == 3) {
            var r = new Triangle.RightAngle(+items[0], +items[1], +items[2]);
            if (r.isRightAngle()) {
                console.log("YES");
            } else {
                console.log("NO");
            }
        }
    });
});