if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'typescriptreact'
endif

syntax region jsxTag
      \ start=+<\([^/!?<>="':]\+\)\@=+
      \ skip=+</[^ /!?<>"']\+>+
      \ end=+/\@<!>+
      \ end=+\(/>\)\@=+
      \ contained
      \ contains=jsxTag,jsxError,jsxTagName,jsxAttrib,jsxEqual,jsxString,jsxEscapeJs,
                \jsxCloseString
      \ keepend
      \ extend

syntax match jsxTag /<>/ contained


" <tag></tag>
" s~~~~~~~~~e
" and self close tag
" <tag/>
" s~~~~e
" A big start regexp borrowed from https://git.io/vDyxc
syntax region jsxRegion
      \ start=+\(\((\|{\|}\|\[\|,\|&&\|||\|?\|:\|=\|=>\|\Wreturn\|^return\|\Wdefault\|^\|>\)\_s*\)\@<=<\_s*\z([_\$a-zA-Z]\(\.\?[\$0-9a-zA-Z]\+\)*\)+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</\_s*\z1>+
      \ end=+/>+
      \ fold
      \ contains=jsxRegion,jsxCloseString,jsxCloseTag,jsxTag,jsxComment,jsFuncBlock,jsxFragment,@Spell
      \ extend

" <>   </>
" s~~~~~~e
" A big start regexp borrowed from https://git.io/vDyxc
syntax region jsxFragment
      \ start=+\(\((\|{\|}\|\[\|,\|&&\|||\|?\|:\|=\|=>\|\Wreturn\|^return\|\Wdefault\|^\|>\)\_s*\)\@<=<>+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</>+
      \ fold
      \ contains=jsxRegion,jsxCloseString,jsxCloseTag,jsxTag,jsxComment,jsFuncBlock,jsxFragment,@Spell
      \ keepend
      \ extend

" </tag>
" ~~~~~~
syntax match jsxCloseTag
      \ +</\_s*[^/!?<>"']\+>+
      \ contained
      \ contains=jsxNamespace

syntax match jsxCloseTag +</>+ contained

syntax match jsxCloseString
      \ +/>+
      \ contained

" <!-- -->
" ~~~~~~~~
syntax match jsxComment /<!--\_.\{-}-->/ display

syntax match jsxEntity "&[^; \t]*;" contains=jsxEntityPunct
syntax match jsxEntityPunct contained "[&.;]"

" <tag key={this.props.key}>
"  ~~~
syntax match jsxTagName
    \ +<\_s*\zs[^/!?<>"']\++
    \ contained
    \ display

" <tag key={this.props.key}>
"      ~~~
syntax match jsxAttrib
    \ +\(\(<\_s*\)\@<!\_s\)\@<=\<[a-zA-Z_][-0-9a-zA-Z_]*\>\(\_s\+\|\_s*[=/>]\)\@=+
    \ contained
    \ display

" <tag id="sample">
"        ~
" syntax match jsxEqual +=+ display

" <tag id="sample">
"         s~~~~~~e
syntax region jsxString contained start=+"+ end=+"+ contains=jsxEntity,@Spell display

" <tag id='sample'>
"         s~~~~~~e
syntax region jsxString contained start=+'+ end=+'+ contains=jsxEntity,@Spell display

" <tag key={this.props.key}>
"          s~~~~~~~~~~~~~~e
syntax region jsxEscapeJs
    \ contained
    \ contains=typescriptBlock,jsxRegion,jsxFragment
    \ start=+{+
    \ end=++
    \ extend

syntax match jsxIfOperator +?+
syntax match jsxElseOperator +:+

syntax cluster typescriptValue add=jsxRegion,jsxFragment

runtime syntax/common.vim

highlight def link jsxTag Function
highlight def link jsxTagName Function
highlight def link jsxString String
highlight def link jsxNameSpace Function
highlight def link jsxComment Error
highlight def link jsxAttrib Type
highlight def link jsxEscapeJs jsxEscapeJs
highlight def link jsxCloseTag Identifier
highlight def link jsxCloseString Identifier

let b:current_syntax = "typescriptreact"
if main_syntax == 'typescriptreact'
  unlet main_syntax
endif
