"Class
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super contained containedin=typescriptMethodBlock

syntax match   typescriptClassName             contained /\v[A-Za-z_$]\k*/
  \ nextgroup=typescriptClassBlock,typescriptClassExtends
  \ skipwhite
syntax match   typescriptClassName             contained /\v[A-Za-z_$]\k*\ze\s*\</
  \ nextgroup=typescriptClassTypeParameter
  \ contained skipwhite

syntax region typescriptClassTypeParameter
  \ start=/</ end=/>/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptClassBlock,typescriptClassExtends
  \ contained
  \ skipwhite

syntax keyword typescriptClassExtends          contained extends implements nextgroup=typescriptClassHeritage skipwhite

syntax match   typescriptClassHeritage         contained /\v(\k|\.)+/
  \ nextgroup=typescriptClassBlock,typescriptClassExtends,typescriptMixinComma
  \ skipwhite
  \ contained
syntax match   typescriptClassHeritage         contained /\v(\k|\.)+\ze\s*\</
  \ nextgroup=typescriptClassTypeArguments
  \ contained skipwhite

syntax region typescriptClassTypeArguments matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=@typescriptType
  \ nextgroup=typescriptClassBlock,typescriptClassExtends,typescriptMixinComma
  \ contained skipwhite

syntax match typescriptMixinComma /,/ contained nextgroup=typescriptClassHeritage skipwhite

syntax region  typescriptClassBlock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptPropertyMemberDeclaration,typescriptMethodDef,typescriptMethodAccessor,typescriptClassSuper,typescriptDecorator,@typescriptComments fold

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
syntax match   typescriptInterfaceName             contained /\k\+/ nextgroup=typescriptObjectType,typescriptInterfaceExtends skipwhite
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

syntax keyword typescriptInterfaceExtends          contained extends nextgroup=typescriptInterfaceHeritage skipwhite

syntax match typescriptInterfaceHeritage contained /\v(\k|\.)+/
  \ nextgroup=typescriptObjectType,typescriptInterfaceComma
  \ skipwhite
syntax match typescriptInterfaceHeritage contained /\v(\k|\.)+\ze\s*\</
  \ nextgroup=typescriptInterfaceTypeArguments
  \ skipwhite

syntax region typescriptInterfaceTypeArguments matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=@typescriptType
  \ nextgroup=typescriptObjectType,typescriptInterfaceComma
  \ contained skipwhite

syntax match typescriptInterfaceComma /,/ contained nextgroup=typescriptInterfaceHeritage skipwhite
