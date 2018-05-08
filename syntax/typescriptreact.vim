if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'typescriptreact'
endif

" nextgroup doesn't contain objectLiteral, let outer region contains it
syntax region typescriptTypeCast matchgroup=typescriptTypeBrackets
  \ start=/< \@!/ end=/>/
  \ contains=@typescriptType
  \ nextgroup=@typescriptExpression
  \ contained skipwhite oneline

runtime syntax/common.vim

let b:current_syntax = "typescriptreact"
if main_syntax == 'typescriptreact'
  unlet main_syntax
endif
