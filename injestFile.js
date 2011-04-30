var jsdom = require('jsdom').jsdom;
var fs = require('fs');

var raw =fs.readFileSync('templates/index.html', 'ascii');

var win = jsdom(raw, null, {
		    features : {
			QuerySelector : true
		    }
		});

console.log(win.querySelectorAll('div').length);