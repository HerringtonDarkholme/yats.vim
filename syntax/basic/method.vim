syntax keyword typescriptConstructor           contained constructor
  \ nextgroup=@typescriptCallSignature
  \ skipwhite skipempty

syntax keyword typescriptMethodAccessor        contained get set

syntax match typescriptMembers /\v[A-Za-z_$]\k*(\?|\!)?/
  \ nextgroup=typescriptTypeAnnotation,@typescriptCallSignature
  \ contained skipwhite
