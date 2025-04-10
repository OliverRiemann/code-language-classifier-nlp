function generateTrianglesFromInput(input) {
  var max = 1000;

  var lines = getInputAsLines(input, "\n");
  var vertices = lines.map(processLineToVertices);

  for(var i = 0; i < vertices.length; i++) {
    var line = vertices[i];
    if(i === 0) {
      if(line[0] > max) {
        break;
      }
    }
    var tri = new Triangle({
      constraints: {
        min: 1,
        max: 1000
      },
      vertices: {
        a: line[0],
        b: line[1],
        c: line[2]
      }
    });

    if(tri.isValid()) {
      var isRightAngleTriangle = tri.isRightAngleTriangle();
      var logValue = (isRightAngleTriangle) ? 'YES' : 'NO';
      console.log(logValue);
    }
  }
}

function getInputAsLines(input, delimeter) {
  return input.split(delimeter);
}

function processLineToVertices(line) {
  var vertices = line.split(' ');
  return vertices;
}


//Triangle
function Triangle(options) {

  this.constraints = {};
  this.vertices = {};

  //Set up triangle constraints.
  this.constraints.min = options.constraints.min || 1;
  this.constraints.max = options.constraints.max || 1000;

  //Set up triangle vertices
  this.vertices.a = (this.vertexIsWithinConstraints(options.vertices.a)) ? options.vertices.a : null;
  this.vertices.b = (this.vertexIsWithinConstraints(options.vertices.b)) ? options.vertices.b : null;
  this.vertices.c = (this.vertexIsWithinConstraints(options.vertices.c)) ? options.vertices.c : null;

}

Triangle.prototype.vertexIsWithinConstraints = function(vertex) {
  return (vertex >= this.constraints.min && vertex <= this.constraints.max);
}

Triangle.prototype.isValid = function() {
  return (this.vertices.a && this.vertices.b && this.vertices.c);
}

Triangle.prototype.isRightAngleTriangle = function() {
  var value = false;
  if(this.isValid) {
    var vertexArray = [];
    vertexArray.push(this.vertices.a);
    vertexArray.push(this.vertices.b);
    vertexArray.push(this.vertices.c);

    vertexArray.sort(function(a, b) {return a-b});

    var squares = vertexArray.map(function (vertex) { return Math.pow(vertex, 2)});
    value = (squares[2] === (squares[0] + squares[1]));
  }

  return value;
}

var input = require('fs').readFileSync('/dev/stdin', 'utf8').trim();
generateTrianglesFromInput(input);