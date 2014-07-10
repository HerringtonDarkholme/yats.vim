syntax keyword javascriptGlobal Blob BlobBuilder File FileReader FileReaderSync URL
syntax keyword javascriptGlobal URLUtils
syntax keyword javascriptBOMFileMethod contained readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMFileMethod contained readAsDataURL readAsText
syntax cluster props add=javascriptBOMFileMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileMethod Keyword
endif
syntax keyword javascriptBOMFileReaderMethod contained error readyState result
syntax cluster props add=javascriptBOMFileReaderMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileReaderMethod Keyword
endif
syntax keyword javascariptBOMFileReaderMethod contained abort readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncCallArg
syntax keyword javascariptBOMFileReaderMethod contained readAsDataURL readAsText
syntax cluster props add=javascariptBOMFileReaderMethod
if exists("did_javascript_hilink") | HiLink javascariptBOMFileReaderMethod Keyword
endif
syntax keyword javascriptBOMFileListMethod contained item
syntax cluster props add=javascriptBOMFileListMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileListMethod Keyword
endif
syntax keyword javascriptBOMBlobMethod contained append getBlob getFile
syntax cluster props add=javascriptBOMBlobMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMBlobMethod Keyword
endif
syntax keyword javascriptBOMURLUtilProp contained hash host hostname href origin password
syntax keyword javascriptBOMURLUtilProp contained pathname port protocol search searchParams
syntax keyword javascriptBOMURLUtilProp contained username
syntax cluster props add=javascriptBOMURLUtilProp
if exists("did_javascript_hilink") | HiLink javascriptBOMURLUtilProp Keyword
endif
syntax keyword javascriptBOMURLMethod contained createObjectURL revokeObjectURL
syntax cluster props add=javascriptBOMURLMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMURLMethod Keyword
endif
