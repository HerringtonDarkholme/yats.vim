syntax keyword typescriptAsyncFuncKeyword      async
  \ nextgroup=typescriptFuncKeyword,typescriptArrowFuncDef,typescriptGenericArrowFuncDef
  \ skipwhite

syntax keyword typescriptAsyncFuncKeyword      await
  \ nextgroup=@typescriptValue
  \ skipwhite

syntax keyword typescriptFuncKeyword           function
  \ nextgroup=typescriptAsyncFunc,typescriptFuncName,@typescriptCallSignature
  \ skipwhite skipempty

syntax match   typescriptAsyncFunc             contained /*/
  \ nextgroup=typescriptFuncName,@typescriptCallSignature
  \ skipwhite skipempty

syntax match   typescriptFuncName              contained /\K\k*/
  \ nextgroup=@typescriptCallSignature
  \ skipwhite

" a => ...
syntax match   typescriptArrowFuncDef  /\K\k*\s*=>/me=e-2
  \ contains=typescriptArrowFuncArg
  \ nextgroup=typescriptArrowFunc
  \ contained skipwhite skipempty extend

" (a, {b}, [c], ...) => ...
" TODO: arguments type contains recursively parens
syntax region  typescriptArrowFuncDef matchgroup=typescriptParens
  \ start=/(\ze\%(\_[^()]\+\|(\_[^()]*)\)*)\_s*=>/ end=/)\_s*=>/me=e-2
  \ contains=typescriptArrowFuncArg,@typescriptParameterList,@typescriptComments
  \ nextgroup=typescriptArrowFunc
  \ contained skipwhite skipempty

" (a, {b}, [c], ...): ... => ...
" TODO: arguments type contains recursively parens
syntax region  typescriptArrowFuncDef matchgroup=typescriptParens
  \ start=/(\ze\%(\_[^()]\+\|(\_[^()]*)\)*)\_s*:/ end=/=>/me=s-1
  \ contains=typescriptArrowFuncReturnAnnotation,typescriptArrowFuncArg,@typescriptParameterList,@typescriptComments
  \ nextgroup=typescriptArrowFunc
  \ contained skipwhite skipempty

" <C, ...>
syntax region  typescriptGenericArrowFuncDef matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptArrowFuncDef
  \ contained skipwhite skipempty

" TODO: return type contains parenthesized type
syntax region  typescriptArrowFuncReturnAnnotation
  \ matchgroup=typescriptParens start=/)\ze\_s*:/ end=/=>/me=s-1
  \ contains=typescriptTypeAnnotation
  \ contained

syntax match   typescriptArrowFunc             /=>/
  \ nextgroup=@typescriptExpression,typescriptBlock
  \ skipwhite skipempty

syntax match   typescriptArrowFuncArg          contained /\K\k*/
  \ nextgroup=typescriptTypeAnnotation

syntax region typescriptReturnAnnotation contained start=/:/ end=/{/me=e-1 contains=@typescriptType nextgroup=typescriptBlock


syntax region typescriptFuncImpl contained start=/function\>/ end=/{/me=e-1
  \ contains=typescriptFuncKeyword
  \ nextgroup=typescriptBlock

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
