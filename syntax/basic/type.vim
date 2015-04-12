" Types
syntax region typescriptTypeParameters matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ contained

syntax match typescriptTypeParameter /[A-Za-z_$]\w*/
  \ nextgroup=typescriptConstraint
  \ contained skipwhite skipnl

syntax keyword typescriptConstraint extends
  \ nextgroup=@typescriptType
  \ contained skipwhite skipnl

syntax region typescriptTypeArguments matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=@typescriptType
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite

syntax cluster typescriptType contains=
  \ @typescriptCompoundType,
  \ @typescriptFunctionType,
  \ typescriptConstructorType

syntax cluster typescriptCompoundType contains=
  \ @typescriptPrimaryType,
  \ typescriptUnionOrArrayType

syntax cluster typescriptPrimaryType contains=
  \ typescriptParenthesizedType,
  \ typescriptPredefinedType,
  \ typescriptTypeReference,
  \ typescriptObjectType,
  \ typescriptTupleType,
  \ typescriptTypeQuery

syntax region typescriptParenthesizedType matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=@typescriptType
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite skipempty

syntax keyword typescriptPredefinedType any number boolean string void
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite skipempty

syntax match typescriptTypeReference /[A-Za-z_$]\w*\(\.[A-Za-z_$]\w*\)*/
  \ nextgroup=typescriptTypeArguments,typescriptUnionOrArrayType
  \ skipwhite contained skipempty

syntax region typescriptObjectType matchgroup=typescriptBraces
  \ start=/{/ end=/}/
  \ contains=@typescriptTypeMember,@typescriptComments
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite fold

syntax cluster typescriptTypeMember contains=
  \ typescriptPropertySignature,
  \ @typescriptCallSignature,
  \ typescriptConstructSignature,
  \ typescriptIndexSignature,
  \ typescriptMethodSignature,
  \ typescripEndColons

syntax region typescriptTupleType matchgroup=typescriptBraces
  \ start=/\[/ end=/\]/
  \ contains=@typescriptType
  \ contained skipwhite oneline

syntax match typescriptUnionOrArrayType /\[\]\||/
  \ nextgroup=@typescriptCompoundType
  \ contains=typescriptUnion
  \ contained skipwhite

syntax match typescriptUnion /|/ containedin=typescriptUnionOrArrayType

syntax cluster typescriptFunctionType contains=typescriptGenericFunc,typescriptFuncType
syntax region typescriptGenericFunc matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptFuncType
  \ containedin=typescriptFunctionType
  \ contained skipwhite skipnl

syntax region typescriptFuncType matchgroup=typescriptParens
  \ start=/(/ end=/)\ze\s*=>/
  \ contains=@typescriptParameterList
  \ nextgroup=typescriptFuncTypeArrow
  \ contained skipwhite skipnl oneline

syntax match typescriptFuncTypeArrow /=>/
  \ nextgroup=@typescriptType
  \ containedin=typescriptFuncType
  \ contained skipwhite skipnl


syntax keyword typescriptConstructorType new
  \ nextgroup=@typescriptFunctionType
  \ contained skipwhite skipnl

syntax keyword typescriptTypeQuery typeof
  \ nextgroup=typescriptTypeReference
  \ contained skipwhite skipnl

syntax region typescriptPropertySignature
  \ start=/[A-Za-z_$'"]\|\d/ end=/;\|$\|:\@=/
  \ contains=@typescriptCallSignature,typescriptNumber,typescriptString,typescriptOptionalMark
  \ nextgroup=typescriptTypeAnnotation
  \ containedin=typescriptTypeMember
  \ contained skipwhite

syntax cluster typescriptCallSignature contains=typescriptGenericCall,typescriptCall
syntax region typescriptGenericCall matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptCall
  \ containedin=typescriptCallSignature
  \ contained skipwhite skipnl
syntax region typescriptCall matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=@typescriptParameterList
  \ nextgroup=typescriptTypeAnnotation
  \ contained skipwhite skipnl

syntax match typescriptTypeAnnotation /:/
  \ nextgroup=@typescriptType
  \ contained skipwhite skipnl

syntax cluster typescriptParameterList contains=
  \ typescriptFuncComma,
  \ typescriptTypeAnnotation,
  \ typescriptAccessibilityModifier,
  \ typescriptOptionalMark,
  \ typescriptRestOrSpread,
  \ typescriptDefaultParam

syntax keyword typescriptAccessibilityModifier public private protected contained

syntax match typescriptDefaultParam /=/
  \ nextgroup=@typescriptExpression
  \ contained skipwhite

syntax keyword typescriptConstructSignature new
  \ nextgroup=@typescriptCallSignature
  \ contained skipwhite

syntax region typescriptIndexSignature matchgroup=typescriptBraces
  \ start=/\[/ end=/\]/
  \ contains=typescriptTypeAnnotation
  \ nextgroup=typescriptTypeAnnotation
  \ contained skipwhite oneline

syntax keyword typescriptAliasKeyword type
  \ nextgroup=typescriptAliasDeclaration
  \ skipwhite skipnl skipempty

syntax region typescriptAliasDeclaration matchgroup=typescriptOpSymbols
  \ start=/ / end=/=/
  \ nextgroup=@typescriptType
  \ contained skipwhite skipnl skipempty

