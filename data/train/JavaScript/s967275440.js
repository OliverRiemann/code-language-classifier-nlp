(function(input) {
    var p = input.replace(/\n$/, '').split('\n').map(Number);
    for (var i = 0; i < p.length; i++) {
        var n = p[i];
        var count = 0;
        for (var a = 0; a < 10; a++) {
            //console.log('a = ' + a);
            var sa = n - a;
            if (sa < 0) {
                break;
            }
            for (var b = 0; b < 10; b++) {
                //console.log('b = ' + b);
                var sb = sa - b;
                if (sb < 0) {
                    break;
                }
                for (var c = 0; c < 10; c++) {
                    //console.log('c = ' + c);
                    var sc = sb - c;
                    if (sc < 0) {
                        break;
                    }
                    for (var d = 0; d < 10; d++) {
                        //console.log('d = ' + d);
                        var sd = sc - d;
                        if (sd === 0) {
                            //console.log(a, b, c, d);
                            count++;
                            break;
                        }
                    }
                }
            }
        }
        console.log(count);
    }
})(require('fs').readFileSync('/dev/stdin', 'utf8'));