function calcultateGCD(a,b,res) {
	if(a==b)
		return a*res;
    else if ((a&1)==0 && (b&1)==0) 
    	return calcultateGCD(a>>1, b>>1, res<<1);	
    else if ((a&1)==0) 
    	return calcultateGCD(a>>1, b, res); 
    else if ((b&1)==0) 
    	return calcultateGCD(a, b>>1, res); 
    else if (a>b) 
    	return calcultateGCD(a-b, b, res);
    else 
    	return calcultateGCD(a, b-a, res); 
}

function calcultateLCM(a,b,gcd) {
	  return a*b/gcd;
}

var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

if(lines.length > 50) {
	console.log("Invalid dataset size. Dataset size is "+lines.length+" but must be <= 50");
} else {
	for (var i = 0; i < lines.length; i++) {
		var line = lines[i].trim();
	    if (line == '') break;
	    var vals = line.split(' ').map(function(i){return +i;});
	    if(vals.length != 2 || isNaN(vals[0]) || isNaN(vals[1]) || vals[0] < 0 || vals[0] > 2000000000 || vals[1] < 0 || vals[1] > 2000000000) {
	    	console.log("Invalid dataset: "+line+ ". Use 0 <= a, b <= 2,000,000,000");
	    } else {
	    	var gcd = calcultateGCD(vals[0],vals[1],1);
	    	var lcm = calcultateLCM(vals[0],vals[1],gcd);
	    	if(lcm > 2000000000)
		    	console.log("Invalid dataset: "+line+ ". LCM is "+lcm+" but must be <= 2,000,000,000");
	    	else 
	    		console.log(gcd+" "+lcm);
		}
	}
}