" Vim syntax file
" Language:     JavaScript
" Maintainer:   Kao Wei-Ko(othree) <othree@gmail.com>
" Last Change:  2015-02-17
" Version:      1.3
" Changes:      Go to https://github.com/othree/yajs for recent changes.
" Origin:       https://github.com/jelera/vim-javascript-syntax
" Credits:      Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck 
"               (This file is based on their hard work), gumnos (From the #vim 
"               IRC Channel in Freenode)


" if exists("b:yajs_loaded")
  " finish
" else
  " let b:yajs_loaded = 1
" endif
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
setlocal iskeyword-=$
if main_syntax == 'javascript'
  setlocal iskeyword+=$
  syntax cluster htmlJavaScript                 contains=TOP
endif

syntax sync fromstart

"Syntax coloring for Node.js shebang line
syntax match   shellbang "^#!.*node\>"
syntax match   shellbang "^#!.*iojs\>"


"JavaScript comments
syntax keyword javascriptCommentTodo           contained TODO FIXME XXX TBD
syntax match   javascriptLineComment           "//.*" contains=@Spell,javascriptCommentTodo
syntax region  javascriptComment               start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo extend
syntax cluster javascriptComments              contains=javascriptComment,javascriptLineComment

"JSDoc
syntax case ignore

syntax region  javascriptDocComment            matchgroup=javascriptComment start="/\*\*"  end="\*/" contains=javascriptDocNotation,javascriptCommentTodo,@Spell fold keepend
syntax match   javascriptDocNotation           contained /@/ nextgroup=javascriptDocTags

syntax keyword javascriptDocTags               contained constant constructor constructs function ignore inner private public readonly static
syntax keyword javascriptDocTags               contained const dict expose inheritDoc interface nosideeffects override protected struct
syntax keyword javascriptDocTags               contained example global

" syntax keyword javascriptDocTags               contained ngdoc nextgroup=javascriptDocNGDirective
syntax keyword javascriptDocTags               contained ngdoc scope priority animations
syntax keyword javascriptDocTags               contained ngdoc restrict methodOf propertyOf eventOf eventType nextgroup=javascriptDocParam skipwhite
syntax keyword javascriptDocNGDirective        contained overview service object function method property event directive filter inputType error

syntax keyword javascriptDocTags               contained abstract virtual access augments

syntax keyword javascriptDocTags               contained arguments callback lends memberOf name type kind link mixes mixin tutorial nextgroup=javascriptDocParam skipwhite
syntax keyword javascriptDocTags               contained variation nextgroup=javascriptDocNumParam skipwhite

syntax keyword javascriptDocTags               contained author class classdesc copyright default defaultvalue nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained deprecated description external host nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained file fileOverview overview namespace requires since version nextgroup=javascriptDocDesc skipwhite
syntax keyword javascriptDocTags               contained summary todo license preserve nextgroup=javascriptDocDesc skipwhite

syntax keyword javascriptDocTags               contained borrows exports nextgroup=javascriptDocA skipwhite
syntax keyword javascriptDocTags               contained param arg argument property prop module nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite
syntax keyword javascriptDocTags               contained define enum extends implements this typedef nextgroup=javascriptDocParamType skipwhite
syntax keyword javascriptDocTags               contained return returns throws exception nextgroup=javascriptDocParamType,javascriptDocParamName skipwhite
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

syntax cluster javascriptDocs                  contains=javascriptDocParamType,javascriptDocNamedParamType,javascriptDocParam

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200
endif

syntax case match

syntax match   javascriptIdentifierName        /\k[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*/

"Block VariableStatement EmptyStatement ExpressionStatement IfStatement IterationStatement ContinueStatement BreakStatement ReturnStatement WithStatement LabelledStatement SwitchStatement ThrowStatement TryStatement DebuggerStatement

syntax cluster javascriptStatement             contains=javascriptBlock,javascriptVariable,@javascriptExpression,javascriptConditional,javascriptRepeat,javascriptBranch,javascriptLabel,javascriptStatementKeyword,javascriptTry,javascriptDebugger

"Syntax in the JavaScript code
" syntax match   javascriptASCII                 contained /\\\d\d\d/
syntax region  javascriptTemplateSubstitution  contained matchgroup=javascriptTemplateSB start=/\${/ end=/}/ contains=javascriptTemplateSBlock,javascriptTemplateSString 
syntax region  javascriptTemplateSBlock        contained start=/{/ end=/}/ contains=javascriptTemplateSBlock,javascriptTemplateSString
syntax region  javascriptTemplateSString       contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ extend contains=javascriptTemplateSStringRB
syntax match   javascriptTemplateSStringRB     /}/ contained
syntax region  javascriptString                start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=javascriptOpSymbols skipwhite skipnl
syntax region  javascriptTemplate              start=/`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/ contains=javascriptTemplateSubstitution nextgroup=javascriptOpSymbols skipwhite skipnl
" syntax match   javascriptTemplateTag           /\k\+/ nextgroup=javascriptTemplate
syntax region  javascriptArray                 matchgroup=javascriptBraces start=/\[/ end=/]/ contains=@javascriptValue nextgroup=javascriptOpSymbols skipwhite skipnl

syntax match   javascriptNumber                /\<0[bB][01]\+\>/ nextgroup=javascriptOpSymbols skipwhite skipnl
syntax match   javascriptNumber                /\<0[oO][0-7]\+\>/ nextgroup=javascriptOpSymbols skipwhite skipnl
syntax match   javascriptNumber                /\<0[xX][0-9a-fA-F]\+\>/ nextgroup=javascriptOpSymbols skipwhite skipnl
syntax match   javascriptNumber                /[+-]\=\%(\d\+\.\d\+\|\d\+\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/ nextgroup=javascriptOpSymbols skipwhite skipnl

syntax cluster javascriptTypes                 contains=javascriptString,javascriptTemplate,javascriptNumber,javascriptBoolean,javascriptNull,javascriptArray
syntax cluster javascriptValue                 contains=@javascriptTypes,@javascriptExpression,javascriptFuncKeyword,javascriptObjectLiteral,javascriptIdentifierName

syntax match   javascriptLabel                 /\k\+\s*:/he=e-1 contains=javascriptReserved nextgroup=@javascriptValue,@javascriptStatement skipwhite skipnl
syntax match   javascriptObjectLabel           contained /\k\+\s*:/he=e-1 nextgroup=@javascriptValue,@javascriptStatement skipwhite skipnl
" syntax match   javascriptPropertyName          contained /"[^"]\+"\s*:/he=e-1 nextgroup=@javascriptValue skipwhite skipnl
" syntax match   javascriptPropertyName          contained /'[^']\+'\s*:/he=e-1 nextgroup=@javascriptValue skipwhite skipnl
syntax region  javascriptPropertyName          contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\s*:\|$/he=e-1 nextgroup=@javascriptValue skipwhite skipnl
syntax region  javascriptComputedPropertyName  contained matchgroup=javascriptPropertyName start=/\[/rs=s+1 end=/]\s*:/he=e-1 contains=@javascriptValue nextgroup=@javascriptValue skipwhite skipnl
" Value for object, statement for label statement

syntax cluster javascriptTemplates             contains=javascriptTemplate,javascriptTemplateSubstitution,javascriptTemplateSBlock,javascriptTemplateSString,javascriptTemplateSStringRB,javascriptTemplateSB
syntax cluster javascriptStrings               contains=javascriptProp,javascriptString,@javascriptTemplates,@javascriptComments,javascriptDocComment,javascriptRegexpString,javascriptPropertyName
syntax cluster javascriptNoReserved            contains=@javascriptStrings,@javascriptDocs,shellbang,javascriptObjectLiteral,javascriptObjectLabel
"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved break case catch class const continue
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved debugger default delete do else export
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved extends finally for function if 
"import,javascriptRegexpString,javascriptPropertyName
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved in instanceof let new return super
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved switch throw try typeof var
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved void while with yield

syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved enum implements package protected static
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved interface private public abstract boolean
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved byte char double final float goto int
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved long native short synchronized transient
syntax keyword javascriptReserved              containedin=ALLBUT,@javascriptNoReserved volatile

"this

"JavaScript Prototype
syntax keyword javascriptPrototype             prototype

"Program Keywords
syntax keyword javascriptIdentifier            arguments this let var const
syntax keyword javascriptVariable              let var const
syntax keyword javascriptOperator              delete new instanceof typeof void
syntax keyword javascriptForOperator           in of
syntax keyword javascriptBoolean               true false nextgroup=javascriptOpSymbols skipwhite skipnl
syntax keyword javascriptNull                  null undefined nextgroup=javascriptOpSymbols skipwhite skipnl
syntax keyword javascriptMessage               alert confirm prompt status
syntax keyword javascriptGlobal                self top parent

"Statement Keywords
syntax keyword javascriptConditional           if else switch
syntax keyword javascriptConditionalElse       else
syntax keyword javascriptRepeat                do while for
syntax keyword javascriptBranch                break continue
syntax keyword javascriptCase                  case default
syntax keyword javascriptStatementKeyword      return with yield

syntax keyword javascriptTry                   try
syntax keyword javascriptExceptions            catch throw finally
syntax keyword javascriptDebugger              debugger

syntax match   javascriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*(\?/ contains=@props transparent nextgroup=javascriptOpSymbols skipwhite skipnl
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
runtime syntax/yajs/web-service-worker.vim
runtime syntax/yajs/dom-node.vim
runtime syntax/yajs/dom-elem.vim
runtime syntax/yajs/dom-document.vim
runtime syntax/yajs/dom-event.vim
runtime syntax/yajs/dom-storage.vim
runtime syntax/yajs/css.vim

let javascript_props = 1

runtime syntax/yajs/event.vim
syntax region  javascriptEventString           contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ contains=javascriptASCII,@events

"Import
syntax region  javascriptImportDef             start=/import/ end=/;\|$/ contains=javascriptImport
syntax keyword javascriptImport                contained from as import
syntax keyword javascriptExport                export module

syntax region  javascriptBlock                 matchgroup=javascriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=@htmlJavaScript

syntax region  javascriptMethodDef             contained start=/\(\(\(set\|get\)\s\+\)\?\)\k\+\s\?(/ end=/)/ contains=javascriptMethodAccessor,javascriptMethodName,javascriptFuncArg nextgroup=javascriptBlock skipwhite keepend
syntax keyword javascriptMethodAccessor        contained get set
syntax match   javascriptMethodName            contained /\k\+\ze\s\?(/

syntax keyword javascriptAsyncFuncKeyword      async await
syntax keyword javascriptFuncKeyword           function nextgroup=javascriptFuncName,javascriptFuncArg skipwhite
syntax match   javascriptFuncName              contained /\k\+/ nextgroup=javascriptFuncArg skipwhite
syntax match   javascriptFuncArg               contained /([^()]*)/ contains=javascriptParens,javascriptFuncKeyword,javascriptFuncComma nextgroup=javascriptBlock skipwhite skipempty
syntax match   javascriptFuncComma             contained /,/
syntax match   javascriptArrowFunc             /=>/

"Class
syntax keyword javascriptClassKeyword          class nextgroup=javascriptClassName skipwhite
syntax keyword javascriptClassSuper            super
syntax match   javascriptClassName             contained /\k\+/ nextgroup=javascriptClassBlock,javascriptClassExtends skipwhite
syntax keyword javascriptClassExtends          contained extends nextgroup=javascriptClassName skipwhite
syntax region  javascriptClassBLock            contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=javascriptMethodDef,javascriptClassStatic
syntax keyword javascriptClassStatic           contained static nextgroup=javascriptMethodDef skipwhite


syntax region  javascriptObjectLiteral         contained matchgroup=javascriptBraces start=/{/ end=/}/ contains=@javascriptComments,javascriptObjectLabel,javascriptPropertyName,javascriptMethodDef,javascriptComputedPropertyName

" syntax match   javascriptBraces                /[\[\]]/
" syntax match   javascriptParens                /[()]/
" syntax match   javascriptOpSymbols             /[^+\-*/%\^=!<>&|?]\@<=\(<\|>\|<=\|>=\|==\|!=\|===\|!==\|+\|-\|*\|%\|++\|--\|<<\|>>\|>>>\|&\||\|^\|!\|\~\|&&\|||\|?\|=\|+=\|-=\|*=\|%=\|<<=\|>>=\|>>>=\|&=\||=\|^=\|\/\|\/=\)\ze\_[^+\-*/%\^=!<>&|?]/ nextgroup=@javascriptExpression skipwhite
syntax match   javascriptOpSymbols             /[^+\-*/%\^=!<>&|?]\@<=\(<\|>\|<=\|>=\|==\|!=\|===\|!==\|+\|*\|%\|++\|--\|<<\|>>\|>>>\|&\||\|^\|!\|\~\|&&\|||\|?\|=\|+=\|-=\|*=\|%=\|<<=\|>>=\|>>>=\|&=\||=\|^=\|\/\|\/=\)\ze\_[^+\-*/%\^=!<>&|?]/ nextgroup=@javascriptExpression skipwhite skipnl
syntax match   javascriptEndColons             /[;,]/
syntax match   javascriptLogicSymbols          /[^&|]\@<=\(&&\|||\)\ze\_[^&|]/

syntax region  javascriptRegexpString          start="\(^\|=\|(\|{\|;\)\@<=\s*/[^/*]"me=e-1 skip="\\\\\|\\/" end="/[gimy]\{0,2\}" oneline

syntax keyword javascriptComprehension         for of
syntax cluster javascriptEventTypes            contains=javascriptEventString,javascriptTemplate,javascriptNumber,javascriptBoolean,javascriptNull
syntax cluster javascriptOps                   contains=javascriptOpSymbols,javascriptLogicSymbols,javascriptOperator
syntax region  javascriptParenExp              contained matchgroup=javascriptParens start=/(/ end=/)/ contains=@javascriptExpression,javascriptComprehension nextgroup=javascriptOpSymbols skipwhite
syntax cluster javascriptExpression            contains=javascriptParenExp,javascriptObjectLiteral,javascriptFuncKeyword,javascriptFuncCall,javascriptRegexpString,@javascriptTypes,@javascriptOps,jsxRegion
syntax cluster javascriptEventExpression       contains=javascriptParenExp,javascriptObjectLiteral,javascriptFuncKeyword,javascriptFuncCall,javascriptRegexpString,@javascriptEventTypes,@javascriptOps

syntax match   javascriptFuncCall              contained /[a-zA-Z]\k\+/ nextgroup=javascriptFuncCallArg,javascriptDotNotation skipwhite
syntax region  javascriptFuncCallArg           contained matchgroup=javascriptParens start=/(/rs=e end=/)/re=s contains=@javascriptExpression nextgroup=javascriptOpSymbols,javascriptDotNotation skipwhite skipnl
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
  HiLink javascriptDocNGParam           javascriptDocParam
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
  HiLink javascriptTemplateSBlock       Label
  HiLink javascriptTemplateSString      Label
  HiLink javascriptTemplateSStringRB    Label
  HiLink javascriptTemplateSB           Label
  HiLink javascriptRegexpString         String
  HiLink javascriptGlobal               Constant
  HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptConditionalElse      Conditional
  HiLink javascriptCase                 Conditional
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Identifier
  HiLink javascriptVariable             Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptComprehension        Repeat
  HiLink javascriptForOperator          Repeat
  HiLink javascriptStatementKeyword     Statement
  HiLink javascriptMessage              Keyword
  HiLink javascriptOperator             Operator
  " HiLink javascriptType                 Type
  HiLink javascriptNull                 Boolean
  HiLink javascriptNumber               Number
  HiLink javascriptBoolean              Boolean
  HiLink javascriptObjectLabel          javascriptLabel
  HiLink javascriptLabel                Label
  HiLink javascriptPropertyName         Label
  HiLink javascriptImport               Special
  HiLink javascriptExport               Special
  HiLink javascriptTry                  Special
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

