set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'airblade/vim-gitgutter'
" Bundle 'chazy/cscope_maps'
Bundle "gcmt/surfer.vim"
Bundle 'Blackrush/vim-gocode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shutnik/jshint2.vim'
Bundle 'bling/vim-airline'
Bundle 'godlygeek/tabular'
Bundle 'guns/ultisnips'
Bundle 'hewes/unite-gtags'
Bundle 'jnwhiteh/vim-golang'
Bundle 'junegunn/vim-easy-align'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rhysd/vim-clang-format'
Bundle 'rstacruz/sparkup'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-vinegar'
Bundle 'tranngocthachs/gtags-cscope-vim-plugin'
Bundle 'vimwiki/vimwiki'
Bundle 'kien/ctrlp.vim'
Bundle 'yanagiis/cmake.vim'
" vim-scripts repos
Bundle 'Align'
Bundle 'L9'
" Bundle 'AutoComplPop'
Bundle 'DoxygenToolkit.vim'
Bundle 'ShowTrailingWhitespace'
Bundle 'StripWhiteSpaces'
Bundle 'matchit.zip'
Bundle 'DirDiff.vim'
Bundle 'armasm'
Bundle 'ifdef-highlighting'
Bundle 'gtags.vim'
" non github repos

filetype plugin indent on     " required!

if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono 9
endif

" encoding
set enc=utf-8

" General Setting
" {
    syntax on
    filetype plugin on
    filetype indent on

    set nu
    set nocompatible
    set autoread
    set cursorline

    " Search
    set hlsearch
    set incsearch
    set ignorecase

    " Indent
    set autoindent
    set smartindent
    set cindent

    " Close backup
    set nobackup
    set nowritebackup

    " others
    set showmatch         " Cursor shows matching ) and }
    set showmode          " Show current mode
    set autoread

    " Status line
    set laststatus=2

    " color
    colorscheme molokai
    set t_Co=256
    hi PmenuSel ctermfg=black ctermbg=lightgray

    " Highlight trailing whitespace and lines longer than 80 columns.
    set colorcolumn=81

    set noswapfile
" }

" TAB and Backspace
" {
    set expandtab
    set smarttab          " insert tabs on the start of a line according to context

    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set bs=2
" }

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
    au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

augroup filetype
    au! BufRead,BufNewFile *CMakeLists* set filetype=cmake
augroup END

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Setting of Makefile {
autocmd FileType make set noexpandtab
" }

" Setting of CMake {
autocmd FileType cmake set noexpandtab
" }

" Setting of Python {
" autocmd FileType python set noexpandtab
autocmd FileType python set sw=4
autocmd FileType python set ts=4
" }

" Show Git diff in window split when commiting
autocmd FileType gitcommit DiffGitCached | wincmd p

" \g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" omnicomplete
set completeopt=menu,menuone

" Plugin Setting {

    " Clang complete
    let g:clang_auto_select = 0
    let g:clang_close_preview = 0
    let g:clang_complete_auto = 0
    let g:clang_complete_copen = 1
    let g:clang_complete_macros = 1
    let g:clang_complete_patterns = 0
    let g:clang_conceal_snippets = 1
    let g:clang_exec = 'clang'
    let g:clang_hl_errors = 1
    let g:clang_library_path = '/usr/lib'
    let g:clang_periodic_quickfix = 0
    let g:clang_snippets = 1
    let g:clang_snippets_engine = 'ultisnips'
    let g:clang_use_library = 1

    " Doxygen
    let g:load_doxygen_syntax=1

    " Latex
    set grepprg=grep\ -nH\ $*
    let g:tex_flavor = "latex"

    " Tagbar
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_width = 30

    " EasyMotion
    let g:EasyMotion_leader_key = ','

    " vim-golang
    set rtp+=/usr/share/go/misc/vim

    " GTags
    set csprg=gtags-cscope
    let GtagsCscope_Auto_Load = 1
    let GtagsCscope_Auto_Map = 1
    let GtagsCscope_Keep_Alive = 1
    let GtagsCscope_Absolute_Path = 0

    " gotags
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
        \ }

    " NERDTree
    let NERDTreeIgnore = [
                \ '\.pyc$',
                \ '\.o$'
    \ ]

    " CtrlP
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|so|dll|o|pyc)$',
                \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
                \ }

    " surfer.vim
    let g:surfer_ctags_prg = "ctags"
    let g:surfer_smart_case = 1
    let g:surfer_line_format = [" @ {file}:", "{line}  ", "({kind})  ", "class: {class}"]

    " neocomplete
    let g:neocomplete#enable_at_startup = 1
	if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_overwrite_completefunc = 1
	let g:neocomplete#force_omni_input_patterns.c =
	      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
	let g:neocomplete#force_omni_input_patterns.cpp =
	      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
	let g:neocomplete#force_omni_input_patterns.objc =
	      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
	let g:neocomplete#force_omni_input_patterns.objcpp =
	      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

    " ClangFormat
    let g:clang_format#style_options = {
        \ "AlignTrailingComments" : "true",
        \ "AllowAllParametersOfDeclarationOnNextLine" : "false",
        \ "AllowShortFunctionsOnASingleLine" : "false",
        \ "AllowShortIfStatementsOnASingleLine" : "false",
        \ "AllowShortLoopsOnASingleLine" : "false",
        \ "AlwaysBreakBeforeMultilineStrings" : "true",
        \ "BinPackParameters" : "true",
        \ "BreakBeforeBinaryOperators" : "true",
        \ "BreakBeforeBraces" : "Allman",
        \ "BreakBeforeTernaryOperators" : "true",
        \ "IndentWidth" : "4",
        \ "SpaceBeforeAssignmentOperators" : "true",
        \ "SpaceBeforeParens" : "ControlStatements",
        \ "SpaceInEmptyParentheses" : "false",
        \ "Standard" : "Cpp11",
        \ "UseTab" : "Never",
        \ "MaxEmptyLinesToKeep" : "1",
        \ }

    " Unite
    let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_enable_start_insert = 1
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
" }

" Shortcut mappings
" {
    " allow multiple indentation/deindexntation in visual mode
    vnoremap < <gv
    vnoremap > >gv
    vnoremap <silent> <Enter> :EasyAlign<cr>

    "   Force saving files that require root permission
    cmap w!! %!sudo tee > /dev/null %
    noremap <silent><Leader>/ :nohls<CR>

    "   Protect your fat fingers from the evils of <F1>
    nmap <F1> <Esc>
    "   F2 is used to toggle NERDTree
    nmap <silent> <F2> :NERDTreeToggle<CR>
    "   F3 is used to toggle Tagbar
    nmap <silent> <F3> :TagbarToggle<CR>
    "   F4 is used to toggle Gundo
    nmap <F4> :GundoToggle<CR>

    nnoremap <space>/ :Unite grep:.<cr>
    nnoremap <space>s :Unite -quick-match buffer<cr>

    " Easier navigation between split windows
    nmap <c-j> <c-w>j
    nmap <c-k> <c-w>k
    nmap <c-h> <c-w>h
    nmap <c-l> <c-w>l

    " Next/previous in quickfix list
    nmap <c-n> :cnext<CR>
    nmap <c-m> :cprevious<CR>

    nmap <c-o> :Surf<CR>

    autocmd Filetype c,cpp nnoremap <F7> :make CC='~/.vim/bundle/clang_complete/bin/cc_args.py gcc' CXX='~/.vim/bundle/clang_complete/bin/cc_args.py g++'.<CR>

    " nnoremap <F10> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    " nnoremap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs reset<CR>
    nnoremap <F12> :Dox<CR>
" }
