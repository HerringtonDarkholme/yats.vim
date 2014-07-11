syntax keyword javascriptGlobal JSON
syntax keyword javascriptJSONMethod contained parse stringify nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptJSONMethod
if exists("did_javascript_hilink") | HiLink javascriptJSONMethod Keyword
endif
