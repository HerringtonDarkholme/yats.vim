syntax keyword javascriptBOMFileMethod contained readAsArrayBuffer readAsBinaryString nextgroup=javascriptFuncArg
syntax keyword javascriptBOMFileMethod contained readAsDataURL readAsText
syntax cluster props add=javascriptBOMFileMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileMethod Type
endif
syntax keyword javascriptBOMBlobMethod contained append getBlob getFile
syntax cluster props add=javascriptBOMBlobMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMBlobMethod Type
endif
syntax keyword javascriptBOMURLMethod contained createObjectURL revokeObjectURL
syntax cluster props add=javascriptBOMURLMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMURLMethod Type
endif
