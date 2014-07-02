syntax keyword javascriptGlobal Object Function Boolean Symbol Error EvalError InternalError
syntax keyword javascriptGlobal RangeError ReferenceError StopIteration SyntaxError
syntax keyword javascriptGlobal TypeError URIError Number Math Date String RegExp
syntax keyword javascriptGlobal Array Float32Array Float64Array Int16Array Int32Array
syntax keyword javascriptGlobal Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray
syntax keyword javascriptGlobal ParallelArray Map Set WeakMap WeakSet ArrayBuffer
syntax keyword javascriptGlobal DataView JSON Iterator Generator Promise Reflect Proxy
syntax keyword javascriptGlobal Intl argumrnts
if exists("did_javascript_hilink") | HiLink javascriptGlobal Structure
endif
syntax keyword javascriptGlobalMethod eval uneval isFinite isNaN parseFloat parseInt nextgroup=javascriptFuncArg
syntax keyword javascriptGlobalMethod decodeURI decodeURIComponent encodeURI encodeURIComponent nextgroup=javascriptFuncArg
syntax cluster props add=javascriptGlobalMethod
if exists("did_javascript_hilink") | HiLink javascriptGlobalMethod Structure
endif
