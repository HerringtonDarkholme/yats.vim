" Vim syntax file
" Language:     JavaScript
" Maintainer:   Kao Wei-Ko(othree) <othree@gmail.com>
" Last Change:  2014-11-26
" Version:      1.1
" Changes:      Go to https://github.com/othree/yajs for recent changes.
" Origin:       https://github.com/jelera/vim-javascript-syntax
" Credits:      Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck 
"               (This file is based on their hard work), gumnos (From the #vim 
"               IRC Channel in Freenode)


if exists("b:yajs_loaded")
  finish
else
  let b:yajs_loaded = 1
endif

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
if &filetype == 'javascript'
  setlocal iskeyword+=$
endif

syntax sync fromstart

"Syntax coloring for Node.js shebang line
syntax match   shellbang "^#!.*/bin/env\s\+node\>"


"JavaScript comments
syntax keyword javascriptCommentTodo           contained TODO FIXME XXX TBD
syntax match   javascriptLineComment           "//.*" contains=@Spell,javascriptCommentTodo
syntax region  javascriptComment               start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo

"JSDoc
syntax case ignore

syntax region  javascriptDocComment            matchgroup=javascriptComment start="/\*\*"  end="\*/" contains=javascriptDocNotation,javascriptCommentTodo,@Spell fold
syntax match   javascriptDocNotation           contained /@/ nextgroup=javascriptDocTags

syntax keyword javascriptDocTags               contained constant constructor constructs function ignore inner private public readonly static
syntax keyword javascriptDocTags               contained const dict expose inheritDoc interface nosideeffects override protected struct
syntax keyword javascriptDocTags               contained example global

syntax keyword javascriptDocTags               contained abstract virtual access augments

syntax keyword javascriptDocTags               contained arguments callback lends memberOf name type link mixes mixin tutorial nextgroup=javascriptDocParam skipwhite
syntax keyword javascriptDocTags               contained variation nextgroup=javascriptDocNumParam skipwhite

syntax keyword javascriptDocTags               contained author class classdesc copyright default defaultvalue nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained deprecated description external host nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained file fileOverview overview namespace requires since version nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained summary todo license preserve nextgroup=javascriptDocDesc skipwhite

syntax keyword javascriptDocTags               contained borrows exports nextgroup=javascriptDocA skipwhite
syntax keyword javascriptDocTags               contained param arg argument property prop module nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained define enum extends implements this typedef nextgroup=javascriptDocParamType skipwhite
syntax keyword javascriptDocTags               contained returns throws exception nextgroup=javascriptDocParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained see nextgroup=javascriptDocRef skipwhite

syntax keyword javascriptDocTags               contained function func method nextgroup=javascriptDocName skipwhite
syntax match   javascriptDocName               contained /\h\w*/

syntax keyword javascriptDocTags               contained fires event nextgroup=javascriptDocEventRef skipwhite
syntax match   javascriptDocEventRef           contained /\h\w*#\(\h\w*\:\)\?\h\w*/

syntax match   javascriptDocNamedParamType     contained /{.\+}/ nextgroup=javascriptDocParamName skipwhite
syntax match   javascriptDocParamName          contained /\[\?\w\+\]\?/ nextgroup=javascriptDocDesc skipwhite
syntax match   javascriptDocParamType          contained /{.\+}/ nextgroup=javascriptDocDesc skipwhite
syntax match   javascriptDocA                  contained /\%(#\|\w\|\.\|:\|\/\)\+/ nextgroup=javascriptDocAs skipwhite
syntax match   javascriptDocAs                 contained /\s*as\s*/ nextgroup=javascriptDocB skipwhite
syntax match   javascriptDocB                  contained /\%(#\|\w\|\.\|:\|\/\)\+/
syntax match   javascriptDocParam              contained /\%(#\|\w\|\.\|:\|\/\|-\)\+/
syntax match   javascriptDocNumParam           contained /\d\+/
syntax match   javascriptDocRef                contained /\%(#\|\w\|\.\|:\|\/\)\+/
syntax region  javascriptDocLinkTag            contained matchgroup=javascriptDocLinkTag start=/{/ end=/}/ contains=javascriptDocTags

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200
endif

syntax case match

"Syntax in the JavaScript code
syntax match   javascriptASCII                 contained /\\\d\d\d/
syntax match   javascriptTemplateSubstitution  contained /\${\w\+}/
syntax region  javascriptString                start=/"/  skip=/\\\\\|\\"\|\\\n/  end=/"\|$/ contains=javascriptASCII
syntax region  javascriptString                start=/'/  skip=/\\\\\|\\'\|\\\n/  end=/'\|$/ contains=javascriptASCII
syntax region  javascriptTemplate              start=/`/  skip=/\\\\\|\\`\|\\\n/  end=/`\|$/ contains=javascriptASCII,javascriptTemplateSubstitution

syntax match   javascriptNumber                /\<0[bB][01]\+\>/
syntax match   javascriptNumber                /\<0[oO][0-7]\+\>/
syntax match   javascriptNumber                /\<0[xX][0-9a-fA-F]\+\>/
syntax match   javascriptNumber                /\<[+-]\=\%(\d\+\.\d\+\|\d\+\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax match   javascriptLabel                 /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment break case catch class const continue
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment debugger default delete do else export
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment extends finally for function if 
"import
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment in instanceof let new return super
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment switch this throw try typeof var
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment void while with yield

syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment enum implements package protected static
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment interface private public abstract boolean
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment byte char double final float goto int
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment long native short synchronized transient
syntax keyword javascriptReserved              containedin=ALLBUT,javascriptProp,javascriptString,javascriptComment,javascriptLineComment,javascriptDocComment volatile

"JavaScript Prototype
syntax keyword javascriptPrototype             prototype

"Program Keywords
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

syntax keyword javascriptExceptions            try catch throw finally

syntax match   javascriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*(\?/ contains=@props transparent
syntax match   javascriptDotNotation           /\./ nextgroup=javascriptProp
syntax match   javascriptDotStyleNotation      /\.style\./ nextgroup=javascriptDOMStyle transparent

runtime syntax/yajs/javascript.vim
runtime syntax/yajs/es6-number.vim
runtime syntax/yajs/es6-string.vim
runtime syntax/yajs/es6-array.vim
runtime syntax/yajs/es6-object.vim
runtime syntax/yajs/es6-symbol.vim
runtime syntax/yajs/es6-function.vim
runtime syntax/yajs/es6-math.vim
runtime syntax/yajs/es6-date.vim
runtime syntax/yajs/es6-json.vim
runtime syntax/yajs/es6-regexp.vim
runtime syntax/yajs/es6-map.vim
runtime syntax/yajs/es6-set.vim
runtime syntax/yajs/es6-proxy.vim
runtime syntax/yajs/es6-promise.vim
runtime syntax/yajs/ecma-402.vim
runtime syntax/yajs/node.vim
runtime syntax/yajs/web.vim
runtime syntax/yajs/web-window.vim
runtime syntax/yajs/web-navigator.vim
runtime syntax/yajs/web-location.vim
runtime syntax/yajs/web-history.vim
runtime syntax/yajs/web-console.vim
runtime syntax/yajs/web-xhr.vim
runtime syntax/yajs/web-blob.vim
runtime syntax/yajs/web-crypto.vim
runtime syntax/yajs/web-fetch.vim
runtime syntax/yajs/dom-node.vim
runtime syntax/yajs/dom-elem.vim
runtime syntax/yajs/dom-document.vim
runtime syntax/yajs/dom-event.vim
runtime syntax/yajs/dom-storage.vim
runtime syntax/yajs/css.vim

let javascript_props = 1

runtime syntax/yajs/event.vim
syntax region  javascriptEventString           contained start=/"/  skip=/\\\\\|\\"\|\\\n/  end=/"\|$/ contains=javascriptASCII,@events
syntax region  javascriptEventString           contained start=/'/  skip=/\\\\\|\\'\|\\\n/  end=/'\|$/ contains=javascriptASCII,@events

"Import
syntax region  javascriptImportDef             start=/import/ end=/;\|$/ contains=javascriptImport
syntax keyword javascriptImport                contained from as import
syntax keyword javascriptExport                export module

if main_syntax == 'html' || main_syntax == 'eruby' || main_syntax == 'php' || main_syntax == 'haml'
  syntax region  javascriptBlock                 matchgroup=javascriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=@htmlJavaScript
else
  syntax region  javascriptBlock                 matchgroup=javascriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=TOP
endif

syntax region  javascriptMethodDef             contained start=/\(\(\(set\|get\)\s\+\)\?\)\k\+\s\?(/ end=/)/ contains=javascriptMethodAccessor,javascriptMethodName,javascriptFuncArg nextgroup=javascriptBlock skipwhite keepend
syntax keyword javascriptMethodAccessor        contained get set
syntax match   javascriptMethodName            contained /\k\+\ze\s\?(/

syntax keyword javascriptAsyncFuncKeyword      async await
syntax keyword javascriptFuncKeyword           function nextgroup=javascriptFuncName,javascriptFuncArg skipwhite
syntax match   javascriptFuncName              contained /\k\+/ nextgroup=javascriptFuncArg skipwhite
syntax match   javascriptFuncArg               contained /([^()]*)/ contains=javascriptParens,javascriptFuncComma nextgroup=javascriptBlock skipwhite skipempty
syntax match   javascriptFuncComma             contained /,/
syntax match   javascriptArrowFunc             /=>/

"Class
syntax keyword javascriptClassKeyword          class nextgroup=javascriptClassName skipwhite
syntax keyword javascriptClassSuper            super
syntax match   javascriptClassName             contained /\k\+/ nextgroup=javascriptClassBlock,javascriptClassExtends skipwhite
syntax keyword javascriptClassExtends          contained extends nextgroup=javascriptClassName skipwhite
syntax region  javascriptClassBLock            contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=javascriptMethodDef,javascriptClassStatic
syntax keyword javascriptClassStatic           contained static nextgroup=javascriptMethodDef skipwhite


syntax region  javascriptObjectLiteral         contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=javascriptLabel,javascriptMethodDef,@javascriptExpression

syntax match   javascriptBraces                contained /[{}\[\]]/
syntax match   javascriptParens                /[()]/
syntax match   javascriptOpSymbols             /\_[^+\-*/%\^=!<>&|?]\@<=\(<\|>\|<=\|>=\|==\|!=\|===\|!==\|+\|-\|*\|%\|++\|--\|<<\|>>\|>>>\|&\||\|^\|!\|\~\|&&\|||\|?\|=\|+=\|-=\|*=\|%=\|<<=\|>>=\|>>>=\|&=\||=\|^=\|\/\|\/=\)\ze\_[^+\-*/%\^=!<>&|?]/ nextgroup=@javascriptExpression skipwhite
syntax match   javascriptEndColons             /[;,]/
syntax match   javascriptLogicSymbols          /\_[^&|]\@<=\(&&\|||\)\ze\_[^&|]/

syntax region  javascriptRegexpString          start="/[^/*]"me=e-1 skip="\\\\\|\\/" end="/[gimy]\{0,2\}" oneline

syntax keyword javascriptComprehension         for of if
syntax cluster javascriptTypes                 contains=javascriptString,javascriptTemplate,javascriptNumber,javascriptBoolean,javascriptNull
syntax cluster javascriptEventTypes            contains=javascriptEventString,javascriptTemplate,javascriptNumber,javascriptBoolean,javascriptNull
syntax cluster javascriptOps                   contains=javascriptOpSymbols,javascriptLogicSymbols
syntax region  javascriptParenExp              contained matchgroup=javascriptParens start=/(/ end=/)/ contains=@javascriptExpression,javascriptComprehension
syntax cluster javascriptExpression            contains=javascriptParenExp,javascriptObjectLiteral,javascriptFuncKeyword,javascriptRegexpString,@javascriptTypes,@javascriptOps
syntax cluster javascriptEventExpression       contains=javascriptParenExp,javascriptObjectLiteral,javascriptFuncKeyword,javascriptRegexpString,@javascriptEventTypes,@javascriptOps

syntax region  javascriptFuncCallArg           contained matchgroup=javascriptParens start=/(/rs=e end=/)/re=s contains=@javascriptExpression
syntax region  javascriptEventFuncCallArg      contained matchgroup=javascriptParens start=/(/rs=e end=/)/re=s contains=@javascriptEventExpression

if exists("did_javascript_hilink")
  HiLink javascriptReserved             Error

  HiLink javascriptEndColons            Exception
  HiLink javascriptOpSymbols            Normal
  HiLink javascriptLogicSymbols         Boolean
  HiLink javascriptBraces               Function
  HiLink javascriptParens               Normal
  HiLink javascriptComment              Comment
  HiLink javascriptLineComment          Comment
  HiLink javascriptDocComment           Comment
  HiLink javascriptCommentTodo          Todo
  HiLink javascriptDocNotation          SpecialComment
  HiLink javascriptDocTags              SpecialComment
  HiLink javascriptDocParam             Function
  HiLink javascriptDocNumParam          Function
  HiLink javascriptDocEventRef          Function
  HiLink javascriptDocNamedParamType    Type
  HiLink javascriptDocParamName         Type
  HiLink javascriptDocParamType         Type
  HiLink javascriptString               String
  HiLink javascriptTemplate             String
  HiLink javascriptEventString          String
  HiLink javascriptASCII                Label
  HiLink javascriptTemplateSubstitution Label
  HiLink javascriptRegexpString         String
  HiLink javascriptGlobal               Constant
  HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptComprehension        Repeat
  HiLink javascriptStatement            Statement
  HiLink javascriptMessage              Keyword
  HiLink javascriptOperator             Operator
  " HiLink javascriptType                 Type
  HiLink javascriptNull                 Boolean
  HiLink javascriptNumber               Number
  HiLink javascriptBoolean              Boolean
  HiLink javascriptLabel                Label
  HiLink javascriptImport               Special
  HiLink javascriptExport               Special
  HiLink javascriptExceptions           Special

  HiLink javascriptMethodName           Function
  HiLink javascriptMethodAccessor       Operator

  HiLink javascriptAsyncFuncKeyword     Keyword
  HiLink javascriptFuncKeyword          Keyword
  HiLink javascriptArrowFunc            Type
  HiLink javascriptFuncName             Function
  HiLink javascriptFuncArg              Special
  HiLink javascriptFuncComma            Operator

  HiLink javascriptClassKeyword         Keyword
  HiLink javascriptClassExtends         Keyword
  HiLink javascriptClassName            Function
  HiLink javascriptClassStatic          StorageClass
  HiLink javascriptClassSuper           keyword

  HiLink shellbang                      Comment

  highlight link javaScript             NONE

  delcommand HiLink
  unlet did_javascript_hilink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

