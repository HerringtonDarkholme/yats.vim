"Syntax in the JavaScript code

" String
syntax match   typescriptASCII                 contained /\\\d\d\d/

syntax region  typescriptTemplateSubstitution matchgroup=typescriptTemplateSB
  \ start=/\${/ end=/}/
  \ contains=@typescriptExpression
  \ contained

syntax region  typescriptString
  \ start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/
  \ nextgroup=@typescriptSymbols
  \ skipwhite skipempty

syntax region  typescriptTemplate matchgroup=typescriptTemplateTag
  \ start=/\k*`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/
  \ contains=typescriptTemplateSubstitution
  \ nextgroup=@typescriptSymbols
  \ skipwhite skipempty

"Array
syntax region  typescriptArray matchgroup=typescriptBraces
  \ start=/\[/ end=/]/
  \ contains=@typescriptValue,typescriptForComprehension
  \ nextgroup=@typescriptSymbols,@typescriptComments
  \ skipwhite skipempty

" Number
syntax match typescriptNumber /\<0[bB][01]\+\>/        nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\<0[oO][0-7]\+\>/       nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\<0[xX][0-9a-fA-F]\+\>/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /[+-]\=\%(\d\+\.\d\+\|\d\+\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
  \ nextgroup=@typescriptSymbols skipwhite skipempty
