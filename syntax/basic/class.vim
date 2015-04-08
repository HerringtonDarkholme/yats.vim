"Class
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super contained containedin=typescriptMethodBlock
syntax match   typescriptClassName             contained /\v(\k|\.)+/ nextgroup=typescriptClassBlock,typescriptClassExtends skipwhite
syntax keyword typescriptClassExtends          contained extends implements nextgroup=typescriptClassName skipwhite
syntax region  typescriptClassBlock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptPropertyMemberDeclaration,typescriptMethodDef,typescriptMethodAccessor,typescriptClassSuper,@typescriptComments

syntax keyword typescriptClassStatic static nextgroup=
  \ typescriptMethodDef,
  \ typescriptMethodAccessor,
  \ @typescriptMemberDeclaration
  \ skipwhite contained

syntax cluster typescriptPropertyMemberDeclaration contains=
  \ typescriptClassStatic,
  \ typescriptAccessibilityModifier,
  \ typescriptMemberVariableDeclaration

syntax match typescriptMemberVariableDeclaration /[A-Za-z_$]\k*\s*:.*\($\|;\)/
  \ contains=typescriptTypeAnnotation
  \ contained

syntax match typescriptMemberVariableDeclaration /[A-Za-z_$]\k*:\?\s*=/
  \ contains=typescriptTypeAnnotation
  \ nextgroup=@typescriptExpression
  \ contained skipwhite

syntax keyword typescriptInterfaceKeyword          interface nextgroup=typescriptInterfaceName skipwhite
syntax match   typescriptInterfaceName             contained /\k\+\ze\s*</
  \ nextgroup=typescriptInterfaceTypeParameter
  \ contained
  \ skipwhite
syntax region typescriptInterfaceTypeParameter
  \ start=/</ end=/>/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptObjectType,typescriptInterfaceExtends
  \ contained
  \ skipwhite
syntax match   typescriptInterfaceName             contained /\k\+\ze\_s*{/ nextgroup=typescriptObjectType,typescriptInterfaceExtends skipwhite
syntax keyword typescriptInterfaceExtends          contained extends nextgroup=typescriptInterfaceName skipwhite
