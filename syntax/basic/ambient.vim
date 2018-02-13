syntax keyword typescriptAmbientDeclaration declare nextgroup=@typescriptAmbients
  \ skipwhite skipempty

syntax cluster typescriptAmbients contains=
  \ typescriptVariable,
  \ typescriptFuncKeyword,
  \ typescriptClassKeyword,
  \ typescriptAbstract,
  \ typescriptEnumKeyword,typescriptEnum,
  \ typescriptModule
