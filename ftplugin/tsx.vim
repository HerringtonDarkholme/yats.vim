" modified from mxw/vim-jsx from html.vim
if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let s:tsx_match_words = '(:),\[:\],{:},<:>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(/\@<!>\|$\):<\@<=/\1>'
  let b:match_words = exists('b:match_words')
    \ ? b:match_words . ',' . s:tsx_match_words
    \ : s:tsx_match_words
endif

set suffixesadd+=.tsx
