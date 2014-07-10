syntax keyword javascriptGlobal RegExp
syntax keyword javascriptRegExpMethod contained exec test
syntax cluster props add=javascriptRegExpMethod
if exists("did_javascript_hilink") | HiLink javascriptRegExpMethod Keyword
endif
