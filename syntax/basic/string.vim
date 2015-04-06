"Syntax in the JavaScript code
" syntax match   typescriptASCII                 contained /\\\d\d\d/
syntax region  typescriptTemplateSubstitution  contained matchgroup=typescriptTemplateSB start=/\${/ end=/}/ contains=typescriptTemplateSBlock,typescriptTemplateSString
syntax region  typescriptTemplateSBlock        contained start=/{/ end=/}/ contains=typescriptTemplateSBlock,typescriptTemplateSString transparent
syntax region  typescriptTemplateSString       contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ extend contains=typescriptTemplateSStringRB transparent
syntax match   typescriptTemplateSStringRB     /}/ contained
syntax region  typescriptString                start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax region  typescriptTemplate              start=/`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/ contains=typescriptTemplateSubstitution nextgroup=@typescriptSymbols skipwhite skipempty
" syntax match   typescriptTemplateTag           /\k\+/ nextgroup=typescriptTemplate
