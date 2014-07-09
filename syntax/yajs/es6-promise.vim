syntax keyword javascriptGlobal Promise
syntax keyword javascriptPromiseMethod contained then catch resolve reject all race nextgroup=javascriptFuncArg
syntax cluster props add=javascriptPromiseMethod
if exists("did_javascript_hilink") | HiLink javascriptPromiseMethod Keyword
endif
