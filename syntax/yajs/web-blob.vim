syntax keyword javascriptGlobal Blob BlobBuilder File FileReader FileReaderSync
syntax keyword javascriptBOMFileMethod contained readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncArg
syntax keyword javascriptBOMFileMethod contained readAsDataURL readAsText
syntax cluster props add=javascriptBOMFileMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileMethod Type
endif
syntax keyword javascriptBOMFileReaderMethod contained error readyState result
syntax cluster props add=javascriptBOMFileReaderMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileReaderMethod Type
endif
syntax keyword javascariptBOMFileReaderMethod contained abort readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncArg
syntax keyword javascariptBOMFileReaderMethod contained readAsDataURL readAsText
syntax cluster props add=javascariptBOMFileReaderMethod
if exists("did_javascript_hilink") | HiLink javascariptBOMFileReaderMethod Type
endif
syntax keyword javascriptBOMFileListMethod contained item
syntax cluster props add=javascriptBOMFileListMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileListMethod Type
endif
syntax keyword javascriptBOMBlobMethod contained append getBlob getFile
syntax cluster props add=javascriptBOMBlobMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMBlobMethod Type
endif
syntax keyword javascriptBOMURLMethod contained createObjectURL revokeObjectURL
syntax cluster props add=javascriptBOMURLMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMURLMethod Type
endif
