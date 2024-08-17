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
    .replace("yats_host_keyword", "typescript_host_keyword")
    .replace(
      /exec '([^']*)'\.\(exists\('g:typescript_conceal_[a-z]*'\) \? 'conceal cchar='\.g:typescript_conceal_[a-z]* : ''\)\.' ([^']*)'/gm,
      (_, start, end) => start + end
    )
}

function importEntryFile(source) {
  return source.replace("runtime syntax/common.vim", "source <sfile>:h/shared/typescriptcommon.vim");
}

var typescript = importEntryFile(entry)
var typescriptReact = importEntryFile(entryReact)
var mergedCommon = importFile(common)
fs.writeFileSync('merged/typescript.vim', typescript)
fs.writeFileSync('merged/typescriptreact.vim', typescriptReact)
fs.writeFileSync('merged/typescriptcommon.vim', mergedCommon)
