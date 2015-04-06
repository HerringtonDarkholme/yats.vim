"For Comprehension

syntax keyword typescriptForComprehension for
  \ nextgroup=typescriptForComprehensionTail
  \ contained skipwhite skipempty

syntax region  typescriptForComprehensionTail  matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=typescriptOfComprehension,@typescriptExpression
  \ nextgroup=typescriptForComprehension,typescriptIfComprehension,@typescriptExpression
  \ contained skipwhite skipempty

syntax keyword typescriptOfComprehension       contained of
syntax keyword typescriptIfComprehension       contained if nextgroup=typescriptIfComprehensionTail

syntax region  typescriptIfComprehensionTail   matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=typescriptExpression
  \ nextgroup=typescriptForComprehension,typescriptIfComprehension
  \ contained skipwhite skipempty
