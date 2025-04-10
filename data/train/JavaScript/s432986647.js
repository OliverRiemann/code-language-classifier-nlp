(function underscore(undefined) {
	'use strict';
	var ArrayProto = Array.prototype, ObjProto = Object.prototype, FuncProto = Function.prototype;

	var push = ArrayProto.push,
	slice = ArrayProto.slice,
	concat = ArrayProto.concat,
	toString = ObjProto.toString,
	hasOwnProperty = ObjProto.hasOwnProperty;

	var nativeForEach = ArrayProto.forEach,
	nativeMap = ArrayProto.map,
	nativeReduce = ArrayProto.reduce,
	nativeReduceRight = ArrayProto.reduceRight,
	nativeFilter = ArrayProto.filter,
	nativeEvery = ArrayProto.every,
	nativeSome = ArrayProto.some,
	nativeIndexOf = ArrayProto.indexOf,
	nativeLastIndexOf = ArrayProto.lastIndexOf,
	nativeIsArray = Array.isArray,
	nativeKeys = Object.keys,
	nativeBind = FuncProto.bind;

	this._ = {};
	var each = _.each = _.forEach = function(obj, iterator, context) {
		if (obj == null) return;
		if (nativeForEach && obj.forEach === nativeForEach) {
			obj.forEach(iterator, context);
		} else if (obj.length === +obj.length) {
			for (var i = 0, l = obj.length; i < l; i++) {
				if (iterator.call(context, obj[i], i, obj) === breaker) return;
			}
		} else {
			for (var key in obj) {
				if (_.has(obj, key)) {
					if (iterator.call(context, obj[key], key, obj) === breaker) return;
				}
			}
		}
	};

	_.extend = function(obj) {
		each(slice.call(arguments, 1), function(source) {
			if (source) {
				for (var prop in source) {
					obj[prop] = source[prop];
				}
			}
		});
		return obj;
	};
}).call(global);

(function(undefined){
	'use strict';

	var INPUT_TYPE = 'number';

	var Solver = {
		fire: function() {
			setTimeout( Solver.solve, 0, this );
		},
		solve: function solve() {
			var n = input_number();
			var res = 0;
			for ( var a = 0; a <= 9; ++ a ) {
				for ( var b = 0; b <= 9; ++ b ) {
					for ( var c = 0; c <= 9; ++ c ) {
						for ( var d = 0; d <= 9; ++ d ) {
							if ( a + b + c + d === n )
								res ++;
						}
					}
				}
			}
			output(res);
			if ( ! has_next() )
				setTimeout( Solver.solve, 0, this );
		}
	};

	(function init() {
		_.extend( this, {
			output: function() {
				console.log.apply( console, arguments );
			},
			stdin: process.openStdin(),
			input_list: [],
			input_number: function() {
				return parseInt( input_list.splice(0,1)[0] );
			},
			input_text: function() {
				return input_list.splice(0,1)[0];
			},
			has_next: function() {
				return ! input_list.length;
			}
		} );

		var INPUT_REGEXP_LIST = {};
		INPUT_REGEXP_LIST['string'] = /\w*/g;
		INPUT_REGEXP_LIST['number'] = /[-]?\d+/g;
		var INPUT_REGEXP = INPUT_REGEXP_LIST[INPUT_TYPE];

		stdin.setEncoding('utf8');
		stdin.on('data', function(chunk){
			var result = chunk.match(INPUT_REGEXP);
			input_list = input_list.concat(result.filter(function(line){
				return line.length;
			}));
		});
		stdin.on('end', function(){
			Solver.fire.call(this);
		});
	}).call( this );

}).call(global);