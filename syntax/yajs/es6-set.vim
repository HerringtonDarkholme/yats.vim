syntax keyword javascriptGlobal Set WeakSet
syntax keyword javascriptES6SetProp contained size
syntax cluster props add=javascriptES6SetProp
if exists("did_javascript_hilink") | HiLink javascriptES6SetProp Keyword
endif
syntax keyword javascriptES6SetMethod contained add clear delete entries forEach has nextgroup=javascriptFuncCallArg
syntax keyword javascriptES6SetMethod contained values nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptES6SetMethod
if exists("did_javascript_hilink") | HiLink javascriptES6SetMethod Keyword
endif
