process.stdin.resume();
process.stdin.setEncoding('utf8');

var _HEIGHT = 8;
//入力
var input_string = '';
process.stdin.on('data', function(chunk) {
    input_string += chunk.toString();
});

//main処理
process.stdin.on('end', function() {
    //入力 -> Array
    var lines = input_string.split('\n');
    lines = lines.filter(function(val) {
        return val !== '';
    });
    // ８個ずつ
    while (lines.length >= _HEIGHT) {
        judge(lines.splice(0, _HEIGHT));
    }
});

function judge(ary) {
    tmpAry = ary.filter(function(val) {
       return val.indexOf('1') >= 0; 
    });
    
    compShape(tmpAry);
}

function compShape(ary) {
    switch (ary.length) {
        case 1:
            console.log('C')
            break;
        case 2:
            case2(ary);
            break;
        case 3:
            case3(ary);
            break;
        case 4:
            console.log('B')
            break;
        default:
            console.log('Error');
    }
}

function case2(ary) {
    ind0 = ary[0].indexOf('1');
    ind1 = ary[1].indexOf('1');
    
    if (ind0 < ind1) {
        console.log('E');
    }
    else if (ind0 > ind1) {
        console.log('G');
    }
    else {
        console.log('A');
    }
}

function case3(ary) {
    ind0 = ary[0].indexOf('1');
    ind1 = ary[1].indexOf('1');
    
    if (ind0 > ind1) {
        console.log('D');
    }
    else {
        console.log('F');
    }
}
