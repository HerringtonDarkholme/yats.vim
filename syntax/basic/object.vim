syntax region  typescriptObjectLiteral         matchgroup=typescriptBraces
  \ start=/{/ end=/}/
  \ contains=@typescriptComments,typescriptObjectLabel,typescriptPropertyName,typescriptMethodDef,typescriptComputedPropertyName,@typescriptValue
  \ fold contained

syntax match   typescriptObjectLabel           contained /\(^\|,\|{\)\@<=\s*\zs\k\+\_s*:/he=e-1 nextgroup=@typescriptValue,@typescriptStatement skipwhite skipempty
syntax region  typescriptPropertyName   contained start=/\(^\|,\|{\)\@<=\s*\zs\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\_s*:\|$/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptPropertyName    contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\ze(/ nextgroup=typescriptFuncArg skipwhite skipempty oneline
syntax region  typescriptComputedPropertyName  contained matchgroup=typescriptPropertyName start=/\(^\|,\|{\)\@<=\s*\zs\[/rs=s+1 end=/]\_s*:/he=e-1 contains=@typescriptExpression nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptComputedProperty      contained matchgroup=typescriptProperty start=/\(^\|,\|{\)\@<=\s*\zs\[/rs=s+1 end=/]/he=e-1 contains=@typescriptExpression nextgroup=@typescriptValue skipwhite skipempty
" Value for object, statement for label statement
syntax match typescriptRestOrSpread /\.\.\./ contained
syntax match typescriptObjectSpread /\.\.\./ contained containedin=typescriptObjectLiteral,typescriptArray nextgroup=@typescriptExpression
