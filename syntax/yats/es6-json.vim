syntax keyword typescriptGlobal JSON nextgroup=typescriptGlobalJSONDot,typescriptFuncCallArg
syntax match   typescriptGlobalJSONDot /\./ contained nextgroup=typescriptJSONStaticMethod
syntax keyword typescriptJSONStaticMethod contained parse stringify nextgroup=typescriptFuncCallArg
if exists("did_typescript_hilink") | HiLink typescriptJSONStaticMethod Keyword
endif
