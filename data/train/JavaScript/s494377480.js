var input = '';
process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(chunk) {
    input += chunk;
});
process.stdin.on('end', function() {
    main(input)
});

function main(arg){
    var mountains = arg.split('\n');
    mountains = mountains.map(function(x){ return parseInt(x); })

    var topMountains = [];

    iterateTopMountains(function init(i){
        topMountains[i] = 0;
    })

    for(var i = 0; i < mountains.length; i += 1){
        var mountain = mountains[i];

        iterateTopMountains(function displace(rank){
            if(mountain > topMountains[rank]){
                topMountains.splice(rank, 0, mountain);
                return true;
            }
        })

    }

    iterateTopMountains(function show(i){
        console.log(topMountains[i]);
    })
}

function iterateTopMountains(func){
    var numTopMountains = 3;
    for(var i = 0; i < numTopMountains; i += 1){
        var needBreak = func(i);

        if(needBreak){ break; }
    }
}