" Vim syntax file
" Language:     TypeScript
" Maintainer:   Herrington Darkholme
" Last Change:  2015-04-05
" Version:      1.0
" Changes:      Go to https:github.com/HerringtonDarkholme/yats.vim for recent changes.
" Origin:       https://github.com/othree/yajs
" Credits:      Kao Wei-Ko(othree), Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck
"               (This file is based on their hard work), gumnos (From the #vim
"               IRC Channel in Freenode)


" if exists("b:yats_loaded")
  " finish
" else
  " let b:yats_loaded = 1
" endif
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'typescript'
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_typescript_syn_inits")
  let did_typescript_hilink = 1
  if version < 508
    let did_typescript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
else
  finish
endif

"Dollar sign is permitted anywhere in an identifier
setlocal iskeyword-=$
if main_syntax == 'typescript'
  setlocal iskeyword+=$
  syntax cluster htmlJavaScript                 contains=TOP
endif

syntax sync fromstart

" load doc first because they are case insensitive
runtime syntax/basic/doc.vim

if main_syntax == "typescript"
  syntax sync clear
  syntax sync ccomment typescriptComment minlines=200
endif

syntax case match

runtime syntax/basic/type.vim

syntax match typescriptOptionalMark /?/ contained
syntax match typescriptRestOrSpread /\.\.\./ contained

syntax match   typescriptIdentifierName        /\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*/ nextgroup=typescriptDotNotation,typescriptArgumentList,typescriptComputedProperty

"Block VariableStatement EmptyStatement ExpressionStatement IfStatement IterationStatement ContinueStatement BreakStatement ReturnStatement WithStatement LabelledStatement SwitchStatement ThrowStatement TryStatement DebuggerStatement

syntax cluster typescriptStatement             contains=typescriptBlock,typescriptVariable,@typescriptExpression,typescriptConditional,typescriptRepeat,typescriptBranch,typescriptLabel,typescriptStatementKeyword,typescriptTry,typescriptDebugger

"Syntax in the JavaScript code
" syntax match   typescriptASCII                 contained /\\\d\d\d/
syntax region  typescriptTemplateSubstitution  contained matchgroup=typescriptTemplateSB start=/\${/ end=/}/ contains=typescriptTemplateSBlock,typescriptTemplateSString
syntax region  typescriptTemplateSBlock        contained start=/{/ end=/}/ contains=typescriptTemplateSBlock,typescriptTemplateSString transparent
syntax region  typescriptTemplateSString       contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ extend contains=typescriptTemplateSStringRB transparent
syntax match   typescriptTemplateSStringRB     /}/ contained
syntax region  typescriptString                start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax region  typescriptTemplate              start=/`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/ contains=typescriptTemplateSubstitution nextgroup=@typescriptSymbols skipwhite skipempty
" syntax match   typescriptTemplateTag           /\k\+/ nextgroup=typescriptTemplate
syntax region  typescriptArray                 matchgroup=typescriptBraces start=/\[/ end=/]/ contains=@typescriptValue,typescriptForComprehension nextgroup=@typescriptSymbols,@typescriptComments skipwhite skipempty

syntax match   typescriptNumber                /\<0[bB][01]\+\>/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax match   typescriptNumber                /\<0[oO][0-7]\+\>/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax match   typescriptNumber                /\<0[xX][0-9a-fA-F]\+\>/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax match   typescriptNumber                /[+-]\=\%(\d\+\.\d\+\|\d\+\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/ nextgroup=@typescriptSymbols skipwhite skipempty

syntax cluster typescriptTypes                 contains=typescriptString,typescriptTemplate,typescriptNumber,typescriptBoolean,typescriptNull,typescriptArray
syntax cluster typescriptValue                 contains=@typescriptTypes,@typescriptExpression,typescriptFuncKeyword,typescriptObjectLiteral,typescriptIdentifier,typescriptIdentifierName,typescriptOperator,@typescriptSymbols

syntax match   typescriptLabel                 /\v(^\s*|;)[a-zA-Z_$]\k*\_s*:/he=e-1 contains=typescriptReserved nextgroup=@typescriptValue,@typescriptStatement skipwhite skipempty
syntax match   typescriptObjectLabel           contained /\k\+\_s*:/he=e-1 nextgroup=@typescriptValue,@typescriptStatement skipwhite skipempty
" syntax match   typescriptPropertyName          contained /"[^"]\+"\s*:/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
" syntax match   typescriptPropertyName          contained /'[^']\+'\s*:/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptPropertyName          contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\_s*:\|$/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptComputedPropertyName  contained matchgroup=typescriptPropertyName start=/\[/rs=s+1 end=/]\_s*:/he=e-1 contains=@typescriptValue nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptComputedProperty      contained matchgroup=typescriptProperty start=/\[/rs=s+1 end=/]/he=e-1 contains=@typescriptValue,@typescriptSymbols nextgroup=@typescriptValue skipwhite skipempty
" Value for object, statement for label statement

syntax cluster typescriptTemplates             contains=typescriptTemplate,typescriptTemplateSubstitution,typescriptTemplateSBlock,typescriptTemplateSString,typescriptTemplateSStringRB,typescriptTemplateSB
syntax cluster typescriptStrings               contains=typescriptProp,typescriptString,@typescriptTemplates,@typescriptComments,typescriptDocComment,typescriptRegexpString,typescriptPropertyName
syntax cluster typescriptNoReserved            contains=@typescriptStrings,@typescriptDocs,shellbang,typescriptObjectLiteral,typescriptObjectLabel,typescriptClassBlock,typescriptMethodDef,typescriptMethodName,@typescriptType
"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved break case catch class const continue
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved debugger default delete do else export
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved extends finally for function if
"import,typescriptRegexpString,typescriptPropertyName
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved in instanceof let new return super
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved switch throw try typeof var
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved void while with yield

syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved enum implements package protected static
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved interface private public abstract boolean
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved byte char double final float goto int
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved long native short synchronized transient
syntax keyword typescriptReserved              containedin=ALLBUT,@typescriptNoReserved volatile

"this

"JavaScript Prototype
syntax keyword typescriptPrototype             prototype

"Program Keywords
syntax keyword typescriptIdentifier            arguments this
syntax keyword typescriptVariable              let var const
syntax keyword typescriptOperator              delete new instanceof typeof void in nextgroup=@typescriptValue,@typescriptTypes skipwhite skipempty
syntax keyword typescriptForOperator           contained in of
syntax keyword typescriptBoolean               true false nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptNull                  null undefined nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptMessage               alert confirm prompt status
syntax keyword typescriptGlobal                self top parent

"Statement Keywords
syntax keyword typescriptConditional           if else switch
syntax keyword typescriptConditionalElse       else
syntax keyword typescriptRepeat                do while for nextgroup=typescriptLoopParen skipwhite skipempty
syntax keyword typescriptBranch                break continue
syntax keyword typescriptCase                  case nextgroup=@typescriptTypes skipwhite
syntax keyword typescriptDefault               default
syntax keyword typescriptStatementKeyword      return with yield

syntax keyword typescriptTry                   try
syntax keyword typescriptExceptions            catch throw finally
syntax keyword typescriptDebugger              debugger

syntax match   typescriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*/ contains=@props transparent nextgroup=@typescriptSymbols skipwhite skipempty
syntax match   typescriptMethod                contained /[a-zA-Z_$][a-zA-Z0-9_$]*\ze(/ contains=@props transparent nextgroup=typescriptArgumentList
syntax match   typescriptDotNotation           /\./ nextgroup=typescriptProp,typescriptMethod
syntax match   typescriptDotStyleNotation      /\.style\./ nextgroup=typescriptDOMStyle transparent

runtime syntax/yats/typescript.vim
runtime syntax/yats/es6-number.vim
runtime syntax/yats/es6-string.vim
runtime syntax/yats/es6-array.vim
runtime syntax/yats/es6-object.vim
runtime syntax/yats/es6-symbol.vim
runtime syntax/yats/es6-function.vim
runtime syntax/yats/es6-math.vim
runtime syntax/yats/es6-date.vim
runtime syntax/yats/es6-json.vim
runtime syntax/yats/es6-regexp.vim
runtime syntax/yats/es6-map.vim
runtime syntax/yats/es6-set.vim
runtime syntax/yats/es6-proxy.vim
runtime syntax/yats/es6-promise.vim
runtime syntax/yats/ecma-402.vim
runtime syntax/yats/node.vim
runtime syntax/yats/web.vim
runtime syntax/yats/web-window.vim
runtime syntax/yats/web-navigator.vim
runtime syntax/yats/web-location.vim
runtime syntax/yats/web-history.vim
runtime syntax/yats/web-console.vim
runtime syntax/yats/web-xhr.vim
runtime syntax/yats/web-blob.vim
runtime syntax/yats/web-crypto.vim
runtime syntax/yats/web-fetch.vim
runtime syntax/yats/web-service-worker.vim
runtime syntax/yats/dom-node.vim
runtime syntax/yats/dom-elem.vim
runtime syntax/yats/dom-document.vim
runtime syntax/yats/dom-event.vim
runtime syntax/yats/dom-storage.vim
runtime syntax/yats/css.vim

let typescript_props = 1

runtime syntax/yats/event.vim
syntax region  typescriptEventString           contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ contains=typescriptASCII,@events

"Import
syntax region  typescriptImportDef             start=/import/ end=/;\|$/ contains=typescriptImport,typescriptString
syntax keyword typescriptImport                contained from as import
syntax keyword typescriptExport                export module

syntax region  typescriptBlock                 matchgroup=typescriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=@htmlJavaScript

syntax region  typescriptMethodDef             contained start=/\(\(\(set\|get\)\_s\+\)\?\)[a-zA-Z_$]\k*\_s*(/ end=/)/ contains=typescriptMethodAccessor,typescriptMethodName nextgroup=typescriptBlock skipwhite keepend
syntax region  typescriptMethodArgs            contained start=/(\|</ end=/{\@=/ contains=@typescriptCallSignature nextgroup=typescriptBlock skipwhite keepend
syntax keyword typescriptMethodAccessor        contained get set
syntax match   typescriptMethodName            contained /[a-zA-Z_$]\k*/ nextgroup=typescriptMethodArgs skipwhite skipempty
syntax region  typescriptMethodName            contained matchgroup=typescriptPropertyName start=/\[/ end=/]/ contains=@typescriptValue nextgroup=typescriptMethodArgs skipwhite skipempty

syntax keyword typescriptAsyncFuncKeyword      async await
" syntax keyword typescriptFuncKeyword           function nextgroup=typescriptFuncName,typescriptFuncArg skipwhite
syntax keyword typescriptFuncKeyword           function nextgroup=typescriptAsyncFunc,typescriptSyncFunc
syntax match   typescriptSyncFunc              contained // nextgroup=typescriptFuncName,typescriptFuncArg skipwhite skipempty
syntax match   typescriptAsyncFunc             contained /*/ nextgroup=typescriptFuncName,typescriptFuncArg skipwhite skipempty
syntax match   typescriptFuncName              contained /[a-zA-Z_$]\k*/ nextgroup=typescriptFuncArg skipwhite
syntax match   typescriptFuncArg               contained /([^()]*)/ contains=typescriptParens,typescriptFuncKeyword,typescriptFuncComma nextgroup=typescriptBlock skipwhite skipwhite skipempty
syntax match   typescriptFuncComma             contained /,/


"Class
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super
syntax match   typescriptClassName             contained /\k\+/ nextgroup=typescriptClassBlock,typescriptClassExtends skipwhite
syntax keyword typescriptClassExtends          contained extends nextgroup=typescriptClassName skipwhite
syntax region  typescriptClassBLock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=typescriptMethodName,typescriptMethodAccessor,typescriptClassStatic
syntax keyword typescriptClassStatic           contained static nextgroup=typescriptMethodName,typescriptMethodAccessor skipwhite



"For Comprehension
syntax keyword typescriptForComprehension      contained for nextgroup=typescriptForComprehensionTail skipwhite skipempty
syntax region  typescriptForComprehensionTail  contained matchgroup=typescriptParens start=/(/ end=/)/ contains=typescriptOfComprehension,@typescriptExpression nextgroup=typescriptForComprehension,typescriptIfComprehension,@typescriptExpression skipwhite skipempty
syntax keyword typescriptOfComprehension       contained of
syntax keyword typescriptIfComprehension       contained if nextgroup=typescriptIfComprehensionTail
syntax region  typescriptIfComprehensionTail   contained matchgroup=typescriptParens start=/(/ end=/)/ contains=typescriptExpression nextgroup=typescriptForComprehension,typescriptIfComprehension skipwhite skipempty

syntax region  typescriptObjectLiteral         contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptComments,typescriptObjectLabel,typescriptPropertyName,typescriptMethodDef,typescriptComputedPropertyName,@typescriptValue

" syntax match   typescriptBraces                /[\[\]]/
" syntax match   typescriptParens                /[()]/
" syntax match   typescriptOpSymbols             /[^+\-*/%\^=!<>&|?]\@<=\(<\|>\|<=\|>=\|==\|!=\|===\|!==\|+\|-\|*\|%\|++\|--\|<<\|>>\|>>>\|&\||\|^\|!\|\~\|&&\|||\|?\|=\|+=\|-=\|*=\|%=\|<<=\|>>=\|>>>=\|&=\||=\|^=\|\/\|\/=\)\ze\_[^+\-*/%\^=!<>&|?]/ nextgroup=@typescriptExpression skipwhite
syntax match   typescriptOpSymbols             /[^+\-*/%\^=!<>&|?:]\@<=\(<\|>\|<=\|>=\|==\|!=\|===\|!==\|+\|*\|%\|++\|--\|<<\|>>\|>>>\|&\||\|^\|!\|\~\|&&\|||\|?\|=\|+=\|-=\|*=\|%=\|<<=\|>>=\|>>>=\|&=\||=\|^=\|\/\|\/=\)\ze\_[^+\-*/%\^=!<>&|?:]/ nextgroup=@typescriptExpression skipwhite skipempty
syntax match   typescriptOpSymbols             /[^+\-*/%\^=!<>&|?:]\@<=\(:\)\ze\_[^+\-*/%\^=!<>&|?:]/ nextgroup=@typescriptStatement,typescriptCase skipwhite skipempty
syntax match   typescriptEndColons             /[;,]/
syntax match   typescriptLogicSymbols          /[^&|]\@<=\(&&\|||\)\ze\_[^&|]/ nextgroup=@typescriptExpression skipwhite skipempty
syntax cluster typescriptSymbols               contains=typescriptOpSymbols,typescriptLogicSymbols

syntax region  typescriptRegexpString          start="\(^\|=\|(\|{\|;\)\@<=\_s*/[^/*]"me=e-1 skip="\\\\\|\\/" end="/[gimy]\{0,2\}" oneline

syntax cluster typescriptEventTypes            contains=typescriptEventString,typescriptTemplate,typescriptNumber,typescriptBoolean,typescriptNull
syntax cluster typescriptOps                   contains=typescriptOpSymbols,typescriptLogicSymbols,typescriptOperator
syntax region  typescriptParenExp              matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptExpression nextgroup=@typescriptSymbols skipwhite skipempty
syntax cluster typescriptExpression            contains=typescriptArrowFuncDef,typescriptParenExp,@typescriptValue,typescriptObjectLiteral,typescriptFuncKeyword,typescriptIdentifierName,typescriptRegexpString,@typescriptTypes,@typescriptOps,typescriptGlobal,jsxRegion
syntax cluster typescriptEventExpression       contains=typescriptArrowFuncDef,typescriptParenExp,@typescriptValue,typescriptObjectLiteral,typescriptFuncKeyword,typescriptIdentifierName,typescriptRegexpString,@typescriptEventTypes,@typescriptOps,typescriptGlobal,jsxRegion

syntax region  typescriptLoopParen             contained matchgroup=typescriptParens start=/(/ end=/)/ contains=typescriptVariable,typescriptForOperator,typescriptEndColons,@typescriptExpression nextgroup=typescriptBlock skipwhite skipempty

" syntax match   typescriptFuncCall              contained /[a-zA-Z]\k*\ze(/ nextgroup=typescriptArgumentList
syntax region  typescriptArgumentList           contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptExpression nextgroup=typescriptOpSymbols,typescriptDotNotation skipwhite skipempty
syntax cluster typescriptSymbols               contains=typescriptOpSymbols,typescriptLogicSymbols
syntax region  typescriptEventFuncCallArg      contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptEventExpression

syntax match   typescriptArrowFuncDef          contained /([^)]*)\_s*=>/ contains=typescriptFuncArg,typescriptArrowFunc nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /[a-zA-Z_]\k*\_s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFunc             /=>/
syntax match   typescriptArrowFuncArg          contained /[a-zA-Z_]\k*/

if exists("did_typescript_hilink")
  HiLink typescriptReserved             Error

  HiLink typescriptEndColons            Exception
  HiLink typescriptOpSymbols            Normal
  HiLink typescriptLogicSymbols         Boolean
  HiLink typescriptBraces               Function
  HiLink typescriptParens               Normal
  HiLink typescriptComment              Comment
  HiLink typescriptLineComment          Comment
  HiLink typescriptDocComment           Comment
  HiLink typescriptCommentTodo          Todo
  HiLink typescriptRef                  Include
  HiLink typescriptRefS                 String
  HiLink typescriptRefD                 String
  HiLink typescriptDocNotation          SpecialComment
  HiLink typescriptDocTags              SpecialComment
  HiLink typescriptDocNGParam           typescriptDocParam
  HiLink typescriptDocParam             Function
  HiLink typescriptDocNumParam          Function
  HiLink typescriptDocEventRef          Function
  HiLink typescriptDocNamedParamType    Type
  HiLink typescriptDocParamName         Type
  HiLink typescriptDocParamType         Type
  HiLink typescriptString               String
  HiLink typescriptTemplate             String
  HiLink typescriptEventString          String
  HiLink typescriptASCII                Label
  HiLink typescriptTemplateSubstitution Label
  " HiLink typescriptTemplateSBlock       Label
  " HiLink typescriptTemplateSString      Label
  HiLink typescriptTemplateSStringRB    typescriptTemplateSubstitution
  HiLink typescriptTemplateSB           typescriptTemplateSubstitution
  HiLink typescriptRegexpString         String
  HiLink typescriptGlobal               Constant
  HiLink typescriptCharacter            Character
  HiLink typescriptPrototype            Type
  HiLink typescriptConditional          Conditional
  HiLink typescriptConditionalElse      Conditional
  HiLink typescriptCase                 Conditional
  HiLink typescriptDefault              typescriptCase
  HiLink typescriptBranch               Conditional
  HiLink typescriptIdentifier           Structure
  HiLink typescriptVariable             Identifier
  HiLink typescriptRepeat               Repeat
  HiLink typescriptForComprehension     Repeat
  HiLink typescriptIfComprehension      Repeat
  HiLink typescriptOfComprehension      Repeat
  HiLink typescriptForOperator          Repeat
  HiLink typescriptStatementKeyword     Statement
  HiLink typescriptMessage              Keyword
  HiLink typescriptOperator             Identifier
  HiLink typescriptType                 Type
  HiLink typescriptNull                 Boolean
  HiLink typescriptNumber               Number
  HiLink typescriptBoolean              Boolean
  HiLink typescriptObjectLabel          typescriptLabel
  HiLink typescriptLabel                Label
  HiLink typescriptPropertyName         Label
  HiLink typescriptImport               Special
  HiLink typescriptExport               Special
  HiLink typescriptTry                  Special
  HiLink typescriptExceptions           Special

  HiLink typescriptMethodName           Function
  HiLink typescriptMethodAccessor       Operator

  HiLink typescriptAsyncFuncKeyword     Keyword
  HiLink typescriptFuncKeyword          Keyword
  HiLink typescriptAsyncFunc            Keyword
  HiLink typescriptArrowFunc            Type
  HiLink typescriptFuncName             Function
  HiLink typescriptFuncArg              Special
  HiLink typescriptArrowFuncArg         typescriptFuncArg
  HiLink typescriptFuncComma            Operator

  HiLink typescriptClassKeyword         Keyword
  HiLink typescriptClassExtends         Keyword
  HiLink typescriptClassName            Function
  HiLink typescriptClassStatic          StorageClass
  HiLink typescriptClassSuper           keyword

  HiLink shellbang                      Comment

  HiLink typescriptTypeParameter         Identifier
  HiLink typescriptConstraint            Keyword
  HiLink typescriptPredefinedType        Type
  HiLink typescriptUnion                 Operator
  HiLink typescriptFuncTypeArrow         Function
  HiLink typescriptConstructorType       Function
  HiLink typescriptTypeQuery             Keyword
  HiLink typescriptAccessibilityModifier Keyword
  HiLink typescriptOptionalMark          Special
  HiLink typescriptFuncType              Special
  HiLink typescriptCall                  Special
  HiLink typescriptConstructSignature    Identifier
  HiLink typescriptPropertySignature     Statement
  HiLink typescriptAliasDeclaration      Identifier
  HiLink typescriptAliasKeyword          Keyword
  HiLink typescriptTypeReference         Identifier

  highlight link javaScript             NONE

  delcommand HiLink
  unlet did_typescript_hilink
endif

let b:current_syntax = "typescript"
if main_syntax == 'typescript'
  unlet main_syntax
endif

