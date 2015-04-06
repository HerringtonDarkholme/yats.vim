syntax keyword typescriptGlobal Array nextgroup=typescriptGlobalArrayDot,typescriptFuncCallArg
syntax match   typescriptGlobalArrayDot /\./ contained nextgroup=typescriptArrayStaticMethod
syntax keyword typescriptArrayStaticMethod contained from isArray of nextgroup=typescriptFuncCallArg
if exists("did_typescript_hilink") | HiLink typescriptArrayStaticMethod Keyword
endif
syntax keyword typescriptArrayMethod contained concat copyWithin entries every fill nextgroup=typescriptFuncCallArg
syntax keyword typescriptArrayMethod contained filter find findIndex forEach indexOf nextgroup=typescriptFuncCallArg
syntax keyword typescriptArrayMethod contained join keys lastIndexOf map pop push nextgroup=typescriptFuncCallArg
syntax keyword typescriptArrayMethod contained reduce reduceRight reverse shift slice nextgroup=typescriptFuncCallArg
syntax keyword typescriptArrayMethod contained some sort splice toLocaleString toSource nextgroup=typescriptFuncCallArg
syntax keyword typescriptArrayMethod contained toString unshift nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptArrayMethod
if exists("did_typescript_hilink") | HiLink typescriptArrayMethod Keyword
endif
