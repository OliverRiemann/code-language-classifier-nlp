(function utils(undefined){
	this.print_float = function print_float(val, base, pad, prec) {
		var p10=Math.pow(10,prec);
		var ival=""+Math.round(val*p10);
		if ( ival === '0' )
			return '0.'+Array(prec+1).join('0');
		var ilen=ival.length-prec;
		if(ilen===0)
			return "0."+ival.substr(ilen,prec);
		return ival.substr(0,ilen)+"."+ival.substr(ilen,prec);
	};
}).call(global);

(function math(undefined) {
	this.gcd = function gcd( a, b ) {
		return !b ? a : gcd( b, a % b );
	};
	this.lcm = function lcm( a, b ) {
		return a / gcd( a, b ) * b;
	};
	this.sq = function sq(x) {
		return x * x;
	};
}).call(global);

(function(undefined){
	'use strict';

	(function init() {
		this.output = function() {
			console.log.apply( console, arguments );
		};
		this.stdin = process.openStdin();
		stdin.setEncoding('utf8');
		this.input_list = [];
		stdin.on('data', function(chunk){
			var result = chunk.match(/[-]?\d+/g);
			input_list = input_list.concat(result);
		});
		stdin.on('end', function(){
			fire();
		});
		this.input_number = function() {
			return parseInt( input_list.splice(0,1)[0] );
		};
		this.has_next = function() {
			return ! input_list.length;
		};
	}).call( this );

	(function solver(){
		this.fire = function() {
			setTimeout( solve, 0, this );
		};
		function solve() {
			var args = [input_number(), input_number()];
			output( gcd.apply( this, args ), lcm.apply( this, args ) );
			if ( ! has_next() )
				setTimeout( solve, 0, this );
		}
	}).call(this);

}).call(global);