syntax keyword javascriptGlobal Intl
syntax keyword javascriptIntlMethod contained Collator DateTimeFormat NumberFormat nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptIntlMethod
if exists("did_javascript_hilink") | HiLink javascriptIntlMethod Keyword
endif
