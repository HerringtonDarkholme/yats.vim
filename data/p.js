/*jslint node: true, stupid: true, forin: true */
var yaml    = require('js-yaml');
var fs      = require('fs');
var camel   = require('camel-case');
// var isUpper = require('is-upper-case');


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
  var hilink = true;
  var statics = [];

  yml = yaml.safeLoad(fs.readFileSync(file + '.yml', 'utf8'));

  var globals = {};
  for (group in yml) {
    if (/Global/.test(group) ||
        /Cons$/.test(group) ||
        /BOMWindow(Prop|Method)/.test(group) ||
        /BOM$/.test(group)) {
      rules = yml[group];
      for (i in rules) {
        rule = rules[i];
        globals[rule] = [];
      }
    } else {
      if (/Static/.test(group)) {
        for (i in rules) {
          rule = rules[i];
          if (group.toLowerCase().indexOf(rule.toLowerCase()) >= 0) {
            globals[rule].push(group);
            break;
          }
        }
      }
    }
  }
  for (group in yml) {
    contained = true;
    contains = false;
    statics = [];

    if (/Global|Cons$/.test(group) ||
        /BOMWindow(Prop|Method)/.test(group) ||
        /BOM$/.test(group)) {
        contained = false;
    }

    rules = yml[group];
    rule = rules.shift();
    defs = [];
    predef = 'syntax keyword ' + group;
    if (contained) {
        predef += ' contained';
    } else {
      predef += ' containedin=typescriptIdentifierName';
    }
    def = predef;

    while(rule) {
      // if (!isUpper(rule.substr(0,1))) {
      statics = globals[rule];
      if (statics && typeof statics !== 'function' && statics.length) {
        console.log(predef + ' ' + rule +
            ' nextgroup=' + group + rule + 'Dot,typescriptFuncCallArg');
        console.log('syntax match   ' + group + rule +
            'Dot /\\./ contained nextgroup=' + statics.join(',') + ',typescriptProp');
      } else {
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
            if (/Event/.test(group)) {
              def = def + ' nextgroup=typescriptEventFuncCallArg';
            } else {
              def = def + ' nextgroup=typescriptFuncCallArg';
            }
          }
          console.log(def);
          def = predef;
        }
      }
      rule = rules.shift();
    }
    if (def.length > predef.length) {
      if (/Method/.test(group)) {
        if (/Event/.test(group)) {
          def = def + ' nextgroup=typescriptEventFuncCallArg';
        } else {
          def = def + ' nextgroup=typescriptFuncCallArg';
        }
      }
      console.log(def);
    }

    if (contains) {
      console.log('syntax match ' + group + ' contained /contains/');
    }
    if (/Prop|Method/.test(group) && !/Static/.test(group)) {
      console.log('syntax cluster props add=' + group);
    }
    if (file === 'event') {
      console.log('syntax cluster events add=' + group);
    }

    hilink = true;
    if (group === 'typescriptGlobal' && file !== 'typescript') {
        hilink = false;
    }
    if (hilink) {
      if (file === 'event') {
        console.log('if exists("did_typescript_hilink") | HiLink ' +
            group +
            ' Title');
      } else if (contained) {
        console.log('if exists("did_typescript_hilink") | HiLink ' +
            group + ' Keyword');
      } else {
        console.log('if exists("did_typescript_hilink") | HiLink ' +
            group + ' Structure');
      }
      console.log('endif');
    }
  }

} catch (e) {
  console.log(e);
}

