"Class
syntax keyword typescriptClassKeyword          class nextgroup=typescriptClassName skipwhite
syntax keyword typescriptClassSuper            super containedin=typescriptClassBlock contained
syntax match   typescriptClassName             contained /\k\+/ nextgroup=typescriptClassBlock,typescriptClassExtends skipwhite
syntax keyword typescriptClassExtends          contained extends nextgroup=typescriptClassName skipwhite
syntax region  typescriptClassBlock            contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=typescriptMethodName,typescriptMethodAccessor,typescriptClassStatic,typescriptClassSuper
syntax keyword typescriptClassStatic           contained static nextgroup=typescriptMethodName,typescriptMethodAccessor skipwhite


