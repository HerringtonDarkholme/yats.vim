syntax keyword javascriptCryptoGlobal crypto
if exists("did_javascript_hilink") | HiLink javascriptCryptoGlobal Structure
endif
syntax keyword javascriptCryptoMethod contained subtle getRandomValues nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptCryptoMethod
if exists("did_javascript_hilink") | HiLink javascriptCryptoMethod Keyword
endif
