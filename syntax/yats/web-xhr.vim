syntax keyword javascriptXHRGlobal XMLHttpRequest
if exists("did_javascript_hilink") | HiLink javascriptXHRGlobal Structure
endif
syntax keyword javascriptXHRProp contained onreadystatechange readyState response
syntax keyword javascriptXHRProp contained responseText responseType responseXML status
syntax keyword javascriptXHRProp contained statusText timeout ontimeout upload withCredentials
syntax cluster props add=javascriptXHRProp
if exists("did_javascript_hilink") | HiLink javascriptXHRProp Keyword
endif
syntax keyword javascriptXHRMethod contained abort getAllResponseHeaders getResponseHeader nextgroup=javascriptFuncCallArg
syntax keyword javascriptXHRMethod contained open overrideMimeType send setRequestHeader nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptXHRMethod
if exists("did_javascript_hilink") | HiLink javascriptXHRMethod Keyword
endif
