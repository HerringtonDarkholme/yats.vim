syntax match typescriptDecorator /@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>/ contains=@_semantic,typescriptDotNotation
syntax region typescriptDecorator start=/@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\ze(/ end=/)/
  \ keepend
  \ contains=@_semantic,typescriptParenExp,typescriptDotNotation
