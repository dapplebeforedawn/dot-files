colorscheme vividchalk
set nocompatible
set nobackup
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set indentexpr=
set number
set autoindent
set laststatus=2 " Always show the statusline
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

syntax enable
filetype off

set rtp+=$GOROOT/misc/vim
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'git@github.com:bling/vim-airline'
Plugin 'git@github.com:csexton/trailertrash.vim'
Plugin 'git@github.com:dapplebeforedawn/vim-rails-buffer'
Plugin 'git@github.com:dapplebeforedawn/vim-ruby-buffer'
Plugin 'git@github.com:dapplebeforedawn/vim-shell-buffer'
Plugin 'git@github.com:dapplebeforedawn/vim-typing-practice'
Plugin 'git@git.innova-partners.com:mlorenz/gist-vim.git'
Plugin 'git@github.com:gmarik/vundle'
Plugin 'git@github.com:godlygeek/tabular'
Plugin 'git@github.com:kchmck/vim-coffee-script'
Plugin 'git@github.com:kien/ctrlp.vim'
Plugin 'git@github.com:mattn/webapi-vim'
Plugin 'git@github.com:rking/ag.vim'
Plugin 'git@github.com:thoughtbot/vim-rspec'
Plugin 'git@github.com:tpope/vim-fugitive'
Plugin 'git@github.com:tpope/vim-markdown'
Plugin 'git@github.com:tpope/vim-rails'
Plugin 'git@github.com:vim-scripts/tcomment'
call vundle#end()

filetype plugin indent on

cmap Gs Gstatus
cmap Gc Gcommit
cmap Gw Gwrite

let mapleader = " "
map <leader>w :w<cr>
map <leader>k :cg quickfix.out \| cwindow<cr>
map <S-h> gT
map <S-l> gt

nmap <leader>uuid iSecureRandom.uuid<esc>

au BufWritePre * :Trim " for trailer trash

let g:github_api_url = 'https://git.innova-partners.com/api/v3/'
let g:typing_practice_stats_file = '~/typing_practice_stats.dat'

" Alignment macros
nmap <Leader>a= :Tabularize /=\(>\)\@!<CR>
vmap <Leader>a= :Tabularize /=\(>\)\@!<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a{ :Tabularize / \zs{<CR>
vmap <Leader>a{ :Tabularize / \zs{<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" for vim-rspec
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
nnoremap <Leader>fun :echom system('echo ./script/development_functional_spec >> $HOME/.wrench')<CR>

let rspec_command = "clear \; rspec {spec}"
let rspec_options = " --require=support/formatters/vim_formatter.rb --format VimFormatter --out quickfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . rspec_options . "\" >> $HOME/.wrench')"

let g:typing_practice_stats_file='~/typing_stats.dat'
