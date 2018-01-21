syntax match   typescriptOpSymbols             /[+\-*/%\^~=<>&|?]\+/
  \ contains=typescriptBinaryOp,typescriptInvalidOp
  \ skipwhite skipempty

" + - ^ ~
syntax match typescriptUnaryOp /[+-\^~!]/
 \ nextgroup=@typescriptExpression
 \ skipwhite

syntax match   typescriptInvalidOp contained /[+\-*/%\^~=!<>&|?:]\+/

syntax match   typescriptBinaryOp  contained /\(=\|?\)/
  \ skipwhite skipempty

syntax match   typescriptBinaryOp  contained /===\?/ " 2: ==, ===
syntax match   typescriptBinaryOp  contained /\(>>>=\|>>>\|>>=\|>>\|>=\|>\)/ " 6: >>>=, >>>, >>=, >>, >=, >
syntax match   typescriptBinaryOp  contained /\(<<=\|<<\|<=\|<\)/ " 4: <<=, <<, <=, <
syntax match   typescriptBinaryOp  contained /\(||\||=\||\)/ " 3: ||, |=, |
syntax match   typescriptBinaryOp  contained /\(&&\|&=\|&\)/ " 3: &&, &=, &
syntax match   typescriptBinaryOp  contained /\(*=\|*\)/ " 2: *=, *
syntax match   typescriptBinaryOp  contained /\(%=\|%\)/ " 2: %=, %
syntax match   typescriptBinaryOp  contained /\(\/=\|\/\)/ " 2: /=, /

" exponentiation operator
syntax match typescriptBinaryOp contained /\(**\|**=\)/ " 2: **, **=

" syntax match   typescriptOpSymbol  contained /\(\^\|\~\)/ " 2: ^, ~

syntax match   typescriptOpSymbols /!\+/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 1: !
syntax match   typescriptOpSymbols /!==\?/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 2: !=, !==
syntax match   typescriptOpSymbols /+\(+\|=\)\?/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 3: +, ++, +=
syntax match   typescriptOpSymbols /-\(-\|=\)\?/ nextgroup=typescriptRegexpString,typescriptInvalidOp " 3: -, --, -=


syntax match   typescriptLogicSymbols          /[^&|]\@<=\(&&\|||\)\ze\_[^&|]/ nextgroup=@typescriptExpression skipwhite skipempty
syntax cluster typescriptSymbols               contains=typescriptOpSymbols,typescriptLogicSymbols
