var fs = require('fs')

var entry = fs.readFileSync('syntax/typescript.vim', 'utf8')

function replace(_, filename) {
  var source = fs.readFileSync(filename, 'utf8')
  return importFile(source)
}

function importFile(source) {
  return source.replace(/^\s*runtime (.+)?/gm, replace)
}

var merged = importFile(entry)
fs.writeFileSync('merged.vim', merged)
