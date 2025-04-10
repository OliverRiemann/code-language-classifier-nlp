function Main(input) {
    var week = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    inputLine = input.split("\n");
    for(var i=0;;i++){
        var dateObj = new Date();
        dateObj.setFullYear(2004);
        var date = inputLine[i].split(" ");
        var month = int(date[0]);
        var day = int(date[1]);
        if(month === 0)break;
        dateObj.setMonth(month-1);
        dateObj.setDate(day);
        output(week[dateObj.getDay()]);
        dateObj=null;
    }
}

//??°??????????????¢??°??¨(??????)
function ascendingOrder(val1,val2){
    return val1 - val2;
}
//??°??????????????¢??°??¨(??????)
function descendingOrder(val1,val2){
    return val2 - val1;
}
//??°??????
function int(str){
    return parseInt(str, 10);
}
//????????????
function str(num){
    return num.toString(10);
}
function output(str){
	if(_Isdebug){
		document.getElementById("Console").value+=(str+"\n");
	}
	console.log(str);
}

//???????????°??¨
var _Isdebug = false;

function debug(){
	_Isdebug = true;
	var input = document.getElementById("Console").value;
	document.getElementById("Console").value+="\n";
	Main(input);
}

//??\??????????????????
Main(require("fs").readFileSync("/dev/stdin", "utf8"));