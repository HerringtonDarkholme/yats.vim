syntax match   typescriptIdentifierName        /\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*/ nextgroup=typescriptDotNotation,typescriptArgumentList,typescriptComputedProperty,@typescriptSymbols transparent contains=@_semantic skipnl skipwhite
syntax region   typescriptIdentifierName        start=/\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*</ end=/>\ze(/ nextgroup=typescriptArgumentList contains=@_semantic,typescriptTypeArguments oneline skipnl skipwhite
syntax match   typescriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*!\?/ transparent contains=@props nextgroup=@typescriptSymbols,typescriptDotNotation skipwhite skipempty
syntax match   typescriptProp                  contained /[a-zA-Z_$]\w*\ze(/ contains=@props nextgroup=typescriptArgumentList oneline
syntax region  typescriptProp                  contained start=/[a-zA-Z_$][a-zA-Z0-9_$]*</ end=/>\ze(/ nextgroup=typescriptArgumentList contains=typescriptTypeArguments oneline
syntax match   typescriptMethod                contained /[a-zA-Z_$][a-zA-Z0-9_$]*@!\?\ze(/ contains=@props transparent nextgroup=typescriptArgumentList
syntax match   typescriptDotNotation           /\./ nextgroup=typescriptProp,typescriptMethod skipnl
syntax match   typescriptDotStyleNotation      /\.style\./ nextgroup=typescriptDOMStyle transparent
" syntax match   typescriptFuncCall              contained /[a-zA-Z]\k*\ze(/ nextgroup=typescriptArgumentList
syntax region  typescriptParenExp              matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptComments,@typescriptExpression nextgroup=@typescriptSymbols skipwhite skipempty
syntax region  typescriptArgumentList           contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptExpression,@typescriptComments nextgroup=typescriptBinaryOp,typescriptDotNotation skipwhite skipempty skipnl
syntax region  typescriptEventFuncCallArg      contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptEventExpression
syntax region  typescriptEventString           contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ contains=typescriptASCII,@events
