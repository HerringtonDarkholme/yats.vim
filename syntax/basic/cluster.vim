"Block VariableStatement EmptyStatement ExpressionStatement IfStatement IterationStatement ContinueStatement BreakStatement ReturnStatement WithStatement LabelledStatement SwitchStatement ThrowStatement TryStatement DebuggerStatement
syntax cluster typescriptStatement             contains=typescriptBlock,typescriptVariable,@typescriptExpression,typescriptConditional,typescriptRepeat,typescriptBranch,typescriptLabel,typescriptStatementKeyword,typescriptTry,typescriptExceptions,typescriptDebugger,typescriptExport,typescriptInterfaceKeyword,typescriptEnum
syntax cluster typescriptPrimitive                 contains=typescriptString,typescriptTemplate,typescriptRegexpString,typescriptNumber,typescriptBoolean,typescriptNull,typescriptArray
syntax cluster typescriptEventTypes            contains=typescriptEventString,typescriptTemplate,typescriptNumber,typescriptBoolean,typescriptNull
" syntax cluster typescriptOps                   contains=typescriptLogicSymbols,typescriptOperator
" syntax cluster typescriptOps                   contains=typescriptOperator
syntax cluster typescriptExpression
  \ contains=@typescriptPrimitive,typescriptFuncKeyword,
  \ typescriptIdentifier,typescriptIdentifierName,typescriptOperator,typescriptUnaryOp,typescriptArrowFuncDef,typescriptParenExp,typescriptRegexpString,typescriptGlobal,jsxRegion,typescriptAsyncFuncKeyword,typescriptClassKeyword,typescriptTypeCast

syntax cluster typescriptValue
  \ contains=@typescriptExpression,typescriptObjectLiteral
syntax cluster typescriptEventExpression       contains=typescriptArrowFuncDef,typescriptParenExp,@typescriptValue,typescriptRegexpString,@typescriptEventTypes,typescriptOperator,typescriptGlobal,jsxRegion
