syntax keyword typescriptGlobal Intl
syntax keyword typescriptIntlMethod contained Collator DateTimeFormat NumberFormat nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptIntlMethod
if exists("did_typescript_hilink") | HiLink typescriptIntlMethod Keyword
endif
