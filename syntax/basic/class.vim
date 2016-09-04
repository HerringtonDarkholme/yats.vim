"Class
syntax keyword typescriptAbstract              abstract nextgroup=typescriptClassKeyword,typescriptPropertySignature skipwhite skipnl
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super

syntax match   typescriptClassName             contained /\v[A-Za-z_$]\k*/
  \ nextgroup=typescriptClassBlock,typescriptClassExtends
  \ skipwhite skipnl
syntax match   typescriptClassName             contained /\v[A-Za-z_$]\k*\ze\s*\</
  \ nextgroup=typescriptClassTypeParameter
  \ contained skipwhite

syntax region typescriptClassTypeParameter
  \ start=/</ end=/>/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptClassBlock,typescriptClassExtends
  \ contained
  \ skipwhite skipnl

syntax keyword typescriptClassExtends          contained extends implements nextgroup=typescriptClassHeritage skipwhite skipnl

syntax match   typescriptClassHeritage         contained /\v(\k|\.|\(|\))+/
  \ nextgroup=typescriptClassBlock,typescriptClassExtends,typescriptMixinComma
  \ contains=typescriptExpression
  \ skipwhite skipnl
  \ contained
syntax match   typescriptClassHeritage         contained /\v(\k|\.)+\ze\s*\</
  \ nextgroup=typescriptClassTypeArguments
  \ contained skipwhite

syntax region typescriptClassTypeArguments matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=@typescriptType
  \ nextgroup=typescriptClassBlock,typescriptClassExtends,typescriptMixinComma
  \ contained skipwhite skipnl

syntax match typescriptMixinComma /,/ contained nextgroup=typescriptClassHeritage skipwhite skipnl

syntax region  typescriptClassBlock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptPropertyMemberDeclaration,typescriptMethodDef,typescriptClassSuper,typescriptDecorator,typescriptAbstract,typescriptAsyncFuncKeyword,@typescriptComments fold

syntax keyword typescriptClassStatic static nextgroup=
  \ typescriptMethodDef,
  \ @typescriptMemberDeclaration
  \ skipwhite contained

syntax cluster typescriptPropertyMemberDeclaration contains=
  \ typescriptClassStatic,
  \ typescriptAccessibilityModifier,
  \ typescriptMemberVariableDeclaration

syntax match typescriptMemberVariableDeclaration /[A-Za-z_$]\k*\s*:.*\($\|;\)/
  \ contains=typescriptTypeAnnotation
  \ contained

syntax match typescriptMemberVariableDeclaration /[A-Za-z_$]\k*\s*=/
  \ nextgroup=@typescriptExpression
  \ contained skipwhite skipnl

syntax match typescriptMemberVariableDeclaration /[A-Za-z_$]\k*:.\+=>\@!/
  \ contains=typescriptTypeAnnotation
  \ nextgroup=@typescriptExpression
  \ contained skipwhite skipnl

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

syntax keyword typescriptInterfaceExtends          contained extends nextgroup=typescriptInterfaceHeritage skipwhite skipnl

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

syntax match typescriptInterfaceComma /,/ contained nextgroup=typescriptInterfaceHeritage skipwhite skipnl
