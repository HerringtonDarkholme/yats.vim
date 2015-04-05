syntax keyword javascriptGlobal Promise nextgroup=javascriptGlobalPromiseDot,javascriptFuncCallArg
syntax match   javascriptGlobalPromiseDot /\./ contained nextgroup=javascriptPromiseStaticMethod
syntax keyword javascriptPromiseStaticMethod contained resolve reject all race nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptPromiseStaticMethod Keyword
endif
syntax keyword javascriptPromiseMethod contained then catch nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptPromiseMethod
if exists("did_javascript_hilink") | HiLink javascriptPromiseMethod Keyword
endif
