syntax keyword javascriptGlobal console
syntax keyword javascriptConsoleMethod count dir error group groupCollapsed groupEnd nextgroup=javascriptFuncCallArg
syntax keyword javascriptConsoleMethod info log time timeEnd trace warn nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptConsoleMethod
if exists("did_javascript_hilink") | HiLink javascriptConsoleMethod Structure
endif
