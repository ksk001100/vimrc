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

""" Twitter function
function! s:Timeline()
  let tweets = system("toyotter tl")
  echo substitute(tweets, '\e\[[0-9;]\+[mK]', '', 'g')
endfunction
command! Timeline call s:Timeline()

function! Tweet(...)
  let tweet = system('toyotter tw "' . a:1 . '"')
  echo substitute(tweet, '\e\[[0-9;]\+[mK]', '', 'g')
endfunction
command! -nargs=? Tweet call Tweet(<f-args>)

""" Common setting
set number
syntax on
filetype plugin indent on
filetype plugin on
set autoindent
set expandtab
set tabstop=4
set nobackup
set noswapfile
set shiftwidth=4
set backspace=2
set hlsearch
set splitright
set clipboard=unnamed,autoselect
colorscheme torte

""" Cursor settings
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[2 q"
let &t_SR .= "\e[4 q"

""" Netrw settings
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_alto = 1
let g:netrw_preview = 1
let g:netrw_retmap = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

""" Auto command
autocmd BufWritePost *.rs call RustFmt()
autocmd BufWritePost *.py call PythonFmt()
autocmd BufWritePost *.rb call RubyFmt()
autocmd QuickFixCmdPost *grep* cwindow
