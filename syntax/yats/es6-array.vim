syntax keyword javascriptGlobal Array nextgroup=javascriptGlobalArrayDot,javascriptFuncCallArg
syntax match   javascriptGlobalArrayDot /\./ contained nextgroup=javascriptArrayStaticMethod
syntax keyword javascriptArrayStaticMethod contained from isArray of nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptArrayStaticMethod Keyword
endif
syntax keyword javascriptArrayMethod contained concat copyWithin entries every fill nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained filter find findIndex forEach indexOf nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained join keys lastIndexOf map pop push nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained reduce reduceRight reverse shift slice nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained some sort splice toLocaleString toSource nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained toString unshift nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptArrayMethod
if exists("did_javascript_hilink") | HiLink javascriptArrayMethod Keyword
endif
