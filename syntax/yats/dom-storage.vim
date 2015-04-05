syntax keyword javascriptDOMStorage contained sessionStorage localStorage
if exists("did_javascript_hilink") | HiLink javascriptDOMStorage Keyword
endif
syntax keyword javascriptDOMStorageProp contained length
syntax cluster props add=javascriptDOMStorageProp
if exists("did_javascript_hilink") | HiLink javascriptDOMStorageProp Keyword
endif
syntax keyword javascriptDOMStorageMethod contained getItem key setItem removeItem nextgroup=javascriptFuncCallArg
syntax keyword javascriptDOMStorageMethod contained clear nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptDOMStorageMethod
if exists("did_javascript_hilink") | HiLink javascriptDOMStorageMethod Keyword
endif
