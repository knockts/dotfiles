if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    call dein#add(expand('~/.vim/dein/repos/github.com/Shougo/dein.vim'))
    "call dein#add('Shougo/deoplete.nvim')
    "call dein#add('zchee/deoplete-clang')
    "call dein#add('tweekmonster/deoplete-clang2')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('scrooloose/syntastic')
    call dein#add('itchyny/lightline.vim')
    call dein#add('tomasr/molokai')
    call dein#add('dff9th/nerdtree')
    call dein#add('rhysd/vim-clang-format')
    call dein#add('kana/vim-operator-user')
    call dein#add('justmao945/vim-clang')
    "call dein#add('vim-scripts/DoxygenToolkit.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neocomplete')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('previm/previm')
    call dein#add('tyru/open-browser.vim')
    "call dein#add('Rykka/riv.vim')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('aklt/plantuml-syntax')
    call dein#add('h1mesuke/vim-alignta')
    "call dein#add('kannokanno/previm')
    call dein#add('embear/vim-localvimrc')
    call dein#add('pangloss/vim-javascript')
    call dein#end()

    call dein#save_state()
endif
filetype plugin indent on           " ファイルタイプ別設定実行
syntax enable                       " 構文ハイライト

set nobackup	                    " バックアップ作らない
set noswapfile	                    " swpファイル作らない
set undofile                        " vim終了後もundoできるように
set undodir=~/.vim/undodir          " vim終了後もundoできるように
set t_Co=256                        " 256色カラー表示
set number                          " 行番号表示
set encoding=utf-8                  " vim上のバッファで用いる文字コード
set fenc=utf-8                      " 書き込み時の文字コード
set fileencodings=utf-8,euc-jp,sjis " 左優先で入力の文字コード判定後fencに設定
set fencs=utf-8,euc-jp,sjis " 左優先で入力の文字コード判定後fencに設定
set backspace=indent,eol,start      " BSで削除可能に
" unset because cursor move is heavy
"set cursorline                      " 現在の行を強調表示
set virtualedit=onemore             " 行末+1カーソル移動可能に
set showmatch                       " 対応括弧を強調表示
set laststatus=2                    " ステータスラインを常に表示
set wildmode=list:longest           " コマンドラインの補完
set incsearch                       " 検索順次ヒット
set wrapscan                        " 検索順次ヒットループ
set hlsearch                        " 検索ヒットハイライト
set expandtab                       " Tab文字を半角スペースに
set tabstop=4                       " 入力ファイル中の既存Tabの空白幅
set softtabstop=4                   " キー入力したTabの空白幅
set shiftwidth=4                    " インデント時の空白幅
set smartindent                     " c言語ベースのインデント方式
set clipboard+=unnamed
set ambiwidth=double                " draw multibyte character with 2-wide

" color settings
"" comment color
autocmd ColorScheme * highlight Comment ctermfg=28 guifg=#008800
"" colorring gray after 80 column
execute "set colorcolumn=" . join(range(81, 9999), ',')
colorscheme molokai

"set iskeyword-=_                   " 単語扱いの文字集合修正
set vb t_vb=                        " ビープ音オフ

" 改行時の自動コメント挿入の無効化方法
" ~/.vim/after/plugin/common.vimに以下を記載
" autocmd FileType * setlocal formatoptions-=r
" autocmd FileType * setlocal formatoptions-=o

" move 
nnoremap j gj
nnoremap k gk

" tab settings
nnoremap tt :tabnew<CR>
nnoremap tp :tab sp<CR>
nnoremap <C-h> gT
"" substitute for Ctrl-H over tmux
nnoremap <BS> gT
nnoremap <C-l> gt
nnoremap <C-w><C-h> :tabmove -1<CR>
"" substitute for Ctrl-H over tmux
nnoremap <C-w><BS> :tabmove -1<CR>
nnoremap <C-w><C-l> :tabmove +1<CR>
" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
" NerdTreeショートカット
nnoremap <silent><C-n> :NERDTreeToggle<CR>
" clang-formatでインデント実行
vmap f= <Plug>(operator-clang-format)


" clang-format setting
" google style with indent width 4
let g:clang_format#style_options = {
            \ "BasedOnStyle" : 'Google',
            \ "TabWidth" : 4,
            \ "IndentWidth" : 4,
            \ "UseTab" : 'Never',
            \ "AccessModifierOffset" : -4,
            \ "Standard" : "C++11",
            \ }

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1

" previm settings
nnoremap <silent> <C-p> :PrevimOpen<CR>
" 
"let g:previm_enable_realtime = 1

" alignta
vnoremap \| :Alignta \|<CR>
vnoremap // :Alignta <- //<CR>
vnoremap { :Alignta {<CR>

" riv settings
"let g:riv_disable_folding = 1

" vim-localvimrc setting
let g:localvimrc_sandbox = 0    " sandboxから設定を読み込まない (未理解)
let g:localvimrc_ask = 0        " .lvimrcを確認なしで読み込む

" deoplete setting
"let g:deoplete#enable_at_startup = 1    " boot at runiing vim
"let g:deoplete#sources#clang#libclang_path = '/usr/lib64/llvm/libclang.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" not expand tab to spaces on Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" vim-syntastic settings
let g:syntastic_cpp_compiler="gcc"
let g:syntastic_cpp_compiler_options=" -std=c++11" 
