// tested on node version 0.10.36
var fs = require("fs");

var primes = [2];

function scan_primes(max) {
    var min = primes[primes.length - 1];
    if(max <= min) {
        return;
    }
    for(var n = min + 1; n <= max; n++) {
        var isPrime = true;
        var limit = Math.sqrt(n);
        // check if n is divisible by any of the known primes below it!
        for(var i = 0; i < primes.length; i++) {
            var p = primes[i];
            if(p > limit) {
                break;
            }
            if(n % p === 0) {
                isPrime = false;
                break;
            }
        }
        if(isPrime) {
            primes.push(n);
        }
    }
}

function count_primes_until(m) {
    for(var i = 0; i < primes.length; i++) {
        if(primes[i] > m) {
            return i;
        }
    }
    return primes.length;
}

var input = fs.readFileSync('/dev/stdin').toString();
var lines = input.split("\n");
for(var i = 0; i < lines.length; i++) {
    var n = parseInt(lines[i]);
    if(!isNaN(n)) {
        scan_primes(n + 1);
        // console.log("len:", primes.length);
        // console.log("primes:", primes);
        console.log(count_primes_until(n));
    }
}