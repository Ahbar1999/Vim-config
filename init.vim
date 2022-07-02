" Load the lua files in config folder and execute them
lua require('config')
" Use (:execute 'edit' luaFile) to edit the lua config
let luaFile = "~/AppData/Local/nvim/lua/config/init.lua"

" This is a oneline comment
" Print some greeting messages 
echo "(^ - ^)/"

" Using multiline strings 
echo "Hello, Ahbar\n\r
\ ██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗  ██████╗░░█████╗░░█████╗░██╗░░██╗██╗\n\r
\ ██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝  ██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██║\n\r
\ ╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░  ██████╦╝███████║██║░░╚═╝█████═╝░██║\n\r
\  ████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░  ██╔══██╗██╔══██║██║░░██╗██╔═██╗░╚═╝\n\r
\  ╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗  ██████╦╝██║░░██║╚█████╔╝██║░╚██╗██╗\n\r
\   ╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝  ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝\n\r
\ \n\r\n\r
\ \n\r\n\r
\ \n\r\n\r
\ \n\r\n\r"

" Setting some editor variables
set number
set relativenumber


" Mapping keyboard bindings

" referenced by <leader>
let mapleader = "-"
" referenced by <localleader>
let localleader = "\\"

" Cut the current line and paste it below the current line, works in all the modes
nnoremap <leader>- ddp
" Same as above except moves the line upwards
nnoremap <leader>_ ddkP
" Dont use the above 2 commands at the first or last line, its not perfect ik 
" Delete the current line in insertion mode(Although the exact steps are longer) 

vnoremap <c-d> <esc>ddi 
inoremap <leader>s <esc>:w<cr>
" Open and edit $MYVIMRC file with keyboard shortcuts
" '<cr>' is carriage return, here basically it means to execute the command
" after entering it
nnoremap <leader>ovr :e $MYVIMRC<cr>
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
" Split window vertically and open the command prompt in one buffer 
nnoremap <leader>ot :vsplit<cr><esc>:terminal<cr>i 
inoremap <leader>e  <esc>eli
inoremap <leader>b  <esc>bi
nnoremap <localleader>pfn <esc>:echo expand('%:t')<cr>

" SOME AUTOCOMMAND SETTINGS
"
" Comment Shortcuts
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

" fn stores stores the filename without extensions
let fn = expand('%:t:r')
" TODO:
" 	move below variables into an if block for kotlin only files
"
"
" Compile Shortcuts for Kotlin
autocmd FileType kotlin let b:compileCmdDotKt = "!kotlinc"." ".fn.".kt"." "."-include-runtime -d"." ".fn.".jar"
autocmd FileType kotlin let b:runCmdDotKt = "!java -jar"." ".fn.".jar"

" From the help manual: 'If the first argument to one of these commands is "<buffer>" the mapping will
"                        be effective in the current buffer only.'
"                        Current buffer refers to the buffer that sourced the
"                        vimrc so for example since the following lines will
"                        only be execute in a buffer for kotlin file therefore
"                        the mappings will be valid in those specific buffers
autocmd FileType kotlin     nnoremap <buffer> <localleader>cp <esc>:execute(b:compileCmdDotKt)<cr>
autocmd FileType kotlin     nnoremap <buffer> <localleader>rp <esc>:execute(b:runCmdDotKt)<cr>

autocmd FileType python :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>

autocmd FileType kotlin let localvar = "Hello World"
autocmd FileType kotlin let b:localvar = "Hello World from buffer local"

"START PLUG-IN MANAGER SETTINGS
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
" Dracula color scheme
Plug 'dracula/vim', { 'as': 'dracula' }
" Gruvbox color scheme
Plug 'morhetz/gruvbox'

" GOLANG Extension
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
Plug 'udalov/kotlin-vim'

call plug#end()
"END PLUG-IN MANAGER SETTINGS
" syntax enable
" set background=dark
colorscheme gruvbox 
syntax enable
filetype plugin indent on

