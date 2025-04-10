var print = console.log; // like python
var input_lines; // ?¨??????\????????????????????????????????????

function PreMain(input) {
    input_lines = input.split("\n");
    var f = function () {
        return input_lines.shift();
    };
    Main(f);
}

function IL(min1Flg) {
    var s = input_lines.shift().split(' ');
    var offset = min1Flg ? -1 : 0;
    var res = [];
    for (var i = 0; i < s.length; i++) {
        res.push(parseInt(s[i]));
    }
    return res;
}

/**
 * @return {number}
 */
Array.prototype.SUM = function SUM() {
    var sum = 0;
    this.forEach(function (elm) {
        sum += elm;
    });
    return sum;
};

/**
 * @return {string}
 */
Array.prototype.Format = function Format(split) {
    if (split === undefined) {
        split = " ";
    }
    return this.join(split);
};

Array.prototype.Copy = function Copy() {
    return [].concat(this);
};

/***
 * ??????Sort
 * <Array>.sort?????¨???(?????????)???????????????????????¨????????¨???
 * ??°????????????????????§?????°????????????????????????????????´??????????????????????????¨?????????
 * @constructor
 */
Array.prototype.Sort = function Sort() {
    this.sort(function (a, b) {
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
    });
};

/*

(((???????????)??? ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????

*/


function prime_numbers(n) {
    var tbl = [-1, -1];
    for (var i = 2; i <= n; i++) {
        tbl.push(0)
    }

    for (var i = 2; i <= Math.sqrt(n); i++) {
        if (tbl[i] === 0) {
            for (var j = i * 2; j <= n; j += i) {
                tbl[j] = -1;
            }
        }
    }
    var res = [];
    tbl.forEach(function (t, number) {
        if (t === 0) {
            res.push(number);
        }
    });
    return res;
}
function range(i,n){
    var res = [];
    for(;i<n;i++){
        res.push(i);
    }
    return res;
}

function get_a_pat() {

    var pat = {};
    range(1,26).forEach(function (a) {
        if(a % 2===0 || a % 13===0){
            return;
        }
        var acode = 'a'.charCodeAt(0);
        for (var b = 0; b < 26; b++) {
            var tmp = '';
            var tmp2 = '';

            for (var i = 0; i < 4; i++) {
                var x = 'this'.charCodeAt(i) - acode;
                tmp += String.fromCharCode(((a * x + b) % 26) + acode);
                var y = 'that'.charCodeAt(i) - acode;
                tmp2 += String.fromCharCode(((a * y + b) % 26) + acode);
            }
            if (pat.hasOwnProperty(tmp)) {
                print(tmp);
            }
            if (pat.hasOwnProperty(tmp2)) {
                print(tmp2);

            }
            pat[tmp] = [a, b];
            pat[tmp2] = [a, b];
        }
    });
    return pat;
}

function get_foo(a, b, str) {
    var acode = 'a'.charCodeAt(0);
    var tmp = '';
    for (var i = 0; i < 26; i++) {
        tmp += String.fromCharCode(((a * i + b) % 26) + acode);
    }
    var res = '';
    for (var i = 0; i < str.length; i++) {
        if (str.charAt(i) === ' ') {
            res += ' ';
        } else {
            res += String.fromCharCode(tmp.indexOf(str.charAt(i)) + acode);
        }
    }
    return res;

}

function Main(input) {
    var n = parseInt(input());
    var p = get_a_pat();
    var key;
    for (var j = 0; j < n; j++) {
        var str_org = input();
        var str = str_org.split(' ');
        for (var i = 0; i < str.length; i++) {
            if (p.hasOwnProperty(str[i])) {
                key = p[str[i]];
                break;
            }
        }
        print(get_foo(key[0], key[1], str_org));

    }


}

 PreMain(require("fs").readFileSync("/dev/stdin", "utf8"));
//PreMain(require("fs").readFileSync("input.txt", "utf8"));


// print(get_a_pat().hasOwnProperty('fpmi'));