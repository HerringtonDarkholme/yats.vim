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
