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

syntax enable
filetype off

" https://github.com/gmarik/vundle
set rtp+=~/.vim/bundle/vundle/
set rtp+=$GOROOT/misc/vim

call vundle#rc()
Bundle 'bling/vim-airline'
Bundle 'csexton/trailertrash.vim'
Bundle 'dapplebeforedawn/vim-rails-buffer'
Bundle 'dapplebeforedawn/vim-ruby-buffer'
Bundle 'dapplebeforedawn/vim-shell-buffer'
Bundle 'dapplebeforedawn/vim-typing-practice'
Bundle 'git@git.innova-partners.com:mlorenz/gist-vim.git'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/webapi-vim'
Bundle 'rking/ag.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/tcomment'

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

let rspec_command = "rspec {spec} --require=support/vim_formatter.rb --format VimFormatter --out quii
ckfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . "\" >> $HOME/.wrench')"

let rspec_command = "clear \; rspec {spec}"
let rspec_options = " --require=support/formatters/vim_formatter.rb --format VimFormatter --out quickfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . rspec_options . "\" >> run_anything')"

let g:typing_practice_stats_file='~/typing_stats.dat'
