# vimrcFile
#### .vimrc file with gruvbox colorscheme

Basic .vimrc file i put together from different places with gruvbox colorscheme,
I use it mostly in terminal like Putty or git bash for windows.

## Installation
```bash
curl -OL https://raw.githubusercontent.com/mexsu/vimrcFile/master/.vimrc
```
move .vimrc to your home directory:
```bash
~/.vimrc
```

##### Things to do:
* Install vim-plug:
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
* Reload .vimrc and run :PlugInstall to install plugins.

*  Enable/Disable mouse, disabling mouse will help copy/paste in putty using mouse
   ```vim
   set mouse=a
   ```
* Change background color theme or disable colorscheme and remove it from plugins
  ```vim
  colorscheme gruvbox
  ```
