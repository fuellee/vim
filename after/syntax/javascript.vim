if !has('conceal') || &enc != 'utf-8'
    finish
endif

" Operators {{{
" syn match javaScriptOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
" syn match javaScriptOperator	"<<\|>>\|&&\|||\|++\|--\|->"
" syn match javaScriptOperator	"[.!~*&%<>^|=,+-]"
" syn match javaScriptOperator	"/[^/*=]"me=e-1
" syn match javaScriptOperator	"/$"
" syn match javaScriptOperator    "&&\|||"
" 
" hi link javaScriptOperator		Operator
" }}}

" vim: set fenc=utf-8:
syntax keyword javaScriptFunction function conceal cchar=λ

" syntax match jsNiceOperator "\<function\>" conceal cchar=λ

syntax match jsNiceOperator "=\ze[^=<>]" conceal cchar=←
syntax match jsNiceOperator "->" conceal cchar=→
syntax match jsNiceOperator "\<sum\>" conceal cchar=∑
syntax match jsNiceOperator "\<product\>" conceal cchar=∏ 
syntax match jsNiceOperator "\<sqrt\>" conceal cchar=√ 
syntax match jsNiceOperator "\<pi\>" conceal cchar=π

" comparison operator -----------{{{
syntax match jsNiceOperator "===" conceal cchar=≡
syntax match jsNiceOperator "!=" conceal cchar=≠
syntax match jsNiceOperator "!==" conceal cchar=≢
syntax match jsNiceOperator "<=\ze[^<]" conceal cchar=≤
syntax match jsNiceOperator ">=\ze[^>]" conceal cchar=≥
" }}}
" binary/uniary operators -------{{{
syntax match jsNiceOperator "&&" conceal cchar=∧
syntax match jsNiceOperator "||" conceal cchar=∨
syntax match jsNiceOperator "=>" conceal cchar=⇒
syntax match jsNiceOperator ">>" conceal cchar=» "≫
syntax match jsNiceOperator "=\zs<<" conceal cchar=« "≪

syntax match jsNiceoperator "++" conceal cchar=⧺
syntax match jsNiceoperator "!\ze[^=<>]" conceal cchar=¬
" }}}
" return break continue goto ----{{{
syntax keyword javaScriptStatement return conceal cchar=⏎
syntax keyword javaScriptBranch	   break conceal cchar=↴
syntax keyword javaScriptBranch	   Statement continue conceal cchar=↰
syntax keyword javaScriptReserved  goto conceal cchar=↷
" }}}

syntax match jsNiceOperator "\<undefined\>" conceal cchar=⊥

" syntax keyword javaScriptIdentifier var conceal
" syntax match javaScriptBlankAfterVar /var\@<= */ conceal "not work"

function! FooBeefy()
    syntax match javaScriptParens / *{$/ skipwhite conceal cchar=:
    syntax match javaScriptParens /} */ skipwhite conceal
    syntax match javaScriptSemicolon /;$/ conceal
    " can't use syntax foldmethod, cause folding regions are changed
    setlocal foldmethod=indent
endfunction


hi link jsNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
