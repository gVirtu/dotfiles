" PLUGINS 

" Elixir
au BufNewFile,BufRead *.ex,*.exs		set filetype=elixir

set nocompatible
filetype plugin on
runtime macros/matchit.vim

autocmd FileType elixir let b:match_words = '\<\%(case\|cond\|if\|unless\|try\|loop\|receive\|fn\|' .
      \ 'defmodule\|defimpl\|defmacro\|defdelegate\|defexception\|defcallback\|defoverridable\|defp\|def\|test\)\>=\@!:' .
      \ '\<\%(else\|elsif\|catch\|after\|rescue\)\>:' .
      \ '\<end\>,{:},\[:\],(:)'

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Textobj User
    Plug 'kana/vim-textobj-user'

    " Targets (inside quotes, inside blocks, etc)
    Plug 'wellle/targets.vim'

    " EasyMotion fork for VSCode
    Plug 'asvetliakov/vim-easymotion'

    " Abolish (search helpers)
    Plug 'tpope/vim-abolish'

    " Surround
    Plug 'tpope/vim-surround'

    " WordMotion (alternative to CamelCaseMotion)
    Plug 'chaoren/vim-wordmotion'

    " Matchit
    Plug 'adriaanzon/vim-textobj-matchit'

    " VisualStar
    Plug 'thinca/vim-visualstar'

call plug#end()

" Map Leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Use system clipboard
set clipboard=unnamedplus

" Clear highlights on ESC+ESC
nnoremap <esc><esc> :silent! nohls<cr>

" Center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz

" Up and down jump should center too.
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Last and next jump should center too.
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Shortcut: CTRL+R to replace current selection in visual mode
" vnoremap <C-r> "hy:%S/<C-r>h/

" Now it is possible to paste many times over selected text
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

if exists('g:vscode')
    " VSCode extension

    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine

    nnoremap <silent> u :<C-u>call VSCodeNotify('undo')<CR>
    nnoremap <silent> <C-r> :<C-u>call VSCodeNotify('redo')<CR>
endif
