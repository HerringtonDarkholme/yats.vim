syntax keyword typescriptGlobal console
syntax keyword typescriptConsoleMethod count dir error group groupCollapsed groupEnd nextgroup=typescriptFuncCallArg
syntax keyword typescriptConsoleMethod info log time timeEnd trace warn nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptConsoleMethod
if exists("did_typescript_hilink") | HiLink typescriptConsoleMethod Structure
endif
