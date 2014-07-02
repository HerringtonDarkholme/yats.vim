syntax keyword javascriptBOMHistoryProp contained length current next previous state
syntax cluster props add=javascriptBOMHistoryProp
if exists("did_javascript_hilink") | HiLink javascriptBOMHistoryProp Type
endif
syntax keyword javascriptBOMHistoryMethod contained back forward go pushState replaceState nextgroup=javascriptFuncArg
syntax cluster props add=javascriptBOMHistoryMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMHistoryMethod Type
endif
