" General
set nocompatible " Don't try to be vi compatible
set number relativenumber
"set number  " Show normal line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=++   " Wrap-broken line prefix
set textwidth=125   " Line wrap (number of cols)
set showmatch	" Highlight matching brace
set encoding=utf-8
set wildmode=longest,list,full
set belloff=all " Disable bell
"set visualbell	" Use visual bell (no beeping)
"set cursorline "hightlight the line ,add line under line
set showcmd "show commands
syntax on

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
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent    " Auto-indent new lines
set cindent       " Use 'C' style program indenting
set shiftwidth=4  " Number of auto-indent spaces
set smartindent   " Enable smart-indent
set smarttab	  " Enable smart-tabs
set softtabstop=4 " Number of spaces per Tab

set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Move between lines and wrapped-broken lines
noremap <silent> k gk
noremap <silent> j gj

" Change shortcut from ctrl w + hjkl to ctrl hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make splits to open at the botton and the right
set splitbelow
set splitright

" Clear seach highlight with enter after searching , n-search next , N-go to previous
nnoremap <CR> :noh<CR><CR>

" To use the colorscheme in a 256-color terminal
if $TERM == "xterm-256color"
  set t_Co=256
endif

set termguicolors " To use the true color mode
set background=dark "dark/light" Setting this option does not change the background color, it tells Vim what the background color looks like"
" put https://raw.github.com/mexsu/vimrcFile/master/colors/kuroiblack.vim
" in ~/.vim/colors/
" to make colorscheme work or comment it the line below to disable colorscheme
colorscheme kuroiblack
" to change the background color go to ~/.vim/colors/kuroiblack.vim - and change let s:gui_background = "#0f0f0f" this value
