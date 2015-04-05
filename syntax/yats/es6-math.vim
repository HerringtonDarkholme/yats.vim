syntax keyword javascriptGlobal Math nextgroup=javascriptGlobalMathDot,javascriptFuncCallArg
syntax match   javascriptGlobalMathDot /\./ contained nextgroup=javascriptMathStaticProp,javascriptMathStaticMethod
syntax keyword javascriptMathStaticProp contained E LN10 LN2 LOG10E LOG2E PI SQRT1_2
syntax keyword javascriptMathStaticProp contained SQRT2
if exists("did_javascript_hilink") | HiLink javascriptMathStaticProp Keyword
endif
syntax keyword javascriptMathStaticMethod contained abs acos acosh asin asinh atan nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathStaticMethod contained atan2 atanh cbrt ceil clz32 cos nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathStaticMethod contained cosh exp expm1 floor fround hypot nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathStaticMethod contained imul log log10 log1p log2 max nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathStaticMethod contained min pow random round sign sin nextgroup=javascriptFuncCallArg
syntax keyword javascriptMathStaticMethod contained sinh sqrt tan tanh trunc nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptMathStaticMethod Keyword
endif
