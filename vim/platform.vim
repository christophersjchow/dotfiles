" ------------------------------------------------------------------------------
" File: platform.vim
" Description: Platform specific configuration
" Author: Christopher Chow <chris@chowie.net>
" ------------------------------------------------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Disable quickfixsigns on Windows due to incredible slowdown.
  let g:loaded_quickfixsigns=1

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom Source Code font for Powerline
  " From: https://github.com/Lokaltog/powerline-fonts
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  set lines=52                      " Window size.
  set columns=165
  set vb                            " Disable the audible bell.

  if has('gui_running')
    set guioptions-=m " Disable menu bar.
    set guioptions-=T " Disable the toolbar.
    set guioptions-=l " Disable left scrollbar.
    set guioptions-=L " Disable left scrollbar when split.
    set guioptions-=r " Diable right scrollbar.
    set guioptions-=a " Do not auto copy selection to clipboard.
  endif
endif
