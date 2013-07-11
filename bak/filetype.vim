autocmd Syntax javascript set syntax=jquery   " JQuery syntax support

autocmd Syntax vim,sh set foldmethod=marker     "vimfile folding method
autocmd Syntax vim set keywordprg=:help

autocmd Filetype vim map <F5> :source %<CR>


" use ghc functionality for haskell files (haskell-mode)
au Bufenter *.hs compiler ghc

" special language support
" OBS: If using the Rik's octave.vim syntax,     replace matlab by octave.
autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
autocmd FileType octave let b:match_words = '\<if\>\|\<while\>\|\<for\>\|\<switch\>:' .
       \ s:conditionalEnd . ',\<if\>:\<elseif\>:\<else\>:' . s:conditionalEnd


" Octave syntax
augroup filetypedetect
    au! BufRead,BufNewFile *.m,*.oct set filetype=matlab "octave
augroup END
" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype octave
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

" lingo
augroup filetypedetect
    au! BufRead,BufNewFile *.ls,*.lng,*.ltf,*.lingo set filetype=lingo
    au  Filetype lingo map <silent> <F5> :call Run_lingo()<CR>
augroup END

au! BufRead,BufNewFile *.pig set filetype=pig "pig

" conceal for λ
au VimEnter * syntax keyword Statement lambda conceal cchar=λ
au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2
