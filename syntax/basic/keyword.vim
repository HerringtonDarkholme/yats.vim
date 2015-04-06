"this

"JavaScript Prototype
syntax keyword typescriptPrototype             prototype

"Program Keywords
syntax keyword typescriptIdentifier            arguments this
syntax keyword typescriptVariable              let var const enum
  \ nextgroup=typescriptVariableDeclaration
  \ skipwhite skipempty skipnl

syntax match typescriptVariableDeclaration /[A-Za-z_$]\k*/
  \ nextgroup=typescriptTypeAnnotation
  \ contained skipwhite skipempty skipnl

syntax keyword typescriptOperator              delete new instanceof typeof void in
  \ nextgroup=@typescriptValue,@typescriptTypes
  \ skipwhite skipempty
syntax keyword typescriptForOperator           contained in of
syntax keyword typescriptBoolean               true false nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptNull                  null undefined nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptMessage               alert confirm prompt status
syntax keyword typescriptGlobal                self top parent

"Statement Keywords
syntax keyword typescriptConditional           if else switch
syntax keyword typescriptConditionalElse       else
syntax keyword typescriptRepeat                do while for nextgroup=typescriptLoopParen skipwhite skipempty
syntax keyword typescriptBranch                break continue
syntax keyword typescriptCase                  case nextgroup=@typescriptTypes skipwhite
syntax keyword typescriptDefault               default
syntax keyword typescriptStatementKeyword      return with yield

syntax keyword typescriptTry                   try
syntax keyword typescriptExceptions            catch throw finally
syntax keyword typescriptDebugger              debugger

syntax keyword typescriptDeclare               declare
