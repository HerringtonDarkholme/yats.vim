syntax keyword javascriptGlobal Symbol
syntax keyword javascriptSymProp contained create hasInstance isConcatSpreadable isRegExp
syntax keyword javascriptSymProp contained iterator toPrimitive toStringTag unscopables
syntax cluster props add=javascriptSymProp
if exists("did_javascript_hilink") | HiLink javascriptSymProp Keyword
endif
syntax keyword javascriptSymMethod contained for keyFor
syntax cluster props add=javascriptSymMethod
if exists("did_javascript_hilink") | HiLink javascriptSymMethod Keyword
endif
