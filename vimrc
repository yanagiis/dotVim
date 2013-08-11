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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Rip-Rip/clang_complete'
Bundle 'bling/vim-airline'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'airblade/vim-gitgutter'
Bundle 'chazy/cscope_maps'
Bundle 'godlygeek/tabular'
Bundle 'guns/ultisnips'
Bundle 'jnwhiteh/vim-golang'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'yanagiis/cmake.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'dart-lang/dart-vim-plugin'
Bundle 'vimwiki/vimwiki'
Bundle 'Blackrush/vim-gocode'
" Bundle 'tranngocthachs/gtags-cscope-vim-plugin'
" vim-scripts repos
Bundle 'Align'
Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'AutoComplPop'
Bundle 'DoxygenToolkit.vim'
Bundle 'ShowTrailingWhitespace'
Bundle 'StripWhiteSpaces'
Bundle 'grep.vim'
Bundle 'matchit.zip'
" Bundle 'gtags.vim'
" non github repos

filetype plugin indent on     " required!

if has("gui_running")
    set guifont=Source\ Code\ Pro 9
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
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" Plugin Setting {

    " Clang complete
    augroup c,cpp
        let g:clang_auto_select = 1
        let g:clang_complete_macros = 1
        let g:clang_complete_auto = 0
        let g:clang_complete_copen = 1
        let g:clang_hl_errors = 1
        let g:clang_periodic_quickfix = 0
        let g:clang_snippets = 0
        let g:clang_use_library = 1
        let g:clang_complete_patterns = 1
        let g:clang_library_path = '/usr/lib'
        let g:clang_conceal_snippets = 0
        let g:clang_exec = 'clang'
        let g:clang_snippetsengine = 'ultisnips'
    augroup END


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

    " youcompleteme
    "let g:ycm_key_list_select_completion = ['<Down>']
    "let g:ycm_key_list_previous_completion = ['<Up>']
    "let g:UltiSnipsExpandTrigger = '<tab>'
    "let g:UltiSnipsJumpForwardTrigger="<tab>"
    "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    " GTags
    "set csprg=gtags-cscope
    "let GtagsCscope_Auto_Load = 1
    "let GtagsCscope_Auto_Map = 1
    "let GtagsCscope_Ignore_Case = 1
    "let GtagsCscope_Keep_Alive = 1
" }

" Shortcut mappings
" {
    " allow multiple indentation/deindexntation in visual mode
    vnoremap < <gv
    vnoremap > >gv

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

    " Easier navigation between split windows
    nmap <c-j> <c-w>j
    nmap <c-k> <c-w>k
    nmap <c-h> <c-w>h
    nmap <c-l> <c-w>l

    " Next/previous in quickfix list
    nmap <c-n> :cnext<CR>
    nmap <c-m> :cprevious<CR>

    autocmd Filetype c,cpp nnoremap <F7> :make CC='~/.vim/bundle/clang_complete/bin/cc_args.py gcc' CXX='~/.vim/bundle/clang_complete/bin/cc_args.py g++'.<CR>

    nnoremap <silent><F10> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    nnoremap <silent><F11> :! find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
                            \: !cscope -b -i cscope.file -f cscope.out<CR>
                            \:cs kill -1<CR>:cs add cscope.out<CR>
    " nnoremap <F10> :!gtags<CR>
    " nnoremap <F11> :!global -u<CR>
    nnoremap <F12> :Dox<CR>
" }
