(function set_utils(undefined){
	this.print_float = function print_float(val, base, pad, prec) {
		var p10=Math.pow(10,prec);
		var ival=""+Math.round(val*p10);
		if ( ival === '0' )
			return '0.000';
		var ilen=ival.length-prec;
		if(ilen===0)
			return "0."+ival.substr(ilen,prec);
		return ival.substr(0,ilen)+"."+ival.substr(ilen,prec);
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
		function sq(x) {
			return x * x;
		}
		function check(v) {
		}
		this.fire = function() {
			setTimeout( function solve() {
				var a = input_number();
				var b = input_number();
				var c = input_number();
				var d = input_number();
				var e = input_number();
				var f = input_number();
				var delta = 1.0 / ( a*e - b*d );
				var x = ( e * c - b * f ) * delta;
				var y = ( a * f - d * c ) * delta;
				output( print_float(x,10,3,3) + ' ' + print_float(y,10,3,3)  );
				if ( ! has_next() )
					setTimeout( solve, 0, this );
			}, 0, this );
		};
	}).call(this);

}).call(global);