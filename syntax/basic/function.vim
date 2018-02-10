syntax keyword typescriptAsyncFuncKeyword      async nextgroup=typescriptFuncKeyword,typescriptArrowFuncDef skipwhite
syntax keyword typescriptAsyncFuncKeyword      await nextgroup=@typescriptValue skipwhite
syntax keyword typescriptFuncKeyword           function nextgroup=typescriptAsyncFunc,typescriptFuncName,@typescriptCallSignature skipwhite skipempty
syntax match   typescriptAsyncFunc             contained /*/ nextgroup=typescriptFuncName,@typescriptCallSignature skipwhite skipempty
syntax match   typescriptFuncName              contained /[a-zA-Z_$]\k*/ nextgroup=@typescriptCallSignature skipwhite
" syntax region   typescriptFuncArg              contained start=/<\|(/ end=/\%(:\s*\)\@<!\ze{\|;\|$/ contains=@typescriptCallSignature nextgroup=typescriptBlock skipwhite skipwhite skipempty
syntax match   typescriptFuncComma             contained /,/
syntax match   typescriptArrowFuncDef          contained /(\_[^)]*)\s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=@typescriptExpression,typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /[a-zA-Z_$]\k*\s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=@typescriptExpression,typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFunc             /=>/
syntax match   typescriptArrowFuncArg          contained /[a-zA-Z_$]\k*/
syntax region  typescriptArrowFuncArg          contained start=/<\|(/ end=/\ze=>/ contains=@typescriptCallSignature

syntax region typescriptReturnAnnotation contained start=/:/ end=/{/me=e-1 contains=@typescriptType nextgroup=typescriptBlock


syntax cluster typescriptCallImpl contains=typescriptGenericImpl,typescriptParamImpl
syntax region typescriptGenericImpl matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptParamImpl
  \ contained skipwhite
syntax region typescriptParamImpl matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=typescriptDecorator,@typescriptParameterList,@typescriptComments
  \ nextgroup=typescriptReturnAnnotation,typescriptBlock
  \ contained skipwhite skipnl
