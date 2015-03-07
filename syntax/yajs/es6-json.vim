syntax keyword javascriptGlobal JSON nextgroup=javascriptGlobalJSONDot,javascriptFuncCallArg
syntax match   javascriptGlobalJSONDot /\./ contained nextgroup=javascriptJSONStaticMethod
syntax keyword javascriptJSONStaticMethod contained parse stringify nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptJSONStaticMethod Keyword
endif
