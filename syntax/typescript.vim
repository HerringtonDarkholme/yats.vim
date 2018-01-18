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


if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'typescript'
endif

" Define the default highlighting.
" For version 5.8 and later: only when an item doesn't have highlighting yet
let did_typescript_hilink = 1
command -nargs=+ HiLink hi def link <args>

"Dollar sign is permitted anywhere in an identifier
setlocal iskeyword-=$
if main_syntax == 'typescript'
  setlocal iskeyword+=$
  syntax cluster htmlJavaScript                 contains=TOP
endif

syntax sync fromstart

if main_syntax == "typescript"
  syntax sync clear
  syntax sync ccomment typescriptComment minlines=200
endif

syntax case match

" lowest priority on least used feature
syntax match   typescriptLabel                 /\v(^\s*|;)[a-zA-Z_$]\k*\_s*:/he=e-1 contains=typescriptReserved nextgroup=@typescriptStatement skipwhite skipempty

runtime syntax/basic/literal.vim

syntax match typescriptRestOrSpread /\.\.\./ contained
syntax match typescriptObjectSpread /\.\.\./ contained containedin=typescriptObjectLiteral nextgroup=@typescriptExpression

syntax match   typescriptIdentifierName        /\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*/ nextgroup=typescriptDotNotation,typescriptArgumentList,typescriptComputedProperty contains=@_semantic skipnl skipwhite
syntax region   typescriptIdentifierName        start=/\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*</ end=/>\ze(/ nextgroup=typescriptDotNotation,typescriptArgumentList,typescriptComputedProperty contains=@_semantic,typescriptTypeArguments oneline skipnl skipwhite


syntax match   typescriptObjectLabel           contained /\(^\|,\|{\)\@<=\s*\zs\k\+\_s*:/he=e-1 nextgroup=@typescriptValue,@typescriptStatement skipwhite skipempty
syntax region  typescriptPropertyName   contained start=/\(^\|,\|{\)\@<=\s*\zs\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\_s*:\|$/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptPropertyName    contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\ze(/ nextgroup=typescriptFuncArg skipwhite skipempty oneline
syntax region  typescriptComputedPropertyName  contained matchgroup=typescriptPropertyName start=/\(^\|,\|{\)\@<=\s*\zs\[/rs=s+1 end=/]\_s*:/he=e-1 contains=@typescriptExpression nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptComputedProperty      contained matchgroup=typescriptProperty start=/\(^\|,\|{\)\@<=\s*\zs\[/rs=s+1 end=/]/he=e-1 contains=@typescriptExpression nextgroup=@typescriptValue skipwhite skipempty
" Value for object, statement for label statement

runtime syntax/basic/symbols.vim
runtime syntax/basic/doc.vim
runtime syntax/basic/reserved.vim
runtime syntax/basic/keyword.vim
runtime syntax/basic/type.vim

syntax match   typescriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*!\?/ contains=@props,@_semantic transparent nextgroup=@typescriptSymbols,typescriptDotNotation skipwhite skipempty
syntax match   typescriptProp                  contained /[a-zA-Z_$]\w*\ze(/ nextgroup=typescriptArgumentList contains=@_semantic,@props oneline
syntax region  typescriptProp                  contained start=/[a-zA-Z_$][a-zA-Z0-9_$]*</ end=/>\ze(/ nextgroup=typescriptArgumentList contains=@_semantic,@props,typescriptTypeArguments oneline
syntax match   typescriptMethod                contained /[a-zA-Z_$][a-zA-Z0-9_$]*@!\?\ze(/ contains=@props transparent nextgroup=typescriptArgumentList
syntax match   typescriptDotNotation           /\./ nextgroup=typescriptProp,typescriptMethod contained skipnl
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
" patch
runtime syntax/basic/patch.vim

let typescript_props = 1

runtime syntax/yats/event.vim
syntax region  typescriptEventString           contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ contains=typescriptASCII,@events

"Import
syntax region  typescriptImportDef             start=/\<import\>/ end=/;\|['"])\?\s*$/ contains=typescriptImport,typescriptString,typescriptBlock keepend
syntax keyword typescriptImport                contained from as import
syntax keyword typescriptExport                export module

syntax region  typescriptBlock                 matchgroup=typescriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=@htmlJavaScript fold

runtime syntax/basic/method.vim

syntax keyword typescriptAsyncFuncKeyword      async await nextgroup=typescriptFuncKeyword,typescriptArrowFuncDef skipwhite skipnl skipnl
" syntax keyword typescriptFuncKeyword           function nextgroup=typescriptFuncName,typescriptFuncArg skipwhite
syntax keyword typescriptFuncKeyword           function nextgroup=typescriptAsyncFunc,typescriptSyncFunc
syntax match   typescriptSyncFunc              contained // nextgroup=typescriptFuncName,typescriptFuncArg skipwhite skipempty
syntax match   typescriptAsyncFunc             contained /*/ nextgroup=typescriptFuncName,typescriptFuncArg skipwhite skipempty
syntax match   typescriptFuncName              contained /[a-zA-Z_$]\k*/ nextgroup=typescriptFuncArg skipwhite
syntax region   typescriptFuncArg              contained start=/<\|(/ end=/\%(:\s*\)\@<!\ze{\|;\|$/ contains=@typescriptCallSignature nextgroup=typescriptBlock skipwhite skipwhite skipempty
syntax match   typescriptFuncComma             contained /,/


runtime syntax/basic/class.vim
runtime syntax/basic/forcomprehension.vim


syntax region  typescriptObjectLiteral         contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptComments,typescriptObjectLabel,typescriptPropertyName,typescriptMethodDef,typescriptComputedPropertyName,@typescriptValue fold

syntax match   typescriptEndColons             /[;,]/

" From vim runtime
" <https://github.com/vim/vim/blob/master/runtime/syntax/javascript.vim#L48>
syntax region  typescriptRegexpString          start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gimuy]\{0,5\}\s*$+ end=+/[gimuy]\{0,5\}\s*[;.,)\]}]+me=e-1 nextgroup=typescriptDotNotation oneline

runtime syntax/basic/cluster.vim

syntax region  typescriptLoopParen             contained matchgroup=typescriptParens start=/(/ end=/)/ contains=typescriptVariable,typescriptForOperator,typescriptEndColons,@typescriptExpression nextgroup=typescriptBlock skipwhite skipempty
syntax region  typescriptConditionalParen             contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptExpression nextgroup=typescriptBlock skipwhite skipempty

" syntax match   typescriptFuncCall              contained /[a-zA-Z]\k*\ze(/ nextgroup=typescriptArgumentList
syntax region  typescriptArgumentList           contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptExpression,@typescriptComments nextgroup=typescriptOpSymbols,typescriptDotNotation skipwhite skipempty skipnl
syntax region  typescriptEventFuncCallArg      contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptEventExpression

syntax match   typescriptArrowFuncDef          contained /(\_[^)]*)\_s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=@typescriptExpression skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /[a-zA-Z_$]\k*\_s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=@typescriptExpression skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /(\_[^)]*)\_s*=>\ze\s*{/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /[a-zA-Z_$]\k*\_s*=>\ze\s*{/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFunc             /=>/
syntax match   typescriptArrowFuncArg          contained /[a-zA-Z_$]\k*/
syntax region  typescriptArrowFuncArg          contained start=/<\|(/ end=/\ze=>/ contains=@typescriptCallSignature

runtime syntax/basic/ambient.vim
runtime syntax/basic/decorator.vim

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
  HiLink typescriptASCII                Special
  HiLink typescriptTemplateSB           Label
  HiLink typescriptTemplateTag          Identifier
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
  HiLink typescriptEnumKeyword          Identifier
  HiLink typescriptRepeat               Repeat
  HiLink typescriptForComprehension     Repeat
  HiLink typescriptIfComprehension      Repeat
  HiLink typescriptOfComprehension      Repeat
  HiLink typescriptForOperator          Repeat
  HiLink typescriptStatementKeyword     Statement
  HiLink typescriptMessage              Keyword
  HiLink typescriptOperator             Identifier
  HiLink typescriptCastKeyword          Special
  HiLink typescriptType                 Type
  HiLink typescriptNull                 Boolean
  HiLink typescriptNumber               Number
  HiLink typescriptBoolean              Boolean
  HiLink typescriptObjectLabel          typescriptLabel
  HiLink typescriptLabel                Label
  HiLink typescriptPropertyName         Label
  HiLink typescriptImport               Special
  HiLink typescriptAmbientDeclaration   Special
  HiLink typescriptExport               Special
  HiLink typescriptAmbientExport        Special
  HiLink typescriptTry                  Special
  HiLink typescriptExceptions           Special

  HiLink typescriptMethodName           Function
  HiLink typescriptMethodAccessor       Operator

  HiLink typescriptAsyncFuncKeyword     Keyword
  HiLink typescriptAsyncFor             Keyword
  HiLink typescriptFuncKeyword          Keyword
  HiLink typescriptAsyncFunc            Keyword
  HiLink typescriptArrowFunc            Type
  HiLink typescriptFuncName             Function
  HiLink typescriptFuncArg              PreProc
  HiLink typescriptArrowFuncArg         typescriptFuncArg
  HiLink typescriptFuncComma            Operator

  HiLink typescriptClassKeyword         Keyword
  HiLink typescriptClassExtends         Keyword
  HiLink typescriptClassName            Function
  HiLink typescriptAbstract             Special
  HiLink typescriptClassHeritage        Function
  HiLink typescriptInterfaceHeritage    Function
  HiLink typescriptClassStatic          StorageClass
  HiLink typescriptClassSuper           keyword
  HiLink typescriptInterfaceKeyword     Keyword
  HiLink typescriptInterfaceExtends     Keyword
  HiLink typescriptInterfaceName        Function

  HiLink shellbang                      Comment

  HiLink typescriptTypeParameter         Identifier
  HiLink typescriptConstraint            Keyword
  HiLink typescriptPredefinedType        Type
  HiLink typescriptUnion                 Operator
  HiLink typescriptFuncTypeArrow         Function
  HiLink typescriptConstructorType       Function
  HiLink typescriptTypeQuery             Keyword
  HiLink typescriptAccessibilityModifier Keyword
  HiLink typescriptOptionalMark          PreProc
  HiLink typescriptFuncType              Special
  HiLink typescriptMappedIn              Special
  HiLink typescriptCall                  PreProc
  HiLink typescriptConstructSignature    Identifier
  HiLink typescriptMethodSignature       Statement
  HiLink typescriptAliasDeclaration      Identifier
  HiLink typescriptAliasKeyword          Keyword
  HiLink typescriptUserDefinedKeyword    Keyword
  HiLink typescriptTypeReference         Identifier
  HiLink typescriptAmbientModifier       Keyword
  HiLink typescriptAmbientName           Identifier
  HiLink typescriptAmbientCtor           Keyword
  HiLink typescriptConstructor           Keyword
  HiLink typescriptDecorator             Special

  highlight link javaScript             NONE

  delcommand HiLink
  unlet did_typescript_hilink
endif

let b:current_syntax = "typescript"
if main_syntax == 'typescript'
  unlet main_syntax
endif
