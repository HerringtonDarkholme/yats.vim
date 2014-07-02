/*jslint node: true, stupid: true, forin: true */
var yaml    = require('js-yaml');
var fs      = require('fs');
var camel   = require('camel-case');
var isUpper = require('is-upper-case');


// Get document, or throw exception on error
try {
  var file = process.argv[2];
  var i = 0;
  var yml = {};
  var group = '';
  var rules = [];
  var rule = '';
  var defs = [];
  var predef = '';
  var def = '';
  var contained = true;
  var contains = false;


  yml = yaml.safeLoad(fs.readFileSync(file + '.yml', 'utf8'));

  for (group in yml) {
    contained = true;
    contains = false;
    if (/Global/.test(group) || /Cons/.test(group) || /BOMWindow(Prop|Method)/.test(group) || /BOM$/.test(group)) {
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
      // if (!isUpper(rule.substr(0,1))) {
      if (/Style/.test(group)) {
        rule = camel(rule);
      }
      if (rule !== 'contains') {
        def = def + ' ' + rule;
      } else {
        contains = true;
      }
      if (def.length > 80) {
        if (/Method/.test(group)) {
          def = def + ' nextgroup=javascriptFuncArg'
        }
        console.log(def);
        def = predef;
      }
      rule = rules.shift();
    }
    if (def.length > predef.length) {
      console.log(def);
    }

    if (contains) {
      console.log('syntax match ' + group + ' contained /contains/');
    }
    if (/Prop|Method/.test(group)) {
      console.log('syntax cluster props add=' + group);
    }

    if (contained) {
      console.log('if exists("did_javascript_hilink") | HiLink ' + group + ' Type');
    } else {
      console.log('if exists("did_javascript_hilink") | HiLink ' + group + ' Structure');
    }
    console.log('endif');
  }

} catch (e) {
  console.log(e);
}

