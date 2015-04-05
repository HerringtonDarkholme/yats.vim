syntax keyword javascriptServiceWorkerProp contained controller ready
syntax cluster props add=javascriptServiceWorkerProp
if exists("did_javascript_hilink") | HiLink javascriptServiceWorkerProp Keyword
endif
syntax keyword javascriptServiceWorkerMethod contained register getRegistration nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptServiceWorkerMethod
if exists("did_javascript_hilink") | HiLink javascriptServiceWorkerMethod Keyword
endif
syntax keyword javascriptGlobal Cache
syntax keyword javascriptCacheMethod contained match matchAll add addAll put delete nextgroup=javascriptFuncCallArg
syntax keyword javascriptCacheMethod contained keys nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptCacheMethod
if exists("did_javascript_hilink") | HiLink javascriptCacheMethod Keyword
endif
