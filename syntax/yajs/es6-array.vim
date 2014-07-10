syntax keyword javascriptGlobal Array
syntax keyword javascriptArrayMethod contained from isArray of concat copyWithin entries nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained every fill filter find findIndex forEach nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained indexOf join keys lastIndexOf map pop nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained push reduce reduceRight reverse shift nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained slice some sort splice toLocaleString nextgroup=javascriptFuncCallArg
syntax keyword javascriptArrayMethod contained toSource toString unshift
syntax cluster props add=javascriptArrayMethod
if exists("did_javascript_hilink") | HiLink javascriptArrayMethod Keyword
endif
