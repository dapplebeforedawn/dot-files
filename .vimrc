colorscheme vividchalk
set nocompatible
set nowritebackup
set noswapfile
set nobackup
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set indentexpr=
set number
set autoindent
set laststatus=2 " Always show the statusline

set formatprg=tree\ -f

syntax enable
filetype off

set rtp+=$GOROOT/misc/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'
Bundle 'dapplebeforedawn/vim-ruby-buffer'
Bundle 'dapplebeforedawn/vim-shell-buffer'
Bundle 'dapplebeforedawn/vim-rails-buffer'
Bundle 'dapplebeforedawn/vim-typing-practice'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/tComment'
Bundle 'kchmck/vim-coffee-script'
Bundle 'csexton/trailertrash.vim'
Bundle 'rking/ag.vim'
Bundle 'thoughtbot/vim-rspec'

filetype plugin indent on

cmap Gs Gstatus
cmap Gc Gcommit
cmap Gw Gwrite

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let mapleader = " "
map <leader>w :w<cr>
map <S-h> gT
map <S-l> gt

au BufWritePre * :Trim " for trailer trash

" Alignment macros
nmap <Leader>a= :Tabularize /=\(>\)\@!<CR>
vmap <Leader>a= :Tabularize /=\(>\)\@!<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a{ :Tabularize / \zs{<CR>
vmap <Leader>a:= :Tabularize /:=<CR>
nmap <Leader>a:= :Tabularize /:=<CR>
vmap <Leader>a{ :Tabularize / \zs{<CR>

" vim-rspec mappings
nnoremap <Leader>specf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>specn :call RunNearestSpec()<CR>
nnoremap <Leader>spec :call RunLastSpec()<CR>
nnoremap <Leader>speca :call RunAllSpecs()<CR>

let rspec_command = "clear \; rspec {spec}"
let rspec_options = " --require=support/formatters/vim_formatter.rb --format VimFormatter --out quickfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . rspec_options . "\" >> run_anything')"

let g:typing_practice_stats_file='~/typing_stats.dat'
