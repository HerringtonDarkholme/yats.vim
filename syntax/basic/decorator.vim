syntax match typescriptDecorator /@\k\+/
syntax region typescriptDecorator start=/@\k\+\ze(/ end=/)/
  \ keepend
  \ contains=typescriptParenExp
