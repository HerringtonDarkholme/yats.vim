syntax keyword typescriptGlobal Promise nextgroup=typescriptGlobalPromiseDot,typescriptFuncCallArg
syntax match   typescriptGlobalPromiseDot /\./ contained nextgroup=typescriptPromiseStaticMethod
syntax keyword typescriptPromiseStaticMethod contained resolve reject all race nextgroup=typescriptFuncCallArg
if exists("did_typescript_hilink") | HiLink typescriptPromiseStaticMethod Keyword
endif
syntax keyword typescriptPromiseMethod contained then catch nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptPromiseMethod
if exists("did_typescript_hilink") | HiLink typescriptPromiseMethod Keyword
endif
