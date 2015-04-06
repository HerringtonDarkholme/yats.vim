"Class
syntax keyword typescriptClassKeyword          class interface nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super
syntax match   typescriptClassName             contained /\k\+/ nextgroup=typescriptClassBlock,typescriptClassExtends skipwhite
syntax keyword typescriptClassExtends          contained extends implements nextgroup=typescriptClassName skipwhite
syntax region  typescriptClassBlock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=typescriptMethodName,typescriptMethodAccessor,typescriptClassStatic,typescriptClassSuper
syntax keyword typescriptClassStatic           contained static nextgroup=typescriptMethodName,typescriptMethodAccessor skipwhite


