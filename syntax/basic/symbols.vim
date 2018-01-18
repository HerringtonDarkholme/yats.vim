syntax match   typescriptOpSymbols             /[+\-*/%\^~=<>&|?]\+/
  \ contains=typescriptOpSymbol,typescriptInvalidOp
  \ nextgroup=@typescriptComments,@typescriptExpression
  \ skipwhite skipempty

syntax match   typescriptInvalidOp contained /[+\-*/%\^~=!<>&|?:]\+/

syntax match   typescriptOpSymbol  contained /\(=\|?\)/
  \ nextgroup=@typescriptExpression
  \ skipwhite skipempty
syntax match   typescriptOpSymbol  contained /===\?/ " 2: ==, ===
syntax match   typescriptOpSymbol  contained /\(>>>=\|>>>\|>>=\|>>\|>=\|>\)/ " 6: >>>=, >>>, >>=, >>, >=, >
syntax match   typescriptOpSymbol  contained /\(<<=\|<<\|<=\|<\)/ " 4: <<=, <<, <=, <
syntax match   typescriptOpSymbol  contained /\(||\||=\||\)/ " 3: ||, |=, |
syntax match   typescriptOpSymbol  contained /\(&&\|&=\|&\)/ " 3: &&, &=, &
syntax match   typescriptOpSymbol  contained /\(*=\|*\)/ " 2: *=, *
syntax match   typescriptOpSymbol  contained /\(%=\|%\)/ " 2: %=, %
syntax match   typescriptOpSymbol  contained /\(\/=\|\/\)/ " 2: /=, /
syntax match   typescriptOpSymbol  contained /\(\^\|\~\)/ " 2: ^, ~

syntax match   typescriptOpSymbols /!\+/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 1: !
syntax match   typescriptOpSymbols /!==\?/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 2: !=, !==
syntax match   typescriptOpSymbols /+\(+\|=\)\?/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 3: +, ++, +=
syntax match   typescriptOpSymbols /-\(-\|=\)\?/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 3: -, --, -=

" exponentiation operator
syntax match typescriptOpSymbol contained /\(**\|**=\)/ " 2: **, **=

syntax match   typescriptLogicSymbols          /[^&|]\@<=\(&&\|||\)\ze\_[^&|]/ nextgroup=@typescriptExpression skipwhite skipempty
syntax cluster typescriptSymbols               contains=typescriptOpSymbols,typescriptLogicSymbols
