var primeNxt = new Array(1000000);

function primeGenerator()
{
    var p, fact, m;
    var maxN = 9999999;
    var primePrv = new Array(1000000);

    // Initial
    for(p=2;p<=maxN;++p){
        primeNxt[p] = p + 1;
        primePrv[p] = p - 1;
    }
    primePrv[2] = 0;
    primeNxt[maxN] = 0;
    
    // Make prime table (primeNxt)
    for(p=2;p*p<=maxN;p=primeNxt[p]){
        for(fact=p;p*fact<=maxN;fact=primeNxt[fact]){
            for(m=p*fact;m<=maxN;m*=p){
                primeNxt[primePrv[m]] = primeNxt[m];
                primePrv[primeNxt[m]] = primePrv[m];
            }
        }
    }
}

process.stdin.resume();
process.stdin.setEncoding('utf8');
 
process.stdin.on('data', function(input){
    primeGenerator();
    input.trim().split('\n').forEach(function(val){
        var N = parseInt(val);
        var cnt = 1;
        if( N == 1 ){
            console.log(0);
        }
        else if( N == 2 ){
            console.log(1);
        }
        else{
            for(var i=3;i<=N;i=primeNxt[i]){
               ++cnt;
            }
            console.log(cnt);
        }
    });
});