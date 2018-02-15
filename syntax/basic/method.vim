syntax keyword typescriptConstructor           contained constructor
  \ nextgroup=@typescriptCallSignature
  \ skipwhite skipempty

syntax keyword typescriptMethodAccessor        contained get set

syntax match typescriptMember /\v[A-Za-z_$]\k*(\?|\!)?/
  \ nextgroup=typescriptTypeAnnotation,@typescriptCallSignature
  \ contained skipwhite

syntax cluster typescriptPropertyMemberDeclaration contains=
  \ typescriptClassStatic,
  \ typescriptAccessibilityModifier,
  \ typescriptMethodAccessor,
  \ @typescriptMembers
  " \ typescriptMemberVariableDeclaration

syntax cluster typescriptMembers contains=typescriptMember,typescriptStringMember,typescriptComputedMember

syntax keyword typescriptClassStatic static
  \ nextgroup=@typescriptMembers
  \ skipwhite contained

syntax keyword typescriptAccessibilityModifier public private protected readonly contained

syntax region  typescriptStringMember   contained
  \ start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1/
  \ nextgroup=typescriptTypeAnnotation,@typescriptCallSignature
  \ skipwhite skipempty

syntax region  typescriptComputedMember   contained matchgroup=typescriptProperty
  \ start=/\[/rs=s+1 end=/]/
  \ contains=@typescriptValue
  \ nextgroup=typescriptTypeAnnotation,@typescriptCallSignature
  \ skipwhite skipempty
