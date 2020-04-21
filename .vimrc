""" Formatter function
function RustFmt()
  call system("rustfmt " . expand("%:p")) 
  edit!  
endfunction

function PythonFmt()
  call system("yapf -i " . expand("%:p"))
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
set updatetime=1000
colorscheme torte

""" Cursor settings
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[2 q"
let &t_SR .= "\e[4 q"

""" vim-lsp-settings
let g:lsp_settings_servers_dir = "$HOME/.local/share/vim-lsp-settings/servers"
let lsp_signature_help_enabled = 1

""" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

""" VimPlug settings
call plug#begin('~/.vim/plugged')

""" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

""" NERDTree
Plug 'preservim/nerdtree'

""" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" wakatime
Plug 'wakatime/vim-wakatime'

""" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

""" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

""" Auto command
autocmd BufWritePost *.rs call RustFmt()
autocmd BufWritePost *.py call PythonFmt()
autocmd QuickFixCmdPost *grep* cwindow

""" map
nmap <Space>fed :e ~/.vimrc<CR>
nmap <Space>rr :source %<CR>
nmap <Space>qq :qa!<CR>
nmap <Space>qa :wqa<CR>
nmap <Space>k :LspHover<CR>
nmap <Space>gg :LspDefinition<CR>
nmap <Space><Tab> :b #<CR>
nmap <Space>wv :vs<CR>
nmap <Space>w- :sp<CR>
nmap <Space>ww <C-w><C-w>
nmap <Space>/ :Rg<Space>
nmap <Space>tl :Timeline<CR>
nmap <Space>tw :Tweet<Space>
nmap <Space>pf :CtrlP<CR>
