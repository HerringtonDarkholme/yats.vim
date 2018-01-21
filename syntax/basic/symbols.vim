" + - ^ ~
syntax match typescriptUnaryOp /[+-\^~!]/
 \ nextgroup=@typescriptExpression
 \ skipwhite

syntax match   typescriptBinaryOp  contained /\(=\|?\)/
  \ skipwhite skipempty

syntax match   typescriptBinaryOp contained /===\?/ " 2: ==, ===
syntax match   typescriptBinaryOp contained /\(>>>=\|>>>\|>>=\|>>\|>=\|>\)/ " 6: >>>=, >>>, >>=, >>, >=, >
syntax match   typescriptBinaryOp contained /\(<<=\|<<\|<=\|<\)/ " 4: <<=, <<, <=, <
syntax match   typescriptBinaryOp contained /\(||\||=\||\)/ " 3: ||, |=, |
syntax match   typescriptBinaryOp contained /\(&&\|&=\|&\)/ " 3: &&, &=, &
syntax match   typescriptBinaryOp contained /\(*=\|*\)/ " 2: *=, *
syntax match   typescriptBinaryOp contained /\(%=\|%\)/ " 2: %=, %
syntax match   typescriptBinaryOp contained /\(\/=\|\/\)/ " 2: /=, /
syntax match   typescriptBinaryOp contained /!==\?/ nextgroup=typescriptRegexpString " 2: !=, !==
syntax match   typescriptBinaryOp contained /+\(+\|=\)\?/ nextgroup=typescriptRegexpString " 3: +, ++, +=
syntax match   typescriptBinaryOp contained /-\(-\|=\)\?/ nextgroup=typescriptRegexpString " 3: -, --, -=

" exponentiation operator
syntax match typescriptBinaryOp contained /\(**\|**=\)/ " 2: **, **=

" syntax match   typescriptOpSymbol  contained /\(\^\|\~\)/ " 2: ^, ~

" syntax match   typescriptOpSymbols /!\+/ nextgroup=typescriptRegexpString " 1: !


syntax match   typescriptLogicSymbols          /[^&|]\@<=\(&&\|||\)\ze\_[^&|]/ nextgroup=@typescriptExpression skipwhite skipempty
syntax cluster typescriptSymbols               contains=typescriptUnaryOp,typescriptBinaryOp,typescriptLogicSymbols
