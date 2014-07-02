syntax keyword javascriptXHRProp contained onreadystatechange readyState response
syntax keyword javascriptXHRProp contained responseText responseType responseXML status
syntax keyword javascriptXHRProp contained statusText timeout ontimeout upload withCredentials
syntax cluster props add=javascriptXHRProp
if exists("did_javascript_hilink") | HiLink javascriptXHRProp Type
endif
syntax keyword javascriptXHRMethod contained abort getAllResponseHeaders getResponseHeader nextgroup=javascriptFuncArg
syntax keyword javascriptXHRMethod contained open overrideMimeType send setRequestHeader nextgroup=javascriptFuncArg
syntax cluster props add=javascriptXHRMethod
if exists("did_javascript_hilink") | HiLink javascriptXHRMethod Type
endif
