syntax cluster typescriptNoReserved contains=
  \ @typescriptStrings,
  \ @typescriptDocs,
  \ @typescriptComments,
  \ shellbang,
  \ typescriptObjectLiteral,
  \ typescriptObjectLabel,
  \ typescriptClassBlock,
  \ typescriptAmbientClassBody,
  \ typescriptMethodDef,
  \ typescriptMethodName,
  \ @typescriptType,
  \ typescriptCall,
  \ typescriptAmbientModuleBlock,
  \ typescriptPropertySignature

"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved break case catch const continue
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved debugger default delete do else export
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved extends finally for if
"import,typescriptRegexpString,typescriptPropertyName
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved in instanceof let new return super
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved static switch throw try typeof
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved void while with yield

syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved implements package protected
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved interface private public abstract boolean
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved byte char double final float goto int
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved long native short synchronized transient
syntax keyword typescriptReserved containedin=ALLBUT,@typescriptNoReserved volatile

syntax keyword typescriptReserved containedin=ALLBUT,typescriptAmbientClassDeclaration,@typescriptNoReserved class
syntax keyword typescriptReserved containedin=ALLBUT,typescriptAmbientVariableDeclaration,@typescriptNoReserved var
syntax keyword typescriptReserved containedin=ALLBUT,
  \ @typescriptNoReserved,typescriptAmbientFunctionDeclaration function
