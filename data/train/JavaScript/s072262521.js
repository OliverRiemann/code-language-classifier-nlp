'use strict';
var NS = {};
function addProps(ns) {
    var isBrowser = function() {
        return typeof window !== 'undefined';
    }
    ns.isBrowser = isBrowser;
    
    var isNodejs = function() {
        return ! isBrowser();
    }
    ns.isNodejs = isNodejs;
    
    if (isBrowser()) {
        var getHtmlEncoded = function(string0) {
            return String(string0)
                    .replace(/&/g, '&amp;')
                    .replace(/"/g, '&quot;')
                    .replace(/'/g, '&#39;')
                    .replace(/</g, '&lt;')
                    .replace(/>/g, '&gt;');
        }
        ns.getHtmlEncoded = getHtmlEncoded;
        
        var outputCode = function() {
            document.getElementById('code').innerHTML = '<pre><code>' + getHtmlEncoded(addProps) + '</code></pre>';
        }
        ns.outputCode = outputCode;
    }
    
    var getInput = function() {
        var inputLines = [];
        if (isBrowser()) {
            var html = document.getElementById('input').innerHTML;
            inputLines = html.split('<br>');
        }
        if (isNodejs()) {
            inputLines = require("fs").readFileSync("/dev/stdin", "utf8").trim().split('\n');
        }
        return inputLines;
    }
    
    var doOutput = function(outputLines) {
        if (isBrowser()) {
            document.getElementById('output').innerHTML = outputLines.map(getHtmlEncoded).join('<br>\n');
        }
        if (isNodejs()) {
            for (var i = 0; i < outputLines.length; i++) {
                console.log(outputLines[i]);
            }
        }
    }
    ns.doOutput = doOutput;
    
    var getProduct = function(a, b) {
        return a * b;
    }
    
    var main = function() {
        var strings = [];
        for (var a = 1; a <= 9; a++) {
            for (var b = 1; b <= 9; b++) {
                var s = a + 'x' + b + '=' + getProduct(a, b);
                strings.push(s);
            }
        }
        doOutput(strings);
    }
    ns.main = main;
}
addProps(NS);
if (NS.isBrowser()) {
    window.onload = function() {
        NS.outputCode();
    }
}
NS.main();