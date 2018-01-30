" + - ^ ~
syntax match typescriptUnaryOp /[+\-\^~!]/
 \ nextgroup=@typescriptExpression
 \ skipwhite

syntax region  typescriptTernaryOp start=/?/  end=/:/ contained contains=@typescriptExpression,@typescriptComments nextgroup=@typescriptExpression skipwhite skipempty

syntax match   typescriptAssign  contained /=/ nextgroup=@typescriptExpression
  \ skipwhite skipempty

" 2: ==, ===
syntax match   typescriptBinaryOp contained /===\?/ nextgroup=@typescriptExpression
" 6: >>>=, >>>, >>=, >>, >=, >
syntax match   typescriptBinaryOp contained />\(>>=\|>>\|>=\|>\|=\)\=/ nextgroup=@typescriptExpression
" 4: <<=, <<, <=, <
syntax match   typescriptBinaryOp contained /\(<<=\|<<\|<=\|<\)/ nextgroup=@typescriptExpression
" 3: ||, |=, |
syntax match   typescriptBinaryOp contained /\(||\||=\||\)/ nextgroup=@typescriptExpression
" 3: &&, &=, &
syntax match   typescriptBinaryOp contained /\(&&\|&=\|&\)/ nextgroup=@typescriptExpression
" 2: *=, *
syntax match   typescriptBinaryOp contained /\(*=\|*\)/ nextgroup=@typescriptExpression
" 2: %=, %
syntax match   typescriptBinaryOp contained /\(%=\|%\)/ nextgroup=@typescriptExpression
syntax match   typescriptBinaryOp contained +/\(=\|[^\*/]\@=\)+ nextgroup=@typescriptExpression
" 2: /=, /
syntax match   typescriptBinaryOp contained /!==\?/ nextgroup=@typescriptExpression
" 2: !=, !==
syntax match   typescriptBinaryOp contained /+\(+\|=\)\?/ nextgroup=@typescriptExpression
" 3: +, ++, +=
syntax match   typescriptBinaryOp contained /-\(-\|=\)\?/ nextgroup=@typescriptExpression
" 3: -, --, -=

" exponentiation operator
" 2: **, **=
syntax match typescriptBinaryOp contained /\(\*\*\|\*\*=\)/ nextgroup=@typescriptExpression

" syntax match   typescriptOpSymbol  contained /\(\^\|\~\)/ " 2: ^, ~

" syntax match   typescriptOpSymbols /!\+/ nextgroup=typescriptRegexpString " 1: !


" syntax match   typescriptLogicSymbols          /[^&|]\@<=\(&&\|||\)\ze\_[^&|]/ nextgroup=@typescriptExpression skipwhite skipempty
" syntax cluster typescriptSymbols               contains=typescriptUnaryOp,typescriptBinaryOp,typescriptLogicSymbols
syntax cluster typescriptSymbols               contains=typescriptBinaryOp,typescriptKeywordOp,typescriptTernaryOp,typescriptAssign
