syntax keyword typescriptConstructor           contained constructor
  \ nextgroup=@typescriptCallSignature
  \ skipwhite skipempty

syntax keyword typescriptMethodAccessor        contained get set

syntax match typescriptMembers /\v[A-Za-z_$]\k*(\?|\!)?/
  \ nextgroup=typescriptTypeAnnotation,@typescriptCallSignature
  \ contained skipwhite

syntax cluster typescriptPropertyMemberDeclaration contains=
  \ typescriptClassStatic,
  \ typescriptAccessibilityModifier,
  \ typescriptMethodAccessor,
  \ typescriptMembers
  " \ typescriptMemberVariableDeclaration

syntax keyword typescriptClassStatic static
  \ nextgroup=typescriptMembers
  \ skipwhite contained

syntax keyword typescriptAccessibilityModifier public private protected readonly contained
