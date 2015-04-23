set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set nobackup
set diffexpr=MyDiff()
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let eq = ''
if $VIMRUNTIME =~ ' '
if &sh =~ '\<cmd'
let cmd = '""' . $VIMRUNTIME . '\diff"'
let eq = '"'
else
let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
endif
else
let cmd = $VIMRUNTIME . '\diff'
endif
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"显示行号
colorscheme desert 
syntax enable 
syntax on

set encoding=utf-8
set fileencodings=utf-8
set fileencoding=utf-8

"NERDTree快捷键
nmap <F7> :NERDTree <CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1


"默认最大化窗口打开
au GUIEnter * simalt ~x

"设置tab缩进
set ts=4
set shiftwidth=4
set cindent
set expandtab

"设置粘贴
set paste
set mouse=v

" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/

"""""""""""""""""""""""""""""
" Tag list (ctags)
"""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
map <silent> <F9> :TlistToggle<cr>

source ~/.vim/php-doc.vim
:imap <C-D> <ESC>:call PhpDocSingle()<CR>i
:nmap <C-D> :call PhpDocSingle()<CR>
:vmap <C-D> :call PhpDocRange()<CR>

"注释代码插件 NERD_commenter
let mapleader = ","

"AuthorInfo
let g:vimrc_author='wangkongming' 
let g:vimrc_email='komiles@163.com' 
let g:vimrc_homepage='http://www.wangkongming.cn/' 

nmap <F4> :AuthorInfoDetect<cr> 

"检查程序是否有拼写错误
augroup filetypedetect
au! BufRead,BufNewFile *inc setfiletype php
augroup end

augroup Programming
autocmd!
autocmd BufWritePost *.php !php -d display_errors=on -l <afile>
"autocmd BufWritePost *.inc !php -d display_errors=on -l <afile>
augroup end
