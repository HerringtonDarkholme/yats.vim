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
      \ contains=jsxTagName,jsxIntrinsicTagName,jsxAttrib,jsxEscapeJs,
                \jsxCloseString

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
      \ matchgroup=jsxCloseString end=+/>+
      \ fold
      \ contains=jsxRegion,jsxCloseString,jsxCloseTag,jsxTag,jsxComment,jsFuncBlock,jsxFragment,@Spell
      \ keepend
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
      \ contains=jsxTagName,jsxIntrinsicTagName

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
    \ +[</]\_s*[^/!?<>"' ]\++hs=s+1
    \ contained
    \ display
syntax match jsxIntrinsicTagName
    \ +[</]\_s*[a-z]\++hs=s+1
    \ contained
    \ display

" <tag key={this.props.key}>
"      ~~~
syntax match jsxAttrib
    \ +\(\(<\_s*\)\@<!\_s\)\@<=\<[a-zA-Z_][-0-9a-zA-Z_]*\>\(\_s\+\|\_s*[=/>]\)\@=+
    \ nextgroup=jsxEqual skipwhite
    \ contained
    \ display

" <tag id="sample">
"        ~
syntax match jsxEqual +=+ display contained
  \ nextgroup=jsxString skipwhite

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
    \ end=+}+
    \ extend


runtime syntax/common.vim

syntax cluster typescriptExpression add=jsxRegion,jsxFragment

highlight def link jsxTag htmlTag
highlight def link jsxTagName Function
highlight def link jsxIntrinsicTagName htmlTagName
highlight def link jsxString String
highlight def link jsxNameSpace Function
highlight def link jsxComment Error
highlight def link jsxAttrib Type
highlight def link jsxEscapeJs jsxEscapeJs
highlight def link jsxCloseTag htmlTag
highlight def link jsxCloseString Identifier

let b:current_syntax = "typescriptreact"
if main_syntax == 'typescriptreact'
  unlet main_syntax
endif
