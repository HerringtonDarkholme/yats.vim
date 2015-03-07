syntax keyword javascriptGlobal URL nextgroup=javascriptGlobalURLDot,javascriptFuncCallArg
syntax match   javascriptGlobalURLDot /\./ contained nextgroup=javascriptURLStaticMethod
syntax keyword javascriptGlobal Blob BlobBuilder File FileReader FileReaderSync URLUtils
syntax keyword javascriptFileMethod contained readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncCallArg
syntax keyword javascriptFileMethod contained readAsDataURL readAsText nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptFileMethod
if exists("did_javascript_hilink") | HiLink javascriptFileMethod Keyword
endif
syntax keyword javascriptFileReaderProp contained error readyState result
syntax cluster props add=javascriptFileReaderProp
if exists("did_javascript_hilink") | HiLink javascriptFileReaderProp Keyword
endif
syntax keyword javascriptFileReaderMethod contained abort readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncCallArg
syntax keyword javascriptFileReaderMethod contained readAsDataURL readAsText nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptFileReaderMethod
if exists("did_javascript_hilink") | HiLink javascriptFileReaderMethod Keyword
endif
syntax keyword javascriptFileListMethod contained item nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptFileListMethod
if exists("did_javascript_hilink") | HiLink javascriptFileListMethod Keyword
endif
syntax keyword javascriptBlobMethod contained append getBlob getFile nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptBlobMethod
if exists("did_javascript_hilink") | HiLink javascriptBlobMethod Keyword
endif
syntax keyword javascriptURLUtilsProp contained hash host hostname href origin password
syntax keyword javascriptURLUtilsProp contained pathname port protocol search searchParams
syntax keyword javascriptURLUtilsProp contained username
syntax cluster props add=javascriptURLUtilsProp
if exists("did_javascript_hilink") | HiLink javascriptURLUtilsProp Keyword
endif
syntax keyword javascriptURLStaticMethod contained createObjectURL revokeObjectURL nextgroup=javascriptFuncCallArg
if exists("did_javascript_hilink") | HiLink javascriptURLStaticMethod Keyword
endif
