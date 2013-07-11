" to do:
" :139 map w!! not work
" better filetype.vim
" move functions to plugin (or some place better)
"       clean up then integrate/commit my setups for conqueTerm to vim-conque-repl
" <F5> compile (use quickrun instead config quickrun)
" clean up .vimrc
"       clean up configuration for Syntastic

set nocompatible

" ------------------------{Initialize Pathogen} {{{
filetype off  " Needed for vundle, will be turned on after vundle inits
" ===================  pathogen ============================
call pathogen#infect('~/.vim/bundle')
filetype plugin indent on
" }}}

"------------------------- {DISPLAT SETTINGS} -------------------------{{{
"========================================================================
colorscheme wombat256mod
"set background=dark "not working properly

set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket
set hlsearch            " highlight all matches of previous search pattern
set laststatus=2        " always show statusline
set ruler               " show cursor position (in status bar)
set showcmd             " display incomplete commands (in status bar)
set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu
set number              " to do:编辑某语言时才用line number
set wrap                " wrap and displaying on the next line if too long
set lbr                 " 不在单词中断行
set showbreak=↪         " indicate a line is the continuation of a wrapped line

set conceallevel=2      " use conceal feature
set concealcursor=nc    " don't reveal the conceals unless on insert or visual modes

set foldmethod=syntax
"set foldnestmax=1

" When you type the first tab, complete as much as possible, the second tab
" hit will provide a list, the third and subsequent tabs will cycle through
" completion options ( can complete the file without further keys )
set wildmode=longest,list,full
set wildmenu            " completion with menu
" This changes the default display of tab and CR chars in list mode
set listchars=tab:▸\ ,eol:¬

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab
"}}}

"-------------------------- {EDIT SETTINGS} ---------------------------{{{
"========================================================================
"search settings:
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set incsearch           " do incremental searching

"auto indent/newline settings:
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4  " see :h cinoptions-values
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"history_version/backup
set undofile            " stores undo state even when files are closed (in undodir)
set backup              " keep a backup file
set undodir=$HOME/.vimdata/vimundo/         " Save undo data
set backupdir=/tmp                          " keep backup files in /tmp
set dir=/tmp                                " keep swap files in /tmp
set viewdir=$HOME/.vimdata/vimview          " save views "
set history=500         " keep 100 lines of command line history

"Tab/Blank settings:
set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set softtabstop=4
set shiftround          " makes indenting a multiple of shiftwidth
set expandtab           " do not use Tab , use blanks instead

" no fill characters for statuslines
set fillchars+=stl:\ ,stlnc:\ 

"set autoread            " auto read when a file is changed from the outside
set mouse=a             " enables the mouse in all modes

"syntax enable
syntax on
"}}}

"--------------------------- {KEY MAPPINGS} ---------------------------{{{
"========================================================================
" copy(yank) and paste -----------------------------------------------{{{
map <F3> "+y
map <F4> "+p
" }}}
map [9 [(
map [0 [)

" When using marks, all by default mark columns as well --------------{{{
nnoremap <silent> ' `
" }}}
" Switching between windows(buffers) ---------------------------------{{{
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-l> <C-W>l
inoremap <silent> <C-h> <Esc><C-W>h
inoremap <silent> <C-j> <Esc><C-W>j
inoremap <silent> <C-k> <Esc><C-W>k
inoremap <silent> <C-l> <Esc><C-W>l
" }}}
" use arrow keys to resize windows easily resizing -------------------{{{
noremap <silent> <down> <C-W>+
noremap <silent> <up> <C-W>-
nnoremap <silent> <right> <C-W><
nnoremap <silent> <left> <C-W>>
" }}}
" comma always followed by a space -----------------------------------{{{
" inoremap  ,  ,<Right>
" }}}
" j and k will go one line, even if they're wrapped ------------------{{{
nnoremap <silent> j gj
nnoremap <silent> k gk
" }}}
" //        : disable highlighting -------------------------------------{{{
nnoremap <silent> // :nohl<cr>
" }}}
" Y         : Yank to the end of line --------------------------------{{{
noremap <silent> Y y$
" }}}

" <leader>S : Remove trailing whitespace -----------------------------{{{
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>:exe ":echo 'all trailing whitespaces have been removed'"<CR>
" }}}
" <leader>V : Reload Vimrc -------------------------------------------{{{
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo '~/.vimrc reloaded'"<CR>
" }}}

" w!        : sudo write-file ----------------------------------------{{{
" cmap <silent> W! :w !sudo tee %
"!sudo tee % >/dev/null<cr>
map w!! w !sudo tee "%"
" }}}
" <leader>s : Simple sorting -----------------------------------------------------{{{
vnoremap <silent> <leader>s :sort<cr>gv
nnoremap <silent> <leader>s mzvip:sort<cr>`z:delm z<cr>

" }}}

"==now use smartinput instead==
"auto close pairs
" inoremap ( ()<Left>
" inoremap ) <c-r>=ClosePair(')')<CR>
" inoremap [ []<Left>
" inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap { {}<Left>
" inoremap } <c-r>=ClosePair('}')<CR>
"
" vnoremap ( s()<Esc>P<Right>%
" vnoremap [ s[]<Esc>P<Right>%
" vnoremap { s{}<Esc>P<Right>%
" function ClosePair(char)
"     if getline('.')[col('.') - 1]== a:char
"         return "\<Right>"
"     else
"         return a:char
"     endif
" endf


"<F1> to start sketchmap
"map <F1> :call ToggleSketch()<CR>
"}}}

"------------------------------- {MISC} -------------------------------{{{
"========================================================================
" Ignore these files  when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" encoding (specified for chinese)
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencoding=utf-8
set termencoding=utf-8
" }}}

"-------------------------- {PLUGIN SETTINGS} -------------------------{{{
"========================================================================
" ===================  Man/Info ============================{{{
runtime ftplugin/man.vim
set keywordprg=:Man " default <s-K> key
" set keywordprg=:Info " default <s-K> key
"}}}
" ===============  Powerline(beautiful statusline) ========={{{
let g:Powerline_symbols = 'fancy' "use fancy symbols!
"let g:Powerline_cache_file = $HOME . '/tmp/Powerline.cache'
"}}}
" ===================  indent guides  ======================{{{
let g:indent_guides_enable_on_vim_startup = 1   "enable on vim startup
let g:indent_guides_guide_size = 1              "set band width
"list of filetypes to disable indent guides
let g:indent_guides_exclude_filetypes = ['help', 'text', 'markdown', 'calendar', 'rst', 'man']
"disable auto color (which depends on background when under terminal)
"because background is not work properly
let g:indent_guides_auto_colors = 0
" "lightend/darkened 7% at each 2 levels of indent
let g:indent_guides_color_change_percent = 7
augroup IndentGuideColors
    au VimEnter,ColorScheme * hi IndentGuidesOdd  guibg=#262626 ctermbg=235
    au VimEnter,ColorScheme * hi IndentGuidesEven guibg=#3a3a3a ctermbg=237
augroup END
"}}}
" ===================  rainbow parenthsis  ================={{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound     "()
"au Syntax * RainbowParenthesesLoadSquare    "[]
"au Syntax * RainbowParenthesesLoadBraces    "{}
""}}}
" ===================  echofunc  ==========================={{{
"let statusline += %{EchoFuncGetStatusLine()}
"let g:EchoFuncShowOnStatus = 0
""}}}

" ===================  NerdTree ============================{{{
" 设置NerdTree的快捷键为F2
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=24 "NERD_tree 窗口尺寸
"}}}
" ===================  Tag list (ctags) ===================={{{
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close=1
""在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
"设置TagList的快捷键为F9
"map <f9>:TlistToggle
"}}}
" ===================  Tag bar ============================={{{
nmap <F8> :TagbarToggle<CR>
"let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 28
let g:tagbar_sort = 0       " just keep the same order as in file
let g:tagbar_compact = 1    " display in a more compact way
"}}}
" ===================  ConqueTerm  ========================={{{
" Disable features which could make Conque run slowly.
" This includes most terminal colors and some unicode support.
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_CloseOnEnd = 1 "not work?
"}}}
" ===================  miniBufExpl ========================={{{
let g:miniBufExplMapWindowNavArrows = 1 "用<C-箭头键>切换到上下左右窗口中去
let g:miniBufExplMapCTabSwitchBufs = 1  "<C-Tab>切换buff
"}}}

" ===================  onmicppcomplete (C&Cpp complete) ===={{{
map <F7> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
set tags+=~/.vim/cpp_stl_tags "添加C++的STL,库什么生成的tags,使之可用
"在域标识符::后是否自动运行omnicppcomplete给出提示
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1
"}}}
" ===================  SnipMate  ==========================={{{
" Tab for YouCompleteMe , <c-j> for SnipMate
inoremap <c-j> <c-r>=TriggerSnippet()<cr>
snoremap <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
"}}}
" ===================  Tabularize =========================={{{
vnoremap <silent> <Leader>a=> :Tabularize /=><CR>       "\a=>
vnoremap <silent> <Leader>a= :Tabularize /=<CR>         "\a=
vnoremap <silent> <Leader>a, :Tabularize /,\zs<CR>      "\a,
nnoremap <silent> <Leader>a, :Tabularize /,\zs<CR>
vnoremap <silent> <Leader>a: :Tabularize /:\zs<CR>      "\a:
nnoremap <silent> <Leader>a: :Tabularize /:\zs<CR>
vnoremap <silent> <Leader>a<Bar> :Tabularize /<Bar><CR> "\a|
nnoremap <silent> <Leader>a<Bar> :Tabularize /<Bar><CR>

" do align when user entered <Bar>
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
" }}}
" ===================  DoxygenToolkit ======================{{{
let g:DoxygenToolkit_authorName="fuellee"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
" }}}
" ===================  gccsence  ==========================={{{
"let g:gccsenseUseOmniFunc = 1 "哥现在用clang_complete了,不用这个
""}}}
" ===================  clang_complete  ====================={{{
"let g:clang_complete_copen=1
"let g:clang_periodic_quickfix=1
"let g:clang_snippets=1
"let g:clang_close_preview=1
"let g:clang_use_library=1
"let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
"let g:clang_user_options='-IIncludePath'
""}}}
" ===================  Syntastic  =========================={{{
" use YouCompleteMe settings for C/C++ and python syntastic checks
" " -------- Syntastic options for c++ --------
" let g:syntastic_cpp_check_header = 1
" "let g:syntastic_cpp_include_dirs = [ '/usr/include', '/usr/include/c++/4.2.1/', '/opt/local/include', '/usr/local/include', '/opt/local/include/gcc47/c++' ]
" let g:syntastic_cpp_compiler = 'g++'
" let g:syntastic_cpp_compiler_options = '-Wall -std=c++0x'
" let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
" " -------- Syntastic options for python --------
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args = '--ignore="E401,E501,E302,E225"'
" -------- Syntastic options for javascript --------
" let g:syntastic_javascript_checkers = ['jshint']
" -------- Syntastic options for html --------
let g:loaded_html_syntax_checker = 1

let g:syntastic_auto_loc_list=0         "open/close location-list automatically
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php'],
                           \ 'passive_filetypes': ['puppet', 'matlab'] }
"active_filetypes:   check when buffer changed
"passive_filetypes:  don't check unless use :SyntasticCheck "}}}
" ===================  YouCompleteMe  ======================{{{ 
" let g:ycm_confirm_extra_conf = 0 nnoremap <C-S-F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_confirm_extra_conf = 0
"}}}

" ===================  dbext   ============================={{{
" let g:dbext_default_SQLITE_bin = 'sqlite3'
" SQLite
let g:dbext_default_profile_sqlite_coursera = 'type=SQLITE:SQLITE_bin=sqlite3:dbname=/home/fuel/new_datasci_course_materials/assignment2/matrix.db'
let g:dbext_default_profile_sqlite_bayes_network = 'type=SQLITE:SQLITE_bin=sqlite3:dbname=/home/fuel/HW6/bayes_network.db'
" let g:dbext_default_dbname = '/home/fuel/new_datasci_course_materials/assignment2/reuters.db'
" let g:dbext_default_type = 'SQLITE'
"}}}
" ===================  python-mode  ========================{{{
" let g:pymode_lint_ignore = "E501,E401,E302,E225"
let g:pymode_lint_ignore = "E501"
let g:pymode_lint_checker = "pyflakes"       "pyflakes,pep8,mccabe
"}}}
" ===================  haskell-mode  ======================={{{
" configure browser for haskell_doc.vim
let g:haddock_browser = "/opt/google/chrome/google-chrome"
"}}}
"}}}



"========================to clean======================
function! CurlyBracePL_conceal()
    syntax match javaScriptParens / *{$/ skipwhite conceal cchar=:
    syntax match javaScriptParens /} */ skipwhite conceal
    syntax match javaScriptSemicolon /;$/ conceal
    " can't use syntax foldmethod, cause folding regions are changed
    setlocal foldmethod=indent
endfunction
command! -nargs=0 FooBeefy call CurlyBracePL_conceal()



""===============Compile & Run ==========
map <F5> : call Compile_run()<CR>
func! Compile_run()
    exec "w"
    if expand("%:e") == "cpp"
        exec "!g++ % -o %< -Wall -std=c++0x"
        exec "! %:p:r"
    elseif expand("%:e") == "c"
        exec "!gcc % -o %< -Wall"
        exec "! %:p:r"
    elseif expand("%:e") == "py"
        exec "!python %"
    elseif expand("%:e") == "java"
        exec "!javac %"
        exec "!java %<"
    endif
endfunc
"===============Compile ==========
map <C-F5> : call Compile_gcc()<CR>
func! Compile_gcc()
    make "%:p:r"
endfunc

map <F9> : call GDB()<CR><CR>
func! GDB()
    exec "! gnome-terminal --workdir %:p:h -e gdb %:p:r 2>&1 >> /dev/null"
endfunc

"spell check options
" set dictionary=/usr/share/dict/words " for spell checking
" set spellfile=~/.dotfiles/vim/en.utf-8.add " to add words
" set spelllang=en_us " yes, i do speak it
" set spellsuggest=best,10 " only display the 10 best suggestions


map <leader>b :call Run_bash()<CR>
function! Run_bash()
    let b:bash = conque_term#open('/bin/bash', ['split', 'wincmd j'], 0)
endfunction

function! Run_guile()
    let b:guile = conque_term#open('guile', ['split', 'wincmd j'], 0)
endfunction

function! Run_bpython()
    let b:bpython = conque_term#open('bpython', ['split', 'wincmd j'], 0)
endfunction

function! Run_nodejs()
    let b:nodejs = conque_term#open('nodejs', ['split', 'wincmd j'], 0)
endfunction

function! Run_lingo()
    " let b:lingo = conque_term#open('/usr/bin/lingo12', ['split', 'wincmd j'], 0)
    " can't open lingo immediately, errors accur
    let source_file_path = expand("%:p")
    let lingo = conque_term#open('/bin/bash', ['split', 'wincmd j','resize 23'], 0)
    set syntax=lingo
    call lingo.writeln('lingo12')
    echomsg "Take " . source_file_path
    call lingo.writeln("TAKE " . source_file_path)
    call lingo.writeln("GO")
endfunction

" register function for conque_term
function! MyConqueStartup(term)
    " set buffer syntax using the name of the program currently running
    let syntax_associations = {'guile': 'scheme', 'lingo12': 'lingo', 'bash': 'bash', 'ipython': 'python', 'irb': 'ruby', 'nodejs': 'javascript'}
    if has_key(syntax_associations, a:term.program_name)
        execute 'setlocal syntax=' . syntax_associations[a:term.program_name]
    else
        execute 'setlocal syntax=' . a:term.program_name
    endif
endfunction
call conque_term#register_function('after_startup', 'MyConqueStartup')

autocmd FileType javascript call JavaScriptFold() "folding method
