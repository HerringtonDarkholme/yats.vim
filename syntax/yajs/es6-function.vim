syntax keyword javascriptGlobal Function
syntax keyword javascriptFunctionMethod contained apply bind call nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptFunctionMethod
if exists("did_javascript_hilink") | HiLink javascriptFunctionMethod Keyword
endif
