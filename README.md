# vimrcFile
#### .vimrc file with kuroiblack colorscheme

Basic .vimrc file i put together from different places
you can use it alone or with the colorscheme kuroiblack
that included in this repository.

I use it most the time for terminal, like putty or git bash for windows.

## Installation

1.  copy .vimrc to your home directory:

	```bash
	~/.vimrc
	```

2.  Copy colors/kuroiblack.vim to:

    ```bash
    ~/.vim/colors/kuroiblack.vim
    ```

    or alternatively, use a plugin manger such as
    [vim-plug](https://github.com/junegunn/vim-plug),
    [NeoBundle](https://github.com/Shougo/neobundle.vim),
    [Vundle](https://github.com/gmarik/Vundle.vim), or
    [Pathogen](https://github.com/tpope/vim-pathogen).

 #####  You can use the .vimrc file alone by commenting or deleting out the colorscheme kuroiblack line from your .vimrc
 you can find it at the end of the file

 ```vim
 "colorscheme kuroiblack
 ```
 Enable/disbale mouse by commenting/uncomment this line in .vimrc
 disabling mouse will help copy/paste in putty using mouse
 ```vim
 set mouse=a		" Enable mouse
 ```
 
## Credits
This colorscheme is originally based on
[kuroi.vim](https://github.com/aonemd/kuroi.vim). I only changed the background
color.
