" Ported over from https://github.com/mxw/vim-jsx "

if !exists("main_syntax")
  if exists("b:current_syntax") && b:current_syntax != 'typescript'
    finish
  endif
  let main_syntax = 'typescript.tsx'
endif

syn include @XMLSyntax syntax/xml.vim

" JSX attributes should color as JS.  Note the trivial end pattern; we let
" jsBlock take care of ending the region.
syn region xmlString contained start=+{+ end=++ contains=typescriptBlock

" JSX comments inside XML tag should color as comment.  Note the trivial end pattern; we let
" jsComment take care of ending the region.
syn region xmlString contained start=+//+ end=++ contains=typescriptComment

" JSX child blocks behave just like JSX attributes, except that (a) they are
" syntactically distinct, and (b) they need the syn-extend argument, or else
" nested XML end-tag patterns may end the outer jsxRegion.
syn region tsxChild contained start=+{+ end=++ contains=typescriptBlock
  \ extend

" Highlight JSX regions as XML; recursively match.
"
" Note that we prohibit JSX tags from having a < or word character immediately
" preceding it, to avoid conflicts with, respectively, the left shift operator
" and generic Flow type annotations (http://flowtype.org/).
syn region tsxRegion
  \ contains=@Spell,@XMLSyntax,tsxRegion,tsxChild,typescriptBlock
  \ start=+\%(<\|\w\)\@<!<\z([a-zA-Z_][a-zA-Z0-9:\-.]*\>[:,]\@!\)\([^>]*>(\)\@!+
  \ skip=+<!--\_.\{-}-->+
  \ end=+</\z1\_\s\{-}>+
  \ end=+/>+
  \ keepend
  \ extend

" Add jsxRegion to the lowest-level JS syntax cluster.
syn cluster typescriptExpression add=tsxRegion

" Allow jsxRegion to contain reserved words.
"syn cluster javascriptNoReserved add=jsxRegion

runtime syntax/common.vim

let b:current_syntax = "typescript.tsx"
if main_syntax == 'typescript.tsx'
  unlet main_syntax
endif
