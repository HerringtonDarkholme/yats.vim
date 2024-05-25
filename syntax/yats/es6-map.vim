syntax keyword typescriptGlobal containedin=typescriptIdentifierName Map WeakMap
syntax keyword typescriptES6MapProp contained size
syntax cluster props add=typescriptES6MapProp
hi def link typescriptES6MapProp Keyword
syntax keyword typescriptES6MapMethod contained clear delete entries forEach get has nextgroup=typescriptFuncCallArg
syntax keyword typescriptES6MapMethod contained keys set values nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptES6MapMethod
hi def link typescriptES6MapMethod Keyword
