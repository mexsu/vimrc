" General
set nocompatible 	" Don't try to be vi compatible
set encoding=utf-8
set showcmd		" Show commands
"set cursorline		" Highlight line you are on
syntax on

set number		" Show normal line numbers
set relativenumber	" Show numbers relative to line you are on

set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=++	" Wrap-broken line prefix
set textwidth=125	" Line wrap (number of cols)
set wildmode=longest,list,full

set belloff=all		" Disable bell
"set visualbell		" Use visual bell (no beeping)

set ruler		" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"set mouse=a		" Enable mouse
"set noswapfile		" disable swap file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add the status bar
set laststatus=2            " set the bottom status bar

function! ModifiedColor()
        if &mod == 1
	        hi statusline guibg=White ctermfg=8 guifg=OrangeRed4 ctermbg=15
		    else
		            hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15
			        endif
				endfunction

				au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
    " default the statusline when entering Vim
    hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15

    " Formats the statusline
    set statusline=%f                           " file name
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%y      "filetype
    set statusline+=%h      "help file flag
    set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
    "modified flag

    set statusline+=%r      "read only flag

    set statusline+=\ %=                        " align left
    set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
    set statusline+=\ Col:%c                    " current column
    set statusline+=\ Buf:%n                    " Buffer number
    set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
"""""""""""""""""""""""""""""""""""""End"Status"Bar""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set hlsearch 	" Highlight all search results
set incsearch	" Searches for strings incrementally
set ignorecase	" Always case-insensitive
set smartcase	" Enable smart-case search
set showmatch	" Highlight matching brace

" Indent
set autoindent    " Auto-indent new lines
set smartindent   " Enable smart-indent
set shiftwidth=4  " Number of auto-indent spaces

" Visualize tab end of line
set list
set listchars=tab:›\ ,extends:>,precedes:<,eol:¬

" Unbind Q (it used to take you into Ex mode)
nnoremap Q <nop>

" Unbind Shift+K, it's previously used for opening manual or help or something
map <S-k> <Nop>

" Move between lines and wrapped-broken lines
noremap k gk
noremap j gj

" Change shortcut from Ctrl+w+hjkl to Ctrl+hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make splits to open at the bottom and the right
set splitbelow
set splitright

" Clear search highlight with Enter after searching,n-search next,N-go to previous
nnoremap <CR> :noh<CR><CR>

" Move line up or down with arrow keys in normal mode
nnoremap <up> ddkP
nnoremap <down> ddp

" Spell-check set to F6
nnoremap <F6> :setlocal spell! spelllang=en_us<CR>

" To use the colorscheme in a 256-color terminal
set t_Co=256

" To use the true color mode
set termguicolors

" Setting this option does not change the background color, it tells Vim what the background color looks like
set background=dark "dark/light"

" Put https://raw.github.com/mexsu/vimrcFile/master/colors/kuroiblack.vim
" in ~/.vim/colors/
" To make colorscheme work, or comment the line below to disable colorscheme
colorscheme kuroiblack

" To change the background color go to:
" ~/.vim/colors/kuroiblack.vim - and change let s:gui_background = "#0f0f0f" this value
