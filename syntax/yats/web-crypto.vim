syntax keyword javascriptCryptoGlobal crypto
if exists("did_javascript_hilink") | HiLink javascriptCryptoGlobal Structure
endif
syntax keyword javascriptSubtleCryptoMethod contained encrypt decrypt sign verify nextgroup=javascriptFuncCallArg
syntax keyword javascriptSubtleCryptoMethod contained digest nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptSubtleCryptoMethod
if exists("did_javascript_hilink") | HiLink javascriptSubtleCryptoMethod Keyword
endif
syntax keyword javascriptCryptoProp contained subtle
syntax cluster props add=javascriptCryptoProp
if exists("did_javascript_hilink") | HiLink javascriptCryptoProp Keyword
endif
syntax keyword javascriptCryptoMethod contained getRandomValues nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptCryptoMethod
if exists("did_javascript_hilink") | HiLink javascriptCryptoMethod Keyword
endif
