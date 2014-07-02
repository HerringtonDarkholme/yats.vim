YAJS: Yet Another JavaScript Syntax
===================================

Yet Another JavaScript Syntax file for Vim. Key differences:

* Use 'javascript' as group name's prefix, not 'javaScript' or 'JavaScript'. Works great with [SyntaxComplete](https://github.com/vim-scripts/SyntaxComplete).
* Reorganize Web API and DOM keywords. Keep increase.
* Wroks perfect with [javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
* Remove old, unused syntax definitions.
* Support several ES6 nex syntax, ex: arrow function `=>`. 

Credits
-------

- Jose Elera, [Enhanced Javascript syntax](http://www.vim.org/scripts/script.php?script_id=3425)
- Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based on their hard work)
- gumnos (From the #vim IRC Channel in Freenode) (Who helped me figured out the crazy Vim Regexes)

Changes
-------

### Version 1.0

- New name
- Refactor Web API and DOM
- Remove old definitions
- Supports partial ES6
- Work with js lib syntax

### Version 0.9

- Add HTML interfaces
- Add CustomEvent
- Add custom element api

### Version 0.8

- Use javascript as group name prefix, which makes SyntaxComplete can work for JavaScript
- Better support for JSDoc
- Support [closure compiler JSDoc annotation](https://developers.google.com/closure/compiler/docs/js-for-compiler)
- Support [Typed Array](http://www.khronos.org/registry/typedarray/specs/latest/) and [File API](http://www.w3.org/TR/FileAPI/)

License
-------

The same as Vim

