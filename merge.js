var fs = require('fs')

var entry = fs.readFileSync('syntax/typescript.vim', 'utf8')
var entryReact = fs.readFileSync('syntax/typescriptreact.vim', 'utf8')
var common = fs.readFileSync('syntax/common.vim', 'utf8')

function replace(_, indentation, filename) {
  var source = fs.readFileSync(filename, 'utf8')
  return importFile(source.replace(/^(?!$)/gm, indentation))
}

function importFile(source) {
  return source
    .replace(/^([ \t]*)runtime (.+)?/gm, replace)
    .replace(
      /exec '([^']*)'\.\(exists\('g:typescript_conceal_[a-z]*'\) \? 'conceal cchar='\.g:typescript_conceal_[a-z]* : ''\)\.' ([^']*)'/gm,
      (_, start, end) => start + end
    )
}

var merged = importFile(entry)
var mergedReact = importFile(entryReact)
var mergedCommon = importFile(common)
fs.writeFileSync('merged/typescript.vim', merged)
fs.writeFileSync('merged/typescriptreact.vim', mergedReact)
fs.writeFileSync('merged/typescriptcommon.vim', mergedCommon)
