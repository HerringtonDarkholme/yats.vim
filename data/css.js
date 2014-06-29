/*jslint node: true, stupid: true, forin: true */
var yaml = require('js-yaml');
var fs   = require('fs');
var camel = require('camel-case');

// Get document, or throw exception on error
try {
  var files = ['bom', 'dom', 'css'];
  var i = 0;
  var yml = {};
  var group = '';
  var rules = [];
  var rule = '';
  var defs = [];
  var predef = '';
  var def = '';


  for (i in files) {
    console.log('');
    yml = yaml.safeLoad(fs.readFileSync(files[i] + '.yml', 'utf8'));

    for (group in yml) {
      rules = yml[group];
      rule = rules.shift();
      defs = [];
      predef = 'syntax keyword ' + group;
      def = predef;

      while(rule) {
        def = def + ' ' + camel(rule);
        if (def.length > 80) {
          console.log(def);
          def = predef;
        }
      rule = rules.shift();
      }
    }

  }

} catch (e) {
  console.log(e);
}

