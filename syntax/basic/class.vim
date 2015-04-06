"Class
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super
syntax match   typescriptClassName             contained /\k\+/ nextgroup=typescriptClassBlock,typescriptClassExtends skipwhite
syntax keyword typescriptClassExtends          contained extends nextgroup=typescriptClassName skipwhite
syntax region  typescriptClassBLock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=typescriptMethodName,typescriptMethodAccessor,typescriptClassStatic
syntax keyword typescriptClassStatic           contained static nextgroup=typescriptMethodName,typescriptMethodAccessor skipwhite


