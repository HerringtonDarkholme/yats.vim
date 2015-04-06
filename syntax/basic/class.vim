"Class
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super
syntax match   typescriptClassName             contained /\k\+/ nextgroup=typescriptClassBlock,typescriptClassExtends skipwhite
syntax keyword typescriptClassExtends          contained extends implements nextgroup=typescriptClassName skipwhite
syntax region  typescriptClassBlock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=typescriptMethodDef,typescriptMethodAccessor,typescriptClassStatic,typescriptClassSuper,@typescriptPropertyMemberDeclaration
syntax keyword typescriptClassStatic           contained static nextgroup=typescriptMethodName,typescriptMethodAccessor skipwhite

syntax cluster typescriptPropertyMemberDeclaration contains=
  \ typescriptAccessibilityModifier,
  \ typescriptMemberVariableDeclaration

syntax match typescriptMemberVariableDeclaration /[A-Za-z_$]\k*\s*:.*\($\|;\)/
  \ contains=typescriptTypeAnnotation
  \ contained

syntax keyword typescriptInterfaceKeyword          interface nextgroup=typescriptInterfaceName skipwhite
syntax match   typescriptInterfaceName             contained /\k\+/ nextgroup=typescriptObjectType,typescriptInterfaceExtends skipwhite
syntax keyword typescriptInterfaceExtends          contained extends nextgroup=typescriptInterfaceName skipwhite
