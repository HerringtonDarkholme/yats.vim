syntax keyword javascriptGlobal Math
syntax keyword javascriptMathProp contained E LN10 LN2 LOG10E LOG2E PI SQRT1_2 SQRT2
syntax cluster props add=javascriptMathProp
if exists("did_javascript_hilink") | HiLink javascriptMathProp Keyword
endif
syntax keyword javascriptMathMethod contained abs acos acosh asin asinh atan atan2 nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathMethod contained atanh cbrt ceil clz32 cos cosh exp expm1 nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathMethod contained floor fround hypot imul log log10 log1p nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathMethod contained log2 max min pow random round sign sin nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathMethod contained sinh sqrt tan tanh trunc
syntax cluster props add=javascriptMathMethod
if exists("did_javascript_hilink") | HiLink javascriptMathMethod Keyword
endif
