var fs = require('fs')

var entry = fs.readFileSync('syntax/typescript.vim', 'utf8')
var entryReact = fs.readFileSync('syntax/typescriptreact.vim', 'utf8')

function replace(_, filename) {
  var source = fs.readFileSync(filename, 'utf8')
  return importFile(source)
}

function importFile(source) {
  return source.replace(/^\s*runtime (.+)?/gm, replace)
}

var merged = importFile(entry)
var mergedReact = importFile(entryReact)
fs.writeFileSync('merged/typescript.vim', merged)
fs.writeFileSync('merged/typescriptreact.vim', mergedReact)
