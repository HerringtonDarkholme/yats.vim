syntax keyword typescriptAsyncFuncKeyword      async await nextgroup=typescriptFuncKeyword,typescriptArrowFuncDef skipwhite
syntax keyword typescriptFuncKeyword           function nextgroup=typescriptAsyncFunc,typescriptFuncName,typescriptFuncArg skipwhite skipempty
syntax match   typescriptAsyncFunc             contained /*/ nextgroup=typescriptFuncName,typescriptFuncArg skipwhite skipempty
syntax match   typescriptFuncName              contained /[a-zA-Z_$]\k*/ nextgroup=typescriptFuncArg skipwhite
syntax region   typescriptFuncArg              contained start=/<\|(/ end=/\%(:\s*\)\@<!\ze{\|;\|$/ contains=@typescriptCallSignature nextgroup=typescriptBlock skipwhite skipwhite skipempty
syntax match   typescriptFuncComma             contained /,/
syntax match   typescriptArrowFuncDef          contained /(\_[^)]*)\_s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=@typescriptExpression skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /[a-zA-Z_$]\k*\_s*=>/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=@typescriptExpression skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /(\_[^)]*)\_s*=>\ze\s*{/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFuncDef          contained /[a-zA-Z_$]\k*\_s*=>\ze\s*{/ contains=typescriptArrowFuncArg,typescriptArrowFunc nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptArrowFunc             /=>/
syntax match   typescriptArrowFuncArg          contained /[a-zA-Z_$]\k*/
syntax region  typescriptArrowFuncArg          contained start=/<\|(/ end=/\ze=>/ contains=@typescriptCallSignature
