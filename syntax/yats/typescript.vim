syntax keyword typescriptGlobal Object Function Boolean Symbol Error EvalError InternalError
syntax keyword typescriptGlobal RangeError ReferenceError StopIteration SyntaxError
syntax keyword typescriptGlobal TypeError URIError Number Math Date String RegExp
syntax keyword typescriptGlobal Array Float32Array Float64Array Int16Array Int32Array
syntax keyword typescriptGlobal Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray
syntax keyword typescriptGlobal ParallelArray Map Set WeakMap WeakSet ArrayBuffer
syntax keyword typescriptGlobal DataView JSON Iterator Generator Promise Reflect Proxy
syntax keyword typescriptGlobal Intl arguments
if exists("did_typescript_hilink") | HiLink typescriptGlobal Structure
endif
syntax keyword typescriptGlobalMethod eval fetch uneval isFinite isNaN parseFloat nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod parseInt decodeURI decodeURIComponent encodeURI nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod encodeURIComponent nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptGlobalMethod
if exists("did_typescript_hilink") | HiLink typescriptGlobalMethod Structure
endif
