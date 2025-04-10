/*
	?§£????????????:Area of Polygon
	(http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0079)

	-status:null(????????????????????±??????????????????...)

	-comment:
        ????????????????????????
*/
var log = console.log;
if (typeof process != "undefined") {
    var input = "";
    process.stdin.resume();
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', function(chunk) {
        input += chunk;
    });
    process.stdin.on('end', function() {
        var lines = input.split("\n");
        main(lines);
    });
}


function main(lines) {
    lines = lines.map(function(line) {
        return line.split(" ").filter(function(e) {
            return e != "";
        }).map(function(e) {
            var n = Number(e);
            if (n.toString() == "NaN") {
                return e.replace(/(\r)|(\n)/g, "");
            }
            return n;
        });
    });
    var last = lines.pop();
    if (last.length == 8) {
        lines.push(last);
    }
    //log(lines);
    //log(Math.pow(0.1, 10));
    //lines.shift();
    while (lines.length > 0) {
        var dataset = lines.shift();
        p_set(dataset);
    }
}

function p_set(ps) {
    var va = [ps[0] - ps[6], ps[1] - ps[7]];
    var vb = [ps[2] - ps[6], ps[3] - ps[7]];
    var vc = [ps[4] - ps[6], ps[5] - ps[7]];
    var s1 = sign_s_main(va, vb) > 0 ? 1 : -1;
    var s2 = sign_s_main(vb, vc) > 0 ? 1 : -1;
    var s3 = sign_s_main(vc, va) > 0 ? 1 : -1;
    if (
        s1 == s2 &&
        s2 == s3 &&
        s3 == s1
    ) {
        log("YES");
    } else {
        log("NO");
    }
}

function sign_s_main(pa, pb) {
    //?????????2??§????????????
    return (pa[0] * pb[1] - pa[1] * pb[0]);
}