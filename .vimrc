""" Formatter function
function RustFmt()
  call system("rustfmt " . expand("%:p")) 
  edit!  
endfunction

function PythonFmt()
  call system("yapf -i " . expand("%:p"))
  edit!
endfunction

function RubyFmt()
  call system("rufo " . expand("%:p"))
  edit!
endfunction

""" Common setting
set number
syntax on
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set nobackup
set noswapfile
set shiftwidth=4
set backspace=2
set hlsearch
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[2 q"
let &t_SR .= "\e[4 q"
colorscheme torte

""" Auto command
autocmd BufWritePost *.rs call RustFmt()
autocmd BufWritePost *.py call PythonFmt()
autocmd BufWritePost *.rb call RubyFmt()
