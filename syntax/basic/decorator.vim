syntax match typescriptDecorator /@\k\+/ contains=_semantic
syntax region typescriptDecorator start=/@\k\+\ze(/ end=/)/
  \ keepend
  \ contains=typescriptParenExp
