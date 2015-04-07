syntax region  typescriptMethodDef             start=/\v((set|get)\_s+)?[a-zA-Z_$]\k*\_s*(\(|\<)/ end=/\ze}/
  \ contains=typescriptMethodAccessor,typescriptMethodName
  \ skipwhite contained

syntax keyword typescriptMethodAccessor        contained get set

syntax match   typescriptMethodName            contained /[a-zA-Z_$]\k*/
  \ nextgroup=typescriptMethodArgs
  \ skipwhite skipempty
syntax region  typescriptMethodName            matchgroup=typescriptPropertyName
  \ start=/\[/ end=/]/
  \ contains=@typescriptValue
  \ nextgroup=typescriptMethodArgs
  \ skipwhite skipempty contained

syntax region  typescriptMethodArgs            contained start=/(\|</ end=/\ze{/
  \ contains=@typescriptCallSignature
  \ nextgroup=typescriptBlock
  \ skipwhite
