syntax keyword javascriptGlobal Headers Request Response
syntax keyword javascriptGlobalMethod fetch nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptGlobalMethod
if exists("did_javascript_hilink") | HiLink javascriptGlobalMethod Structure
endif
syntax keyword javascriptHeadersMethod contained append delete get getAll has set nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptHeadersMethod
if exists("did_javascript_hilink") | HiLink javascriptHeadersMethod Keyword
endif
syntax keyword javascriptRequestProp contained method url headers context referrer
syntax keyword javascriptRequestProp contained mode credentials cache
syntax cluster props add=javascriptRequestProp
if exists("did_javascript_hilink") | HiLink javascriptRequestProp Keyword
endif
syntax keyword javascriptRequestMethod contained clone nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptRequestMethod
if exists("did_javascript_hilink") | HiLink javascriptRequestMethod Keyword
endif
syntax keyword javascriptResponseProp contained type url status statusText headers
syntax cluster props add=javascriptResponseProp
if exists("did_javascript_hilink") | HiLink javascriptResponseProp Keyword
endif
syntax keyword javascriptResponseMethod contained clone nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptResponseMethod
if exists("did_javascript_hilink") | HiLink javascriptResponseMethod Keyword
endif
