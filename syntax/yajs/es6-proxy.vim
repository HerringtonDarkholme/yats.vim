syntax keyword javascriptGlobal Proxy
syntax keyword javascriptProxyAPI contained getOwnPropertyDescriptor getOwnPropertyNames
syntax keyword javascriptProxyAPI contained defineProperty deleteProperty freeze seal
syntax keyword javascriptProxyAPI contained preventExtensions has hasOwn get set enumerate
syntax keyword javascriptProxyAPI contained iterate ownKeys apply construct
if exists("did_javascript_hilink") | HiLink javascriptProxyAPI Keyword
endif
