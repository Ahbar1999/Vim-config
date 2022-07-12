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
" Open File Explorer with Ctrl+e
nnoremap <c-e> :vsplit<cr><esc>:execute('Explore')<cr>
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
" Go to the start of the line and comment and uncomment it 
autocmd FileType rust	    nnoremap <buffer> <localleader>c ^i//<esc>
autocmd FileType rust 	    nnoremap <buffer> <localleader>cu ^xxi<esc>

" fn stores stores the filename without extensions
let fn = expand('%:t:r')

" Compile Shortcuts for Kotlin
function SetKotlinState(filename)
	echo "In a kotlin file"
	let b:compileCmdDotKt = "!kotlinc"." ".a:filename.".kt"." "."-include-runtime -d"." ".a:filename.".jar"
	let b:runCmdDotKt = "!java -jar"." ".a:filename.".jar"
	nnoremap <buffer> <localleader>cp :execute(b:compileCmdDotKt)<cr>
	nnoremap <buffer> <localleader>rp :execute(b:runCmdDotKt)<cr>
endfunction

if expand('%:e') == 'kt' 
	call SetKotlinState(fn)
endif

autocmd FileType python :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>


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

" RUST Plugins
Plug 'rust-lang/rust.vim'



call plug#end()
"END PLUG-IN MANAGER SETTINGS
" syntax enable
" set background=dark
colorscheme gruvbox 
syntax enable
filetype plugin indent on
