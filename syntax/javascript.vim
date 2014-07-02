" Vim syntax file
" Language:     JavaScript
" Maintainer:   Kao Wei-Ko <othree@gmail.com>
" Maintainer:   Jose Elera Campana <https://github.com/jelera>
" Last Change:  2013-02-19
" Version:      0.8
" Changes:      Go to https://github.com/othree/vim-javascript-syntax for
"               recent changes.
" Origin:       https://github.com/jelera/vim-javascript-syntax
" Credits:      Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based
"               on their hard work), gumnos (From the #vim IRC Channel in
"               Freenode)

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

"" dollar sign is permitted anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"" syntax coloring for Node.js shebang line
syntax match   shellbang "^#!.*/bin/env\s\+node\>"


" JavaScript comments
syntax keyword javascriptCommentTodo      TODO FIXME XXX TBD contained
syntax match   javascriptLineComment      "\/\/.*" contains=@Spell,javascriptCommentTodo
syntax match   javascriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javascriptComment          start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo

" JSDoc support start
if !exists("javascript_ignore_javaScriptdoc")
  syntax case ignore

  "" syntax coloring for javadoc comments (HTML)
  "syntax include @javaHtml <sfile>:p:h/html.vim
  "unlet b:current_syntax

  syntax region  javascriptDocComment         matchgroup=javascriptComment start="/\*\*"  end="\*/" contains=javascriptDocNotation,javascriptCommentTodo,javascriptCvsTag,@javascriptHtml,@Spell fold
  syntax match   javascriptDocNotation        contained "@" nextgroup=javascriptDocTags

  syntax keyword javascriptDocTags            contained constant constructor constrructs event function ignore inner private public static
  syntax keyword javascriptDocTags            contained const dict expose inheritDoc interface nosideeffects override protected struct
  syntax keyword javascriptDocTags            contained example

  syntax keyword javascriptDocTags            contained arguments lends memberOf name type link nextgroup=javascriptDocParam skipwhite

  syntax keyword javascriptDocTags            contained author class default deprecated description nextgroup=javascriptDocDesc skipwhite
  syntax keyword javascriptDocTags            contained fileOverview namespace requires since version nextgroup=javascriptDocDesc skipwhite
  syntax keyword javascriptDocTags            contained license preserve nextgroup=javascriptDocDesc skipwhite

  syntax keyword javascriptDocTags            contained borrows exports nextgroup=javascriptDocA skipwhite
  syntax keyword javascriptDocTags            contained param property nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite
  syntax keyword javascriptDocTags            contained define enum extends implements this typedef nextgroup=javascriptDocParamType skipwhite
  syntax keyword javascriptDocTags            contained returns throws nextgroup=javascriptDocParamType,javascriptDocParamName skipwhite
  syntax keyword javascriptDocTags            contained see nextgroup=javascriptDocRef skipwhite

  syntax match   javascriptDocNamedParamType  contained "{.\+}" nextgroup=javascriptDocParamName skipwhite
  syntax match   javascriptDocParamName       contained "\[\?\w\+\]\?" nextgroup=javascriptDocDesc skipwhite
  syntax match   javascriptDocParamType       contained "{.\+}" nextgroup=javascriptDocDesc skipwhite
  syntax match   javascriptDocA               contained "\%(#\|\w\|\.\|:\|\/\)\+" nextgroup=javascriptDocAs skipwhite
  syntax match   javascriptDocAs              contained "\s*as\s*" nextgroup=javascriptDocB skipwhite
  syntax match   javascriptDocB               contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax match   javascriptDocParam           contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax match   javascriptDocRef             contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax region  javascriptDocLinkTag         contained matchgroup=javascriptDocLinkTag start="{" end="}" contains=javascriptDocTags

  syntax case match
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

"JavaScript Prototype
syntax keyword javascriptPrototype             prototype
                                              
"Program Keywords                             
syntax keyword javascriptSource                import export
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
                                              
syntax keyword javascriptReserved              abstract enum int short boolean export
syntax keyword javascriptReserved              interface static byte extends long super
syntax keyword javascriptReserved              char final native synchronized class float
syntax keyword javascriptReserved              package throws const goto private transient
syntax keyword javascriptReserved              debugger implements protected volatile
syntax keyword javascriptReserved              double import public

runtime! syntax/yajs/javascript.vim
runtime! syntax/yajs/node.vim
runtime! syntax/yajs/web.vim
runtime! syntax/yajs/web-window.vim
runtime! syntax/yajs/web-location.vim
runtime! syntax/yajs/web-xhr.vim
runtime! syntax/yajs/dom-node.vim
runtime! syntax/yajs/dom-elem.vim
runtime! syntax/yajs/dom-event.vim
runtime! syntax/yajs/css.vim

let javascript_props = 1

syntax match javascriptDotNotation      "\." nextgroup=@props
syntax match javascriptDotStyleNotation "\.style\." nextgroup=javascriptDOMStyle transparent

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200
  " syntax sync match javascriptHighlight grouphere javascriptBlock /{/
endif

syntax keyword javascriptFuncKeyword  contained function
syntax region  javascriptFuncDef      start="function" end="\([^)]*\)" contains=javascriptFuncKeyword,javascriptFuncArg keepend
syntax match   javascriptFuncArg      contained "\(([^()]*)\)" contains=javascriptParens,javascriptFuncComma
syntax match   javascriptFuncComma    contained /,/
" syntax region  javascriptFuncBlock      contained matchgroup=javascriptFuncBlock start="{" end="}" contains=@javascriptAll,javascriptParensErrA,javascriptParensErrB,javascriptParen,javascriptBracket,javascriptBlock fold
syntax match   javascriptArrowFunc    /=>/

syntax region  javaScriptParen        contained start="(" end=")" 
syntax match   javascriptBraces	      "[{}\[\]]"
syntax match   javascriptParens	      "[()]"
syntax match   javascriptOpSymbols	  "\_[ \_^]\zs\(=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-=\)\ze\_[ \_$]"
syntax match   javascriptEndColons    "[;,]"
syntax match   javascriptLogicSymbols "\(&&\)\|\(||\)"


if exists("did_javascript_hilink")
  HiLink javascriptEndColons            Exception
  HiLink javascriptOpSymbols            Operator
  HiLink javascriptLogicSymbols         Boolean
  HiLink javascriptBraces               Function
  HiLink javascriptParens               Operator
  HiLink javascriptComment              Comment
  HiLink javascriptLineComment          Comment
  HiLink javascriptDocComment           Comment
  HiLink javascriptCommentTodo          Todo
  HiLink javascriptCvsTag               Function
  HiLink javascriptDocNotation          Special
  HiLink javascriptDocTags              Special
  " HiLink javascriptDocSeeTag            Function
  HiLink javascriptDocParam             Function
  HiLink javascriptDocNamedParamType    Type
  HiLink javascriptDocParamName         Type
  HiLink javascriptDocParamType         Type
  HiLink javascriptString               String
  HiLink javascriptTemplate             String
  HiLink javascriptTemplateSubstitution Label
  HiLink javascriptRegexpString         String
  " HiLink javascriptGlobal               Constant
  " HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptStatement            Statement
  HiLink javascriptFuncKeyword          Function
  HiLink javascriptArrowFunc            Function
  HiLink javascriptMessage              Keyword
  HiLink javascriptReserved             Keyword
  HiLink javascriptOperator             Operator
  HiLink javascriptType                 Type
  HiLink javascriptNull                 Type
  HiLink javascriptNumber               Number
  HiLink javascriptFloat                Number
  HiLink javascriptBoolean              Boolean
  HiLink javascriptLabel                Label
  HiLink javascriptSpecial              Special
  HiLink javascriptSource               Special
  HiLink javascriptExceptions           Special

  HiLink javascriptFuncDef              Title
  HiLink javascriptFuncArg              Special
  HiLink javascriptFuncComma            Operator  
                                        
  HiLink shellbang                      Comment

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

