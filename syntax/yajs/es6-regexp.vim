syntax keyword javascriptGlobal RegExp
syntax keyword javascriptRegExpMethod contained exec test nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptRegExpMethod
if exists("did_javascript_hilink") | HiLink javascriptRegExpMethod Keyword
endif
