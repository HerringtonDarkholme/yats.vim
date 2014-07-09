" Vim syntax file
" Language:     JavaScript
" Maintainer:   Kao Wei-Ko(othree) <othree@gmail.com>
" Last Change:  2014-07-02
" Version:      1.0
" Changes:      Go to https://github.com/othree/yajs for recent changes.
" Origin:       https://github.com/jelera/vim-javascript-syntax
" Credits:      Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck 
"               (This file is based on their hard work), gumnos (From the #vim 
"               IRC Channel in Freenode)

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  let did_javascript_hilink = 1
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
else
  finish
endif

"Dollar sign is permitted anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"Syntax coloring for Node.js shebang line
syntax match   shellbang "^#!.*/bin/env\s\+node\>"


"JavaScript comments
syntax keyword javascriptCommentTodo           TODO FIXME XXX TBD contained
syntax match   javascriptLineComment           "\/\/.*" contains=@Spell,javascriptCommentTodo
syntax match   javascriptCommentSkip           "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javascriptComment               start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo

"JSDoc
syntax case ignore

syntax region  javascriptDocComment            matchgroup=javascriptComment start="/\*\*"  end="\*/" contains=javascriptDocNotation,javascriptCommentTodo,@Spell fold
syntax match   javascriptDocNotation           contained "@" nextgroup=javascriptDocTags
                                               
syntax keyword javascriptDocTags               contained constant constructor constrructs event function ignore inner private public static
syntax keyword javascriptDocTags               contained const dict expose inheritDoc interface nosideeffects override protected struct
syntax keyword javascriptDocTags               contained example
                                               
syntax keyword javascriptDocTags               contained arguments lends memberOf name type link nextgroup=javascriptDocParam skipwhite
                                               
syntax keyword javascriptDocTags               contained author class default deprecated description nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained fileOverview namespace requires since version nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained license preserve nextgroup=javascriptDocDesc skipwhite
                                               
syntax keyword javascriptDocTags               contained borrows exports nextgroup=javascriptDocA skipwhite
syntax keyword javascriptDocTags               contained param property nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained define enum extends implements this typedef nextgroup=javascriptDocParamType skipwhite
syntax keyword javascriptDocTags               contained returns throws nextgroup=javascriptDocParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained see nextgroup=javascriptDocRef skipwhite
                                               
syntax match   javascriptDocNamedParamType     contained "{.\+}" nextgroup=javascriptDocParamName skipwhite
syntax match   javascriptDocParamName          contained "\[\?\w\+\]\?" nextgroup=javascriptDocDesc skipwhite
syntax match   javascriptDocParamType          contained "{.\+}" nextgroup=javascriptDocDesc skipwhite
syntax match   javascriptDocA                  contained "\%(#\|\w\|\.\|:\|\/\)\+" nextgroup=javascriptDocAs skipwhite
syntax match   javascriptDocAs                 contained "\s*as\s*" nextgroup=javascriptDocB skipwhite
syntax match   javascriptDocB                  contained "\%(#\|\w\|\.\|:\|\/\)\+"
syntax match   javascriptDocParam              contained "\%(#\|\w\|\.\|:\|\/\)\+"
syntax match   javascriptDocRef                contained "\%(#\|\w\|\.\|:\|\/\)\+"
syntax region  javascriptDocLinkTag            contained matchgroup=javascriptDocLinkTag start="{" end="}" contains=javascriptDocTags

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200
  " syntax sync match javascriptHighlight grouphere javascriptBlock /{/
endif

syntax case match

"Syntax in the JavaScript code
syntax region  javascriptString	               start=+"+  skip=+\\\\\|\\"+  end=+"\|$+
syntax region  javascriptString	               start=+'+  skip=+\\\\\|\\'+  end=+'\|$+
syntax region  javascriptTemplate              start=+`+  skip=+\\\\\|\\`+  end=+`\|$+	contains=javascriptTemplateSubstitution
syntax match   javascriptTemplateSubstitution  /\${\w\+}/

syntax match   javascriptNumber	               "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax match   javascriptFloat                 /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax region  javascriptRegexpString          start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 oneline
" syntax match   javascriptLabel            /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
syntax keyword javascriptReserved              break case catch class const continue
syntax keyword javascriptReserved              debugger default delete do else export
syntax keyword javascriptReserved              extends finally for function if 
" function
"import
syntax keyword javascriptReserved              in instanceof let new return super
syntax keyword javascriptReserved              switch this throw try typeof var
syntax keyword javascriptReserved              void while with yield

syntax keyword javascriptReserved              enum implements package protected static
syntax keyword javascriptReserved              interface private public abstract boolean
syntax keyword javascriptReserved              byte char double final float goto int
syntax keyword javascriptReserved              long native short synchronized transient
syntax keyword javascriptReserved              volatile

"JavaScript Prototype
syntax keyword javascriptPrototype             prototype

"Import
syntax region  javascriptImportDef             start=+import+ end=+;\|$+ contains=javascriptImport

"Program Keywords
syntax keyword javascriptImport                contained from as import
syntax keyword javascriptExport                export module
syntax keyword javascriptIdentifier            arguments this let var const void
syntax keyword javascriptOperator              delete new instanceof typeof
syntax keyword javascriptBoolean               true false
syntax keyword javascriptNull                  null undefined
syntax keyword javascriptMessage               alert confirm prompt status
syntax keyword javascriptGlobal                self top parent

"Statement Keywords
syntax keyword javascriptConditional           if else switch
syntax keyword javascriptRepeat                do while for in of
syntax keyword javascriptBranch                break continue
syntax keyword javascriptLabel                 case default
syntax keyword javascriptStatement             return with yield

syntax keyword javascriptExceptions            try catch throw finally Error EvalError
syntax keyword javascriptExceptions            RangeError ReferenceError SyntaxError TypeError URIError

runtime! syntax/yajs/javascript.vim
runtime! syntax/yajs/es6-map.vim
runtime! syntax/yajs/es6-set.vim
runtime! syntax/yajs/es6-proxy.vim
runtime! syntax/yajs/es6-promise.vim
runtime! syntax/yajs/es6-symbol.vim
runtime! syntax/yajs/node.vim
runtime! syntax/yajs/web.vim
runtime! syntax/yajs/web-window.vim
runtime! syntax/yajs/web-location.vim
runtime! syntax/yajs/web-history.vim
runtime! syntax/yajs/web-xhr.vim
runtime! syntax/yajs/web-blob.vim
runtime! syntax/yajs/dom-node.vim
runtime! syntax/yajs/dom-elem.vim
runtime! syntax/yajs/dom-event.vim
runtime! syntax/yajs/css.vim

let javascript_props = 1

syntax match   javascriptDotNotation           "\." nextgroup=@props
syntax match   javascriptDotStyleNotation      "\.style\." nextgroup=javascriptDOMStyle transparent

syntax region  javascriptBlock                 matchgroup=javascriptBraces start=/{/ end=/}/ contains=TOP
                                               
syntax keyword javascriptFuncKeyword           function nextgroup=javascriptFuncName skipwhite
syntax match   javascriptFuncName              contained /\k\+/ nextgroup=javascriptFuncArg skipwhite
syntax match   javascriptFuncArg               contained "([^()]*)" contains=javascriptParens,javascriptFuncComma
syntax match   javascriptFuncComma             contained /,/
syntax match   javascriptArrowFunc             /=>/

"Class
syntax keyword javascriptClassKeyword          class nextgroup=javascriptClassName skipwhite
syntax keyword javascriptClassSuper            super
syntax match   javascriptClassName             contained /\k\+/ nextgroup=javascriptClassBlock,javascriptClassExtends skipwhite
syntax keyword javascriptClassExtends          contained extends nextgroup=javascriptClassName skipwhite
syntax region  javascriptClassBLock            contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=javascriptClassMethod
syntax region  javascriptClassMethod           contained start=/\(\(\(set\|get\)\s\+\)\?\)\k\+\s\?(/ end=")" contains=javascriptClassAccessor,javascriptClassMethodName,javascriptFuncArg nextgroup=javascriptBlock skipwhite keepend
syntax keyword javascriptClassAccessor         contained get set
syntax match   javascriptClassMethodName       contained /\k\+\ze\s\?(/

syntax match   javascriptBraces	               contained "[{}\[\]]"
syntax match   javascriptParens	               "[()]"
syntax match   javascriptOpSymbols             "\_[^+-=<>]\zs\(=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-=\)\ze\_[^+-=<>]"
syntax match   javascriptEndColons             "[;,]"
syntax match   javascriptLogicSymbols          "\_[^&|]\zs\(&&\|||\|&\||\)\ze\_[^&|]"


if exists("did_javascript_hilink")
  HiLink javascriptReserved             Error

  HiLink javascriptEndColons            Exception
  HiLink javascriptOpSymbols            Operator
  HiLink javascriptLogicSymbols         Boolean
  HiLink javascriptBraces               Function
  HiLink javascriptParens               Operator
  HiLink javascriptComment              Comment
  HiLink javascriptLineComment          Comment
  HiLink javascriptDocComment           Comment
  HiLink javascriptCommentTodo          Todo
  HiLink javascriptDocNotation          SpecialComment
  HiLink javascriptDocTags              SpecialComment
  " HiLink javascriptDocSeeTag            Function
  HiLink javascriptDocParam             Function
  HiLink javascriptDocNamedParamType    Type
  HiLink javascriptDocParamName         Type
  HiLink javascriptDocParamType         Type
  HiLink javascriptString               String
  HiLink javascriptTemplate             String
  HiLink javascriptTemplateSubstitution Label
  HiLink javascriptRegexpString         String
  HiLink javascriptGlobal               Constant
  HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptStatement            Statement
  HiLink javascriptMessage              Keyword
  HiLink javascriptOperator             Operator
  " HiLink javascriptType                 Type
  HiLink javascriptNull                 Boolean
  HiLink javascriptNumber               Number
  HiLink javascriptFloat                Float
  HiLink javascriptBoolean              Boolean
  HiLink javascriptLabel                Label
  " HiLink javascriptSpecial              Special
  HiLink javascriptImport               Special
  HiLink javascriptExport               Special
  HiLink javascriptExceptions           Special

  HiLink javascriptFuncKeyword          Type
  HiLink javascriptArrowFunc            Type
  HiLink javascriptFuncName             Function
  HiLink javascriptFuncArg              Special
  HiLink javascriptFuncComma            Operator  

  HiLink javascriptClassKeyword         Type
  HiLink javascriptClassExtends         Type
  HiLink javascriptClassName            Function
  HiLink javascriptClassMethodName      Function
  HiLink javascriptClassAccessor        Operator
  HiLink javascriptClassSuper           keyword

  HiLink shellbang                      Comment

  delcommand HiLink
  unlet did_javascript_hilink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

