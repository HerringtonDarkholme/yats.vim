syntax keyword javascriptGlobal RegExp nextgroup=javascriptGlobalRegExpDot,javascriptFuncCallArg
syntax match   javascriptGlobalRegExpDot /\./ contained nextgroup=javascriptRegExpStaticProp
syntax keyword javascriptRegExpStaticProp contained lastIndex
if exists("did_javascript_hilink") | HiLink javascriptRegExpStaticProp Keyword
endif
syntax keyword javascriptRegExpProp contained global ignoreCase multiline source sticky
syntax cluster props add=javascriptRegExpProp
if exists("did_javascript_hilink") | HiLink javascriptRegExpProp Keyword
endif
syntax keyword javascriptRegExpMethod contained exec test nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptRegExpMethod
if exists("did_javascript_hilink") | HiLink javascriptRegExpMethod Keyword
endif
