syntax match   typescriptIdentifierName        /\<[^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^0-9][^=<>!?+\-*\/%|&,;:. ~@#`"'\[\]\(\)\{\}\^]*/
  \ nextgroup=typescriptDotNotation,typescriptFuncCallArg,typescriptComputedProperty,@typescriptSymbols,typescriptTypeArguments
  \ transparent
  \ contains=@_semantic
  \ skipnl skipwhite

syntax match   typescriptProp                  contained /[a-zA-Z_$][a-zA-Z0-9_$]*!\?/ transparent contains=@props nextgroup=@typescriptSymbols,typescriptDotNotation skipwhite skipempty
syntax match   typescriptProp                  contained /[a-zA-Z_$]\w*\ze(/ contains=@props nextgroup=typescriptFuncCallArg oneline
syntax region  typescriptProp                  contained start=/[a-zA-Z_$][a-zA-Z0-9_$]*</ end=/>\ze(/ nextgroup=typescriptFuncCallArg contains=typescriptTypeArguments oneline
syntax match   typescriptMethod                contained /[a-zA-Z_$][a-zA-Z0-9_$]*@!\?\ze(/ contains=@props transparent nextgroup=typescriptFuncCallArg
syntax match   typescriptDotNotation           /\./ nextgroup=typescriptProp,typescriptMethod skipnl
syntax match   typescriptDotStyleNotation      /\.style\./ nextgroup=typescriptDOMStyle transparent
" syntax match   typescriptFuncCall              contained /[a-zA-Z]\k*\ze(/ nextgroup=typescriptFuncCallArg
syntax region  typescriptParenExp              matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptComments,@typescriptValue,typescriptCastKeyword nextgroup=@typescriptSymbols skipwhite skipempty
syntax region  typescriptFuncCallArg           contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptValue,@typescriptComments nextgroup=@typescriptSymbols,typescriptDotNotation skipwhite skipempty skipnl
syntax region  typescriptEventFuncCallArg      contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptEventExpression
syntax region  typescriptEventString           contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ contains=typescriptASCII,@events
