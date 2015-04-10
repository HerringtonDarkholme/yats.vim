syntax match typescriptDecorator /@\k\+/
syntax region typescriptDecorator start=/@\k\+(/ end=/)/
  \ contains=typescriptParenExp
