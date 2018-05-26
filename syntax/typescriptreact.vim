if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'typescriptreact'
endif

syntax region tsxTag
      \ start=+<\([^/!?<>="':]\+\)\@=+
      \ skip=+</[^ /!?<>"']\+>+
      \ end=+/\@<!>+
      \ end=+\(/>\)\@=+
      \ contained
      \ contains=tsxTagName,tsxIntrinsicTagName,tsxAttrib,tsxEscapeJs,
                \tsxCloseString

syntax match tsxTag /<>/ contained


" <tag></tag>
" s~~~~~~~~~e
" and self close tag
" <tag/>
" s~~~~e
" A big start regexp borrowed from https://git.io/vDyxc
syntax region tsxRegion
      \ start=+<\_s*\z([a-zA-Z1-9\$_-]\+\(\.\k\+\)*\)+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</\_s*\z1>+
      \ matchgroup=tsxCloseString end=+/>+
      \ fold
      \ contains=tsxRegion,tsxCloseString,tsxCloseTag,tsxTag,tsxComment,tsxFragment,tsxEscapeJs,@Spell
      \ keepend
      \ extend

" <>   </>
" s~~~~~~e
" A big start regexp borrowed from https://git.io/vDyxc
syntax region tsxFragment
      \ start=+\(\((\|{\|}\|\[\|,\|&&\|||\|?\|:\|=\|=>\|\Wreturn\|^return\|\Wdefault\|^\|>\)\_s*\)\@<=<>+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</>+
      \ fold
      \ contains=tsxRegion,tsxCloseString,tsxCloseTag,tsxTag,tsxComment,tsxFragment,tsxEscapeJs,@Spell
      \ keepend
      \ extend

" </tag>
" ~~~~~~
syntax match tsxCloseTag
      \ +</\_s*[^/!?<>"']\+>+
      \ contained
      \ contains=tsxTagName,tsxIntrinsicTagName

syntax match tsxCloseTag +</>+ contained

syntax match tsxCloseString
      \ +/>+
      \ contained

" <!-- -->
" ~~~~~~~~
syntax match tsxComment /<!--\_.\{-}-->/ display

syntax match tsxEntity "&[^; \t]*;" contains=tsxEntityPunct
syntax match tsxEntityPunct contained "[&.;]"

" <tag key={this.props.key}>
"  ~~~
syntax match tsxTagName
    \ +[</]\_s*[^/!?<>"' ]\++hs=s+1
    \ contained
    \ display
syntax match tsxIntrinsicTagName
    \ +[</]\_s*[a-z1-9-]\++hs=s+1
    \ contained
    \ display

" <tag key={this.props.key}>
"      ~~~
syntax match tsxAttrib
    \ +\(\(<\_s*\)\@<!\_s\)\@<=\<[a-zA-Z_][-0-9a-zA-Z_]*\>\(\_s\+\|\_s*[=/>]\)\@=+
    \ nextgroup=tsxEqual skipwhite
    \ contained
    \ display

" <tag id="sample">
"        ~
syntax match tsxEqual +=+ display contained
  \ nextgroup=tsxString skipwhite

" <tag id="sample">
"         s~~~~~~e
syntax region tsxString contained start=+"+ end=+"+ contains=tsxEntity,@Spell display

" <tag id='sample'>
"         s~~~~~~e
syntax region tsxString contained start=+'+ end=+'+ contains=tsxEntity,@Spell display

" <tag key={this.props.key}>
"          s~~~~~~~~~~~~~~e
syntax region tsxEscapeJs
    \ contained
    \ contains=@typescriptExpression
    \ start=+{+
    \ end=+}+
    \ extend


runtime syntax/common.vim

syntax cluster typescriptExpression add=tsxRegion,tsxFragment

highlight def link tsxTag htmlTag
highlight def link tsxTagName Function
highlight def link tsxIntrinsicTagName htmlTagName
highlight def link tsxString String
highlight def link tsxNameSpace Function
highlight def link tsxComment Error
highlight def link tsxAttrib Type
highlight def link tsxEscapeJs tsxEscapeJs
highlight def link tsxCloseTag htmlTag
highlight def link tsxCloseString Identifier

let b:current_syntax = "typescriptreact"
if main_syntax == 'typescriptreact'
  unlet main_syntax
endif
