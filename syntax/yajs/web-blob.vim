syntax keyword javascriptBOMFileMethod contained createObjectURL revokeObjectURL
syntax cluster props add=javascriptBOMFileMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMFileMethod Type
endif
syntax keyword javascriptBOMBlobMethod contained append getBlob getFile
syntax cluster props add=javascriptBOMBlobMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMBlobMethod Type
endif
