/*jslint node: true, stupid: true, forin: true */
var yaml = require('js-yaml');
var fs   = require('fs');
var camel = require('camel-case');
var isUpper = require('is-upper-case');

// Get document, or throw exception on error
try {
  var files = ['javascript', 'node', 'bom', 'bom-window', 'bom-navigator', 'dom', 'css'];
  var i = 0;
  var yml = {};
  var group = '';
  var rules = [];
  var rule = '';
  var defs = [];
  var predef = '';
  var def = '';
  var contained = true;


  for (i in files) {
    console.log('');
    yml = yaml.safeLoad(fs.readFileSync(files[i] + '.yml', 'utf8'));

    for (group in yml) {
      contained = true;
      if (/Global/.test(group) || /BOMWindow(Prop|Method|Cons)/.test(group)) {
          contained = false;
      }
      
      rules = yml[group];
      rule = rules.shift();
      defs = [];
      predef = 'syntax keyword ' + group;
      if (contained) {
          predef += ' contained';
      }
      def = predef;

      while(rule) {
        if (!isUpper(rule.substr(0,1))) {
          rule = camel(rule);
        }
        def = def + ' ' + rule;
        if (def.length > 80) {
          console.log(def);
          def = predef;
        }
        rule = rules.shift();
      }
      if (def.length > predef.length) {
        console.log(def);
      }
    }

  }

} catch (e) {
  console.log(e);
}

