YATS: Yet Another TypeScript Syntax
===================================

[![Build Status](https://travis-ci.org/HerringtonDarkholme/yats.vim.svg?branch=master)](https://travis-ci.org/HerringtonDarkholme/yats.vim)

![screenshot](https://raw.githubusercontent.com/HerringtonDarkholme/yats.vim/master/screenshot.png)

Yet Another TypeScript Syntax file for Vim, adapted from [YAJS](https://github.com/othree/yajs.vim).
Key differences:

* Exuberant Highlighting. The most elaborate or byzatine syntax highlighting for TypeScript.
* Bundled with snippets for UltiSnips!
* Builtin Support for tagbar!
* Use 'typescript' as group name's prefix, not 'typeScript' nor 'TypeScript'. Works great with [SyntaxComplete](https://github.com/vim-scripts/SyntaxComplete).
* Inherit Web API and DOM keywords from YAJS
* Syntax fold. Fold long code block, semantically!
* Remove old, unused syntax definitions.

Config
----
* `let g:yats_host_keyword = 1`: configure yats to highlight host specific keywords like `addEventListener`. Default is 1. Set it 0 to turn off highlighting.

* Note: `set re=0` explicitly in your vimrc. Old regexp engine will incur performance issues for yats and old engine is usually turned on by other plugins.

Concealing Characters
----

You can customize concealing characters, if your font provides the glyph you want, by defining one or more of the following variables:

```vim
let g:typescript_conceal_function             = "ƒ"
let g:typescript_conceal_null                 = "ø"
let g:typescript_conceal_undefined            = "¿"
let g:typescript_conceal_this                 = "@"
let g:typescript_conceal_return               = "⇚"
let g:typescript_conceal_prototype            = "¶"
let g:typescript_conceal_super                = "Ω"
```

You can enable concealing within VIM with:

```vim
set conceallevel=1
```

OR if you wish to toggle concealing you may wish to bind a command such as the following which will map `<LEADER>l` (leader is usually the `\` key) to toggling conceal mode:

```vim
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
```



Credits
-------

- [othree](https://github.com/othree), whose YAJS is the most up-to-date js syntax for Vim
- Jose Elera, [Enhanced Javascript syntax](http://www.vim.org/scripts/script.php?script_id=3425)
- Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based on their hard work)
- gumnos (From the #vim IRC Channel in Freenode) (Who helped me figured out the crazy Vim Regexes)

License
-------

The same as Vim

