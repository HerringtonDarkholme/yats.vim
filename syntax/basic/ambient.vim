syntax keyword typescriptAmbientDeclaration declare nextgroup=@typescriptAmbients
  \ skipwhite skipempty skipnl

syntax cluster typescriptAmbients contains=
  \ typescriptAmbientVariableDeclaration,
  \ typescriptAmbientFunctionDeclaration,
  \ typescriptAmbientClassDeclaration,
  \ typescriptEnumKeyword,typescriptEnum,
  \ typescriptAmbientModuleDeclaration

syntax region typescriptAmbientVariableDeclaration matchgroup=typescriptVariable
  \ start=/var\>\|let\>/ end=/\ze;\|$/
  \ contains=typescriptTypeAnnotation
  \ contained oneline

syntax region typescriptAmbientFunctionDeclaration matchgroup=typescriptFuncKeyword
  \ start=/function\>/ end=/\ze;\|$/
  \ contains=@typescriptCallSignature
  \ contained

syntax region typescriptAmbientClassDeclaration matchgroup=typescriptClassKeyword start=/class\>/ end=/\ze{/
  \ contains=typescriptClassExtends
  \ nextgroup=typescriptAmbientClassBody
  \ contained skipwhite skipnl skipempty

syntax region  typescriptAmbientClassBody matchgroup=typescriptBraces
  \ start=/{/ end=/}/
  \ contains=typescriptAmbientPropertyMemberDeclaration,typescriptAmbientModifier,typescriptIndexSignature,@typescriptComments
  \ contained fold

syntax keyword typescriptAmbientModifier public private protected
  \ nextgroup=typescriptAmbientPropertyMemberDeclaration
  \ contained
  \ skipwhite

syntax region typescriptAmbientPropertyMemberDeclaration
  \ start=/\v[A-Za-z_$]\k*/ end=/;\|$\|\ze:/
  \ nextgroup=typescriptTypeAnnotation
  \ contains=typescriptAmbientCtor,typescriptAmbientName,@typescriptCallSignature
  \ contained skipwhite

syntax region typescriptAmbientPropertyMemberDeclaration matchgroup=typescriptAmbientModifier
  \ start=/\v(get|set)\ze\s+[A-Za-z_$]\k*/ end=/;\|$\|\ze:/
  \ nextgroup=typescriptTypeAnnotation
  \ contains=typescriptAmbientName,@typescriptCallSignature
  \ contained skipwhite

syntax region typescriptAmbientPropertyMemberDeclaration matchgroup=typescriptAmbientModifier
  \ start=/\vstatic\ze\s+[A-Za-z_$]\k*/ end=/;\|$\|\ze:/
  \ nextgroup=typescriptTypeAnnotation
  \ contains=typescriptAmbientName,@typescriptCallSignature
  \ contained skipwhite

syntax region typescriptAmbientPropertyMemberDeclaration matchgroup=typescriptAmbientModifier
  \ start=/\v(get|set)\s+static\ze\s+[A-Za-z_$]\k*/ end=/;\|$\|\ze:/
  \ nextgroup=typescriptTypeAnnotation
  \ contains=typescriptAmbientName,@typescriptCallSignature
  \ contained skipwhite

syntax match   typescriptAmbientName /\k\+/ contained
syntax keyword typescriptAmbientCtor constructor contained

syntax region typescriptAmbientModuleDeclaration matchgroup=typescriptExport start=/module\>/ end=/\ze{/
  \ contains=typescriptString
  \ nextgroup=typescriptAmbientModuleBlock
  \ contained


syntax region typescriptAmbientModuleBlock start=/{/ end=/}/
  \ contains=@typescriptAmbients,typescriptInterfaceKeyword,typescriptImportDef,typescriptAmbientExport,@typescriptComments
  \ contained fold

syntax keyword typescriptAmbientExport export
  \ nextgroup=@typescriptAmbients
  \ contained skipwhite
