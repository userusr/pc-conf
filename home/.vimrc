" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" common
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
" tab help fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matze/vim-move'
Plugin 'raimondi/delimitmate'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'SyntaxAttr.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'godlygeek/tabular'
" Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'

" Plugin 'ctrlpvim/ctrlp.vim'
" [junegunn/fzf: A command-line fuzzy finder](https://github.com/junegunn/fzf)
Plugin 'junegunn/fzf.vim'
" [ggreer/the_silver_searcher: A code-searching tool similar to ack, but faster.](https://github.com/ggreer/the_silver_searcher)
" [rking/ag.vim: Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'](https://github.com/rking/ag.vim)
Plugin 'rking/ag.vim'
" help unimpaired
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-repeat'

" javascript
Plugin 'pangloss/vim-javascript'

" html
Plugin 'othree/html5.vim'

" twig
Plugin 'evidens/vim-twig'

" Docker
Plugin 'ekalinin/dockerfile.vim'

" perl
Plugin 'vim-perl/vim-perl'
Plugin 'yko/mojo.vim'
Plugin 'perl-support.vim'

" css
Plugin 'mtscout6/vim-tagbar-css'

" colors
Plugin 'damage220/solas.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'altercation/vim-colors-solarized'
" [jnurmine/Zenburn: Zenburn is a low-contrast color scheme for Vim.](https://github.com/jnurmine/Zenburn))
Plugin 'jnurmine/Zenburn'

" puppet
Plugin 'rodjek/vim-puppet'

" YAML
" https://stackoverflow.com/questions/19030290/syntax-highlighting-causes-terrible-lag-in-vim
Plugin 'stephpy/vim-yaml'

" JSON
Plugin 'elzr/vim-json'

" git
Plugin 'airblade/vim-gitgutter'

" python
" [minimumbuilds/minimum_python_ide](https://github.com/minimumbuilds/minimum_python_ide)
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'tell-k/vim-autopep8'
" help pydocstring.txt
" <C-l> insert docstring
Plugin 'heavenshell/vim-pydocstring'

" markdown
Plugin 'shime/vim-livedown'

call vundle#end()

" settings
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoread
set autoindent
set smartindent
set rnu
set laststatus=2
set timeoutlen=500
set ttimeoutlen=0
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set encoding=utf-8
set termencoding=utf-8
set updatetime=500
set noswapfile
set splitright
set splitbelow
set nocompatible
set tags=~/.vim/tags;
set ignorecase
set hidden
set hlsearch
set incsearch
set cursorline
set pumheight=10
set clipboard=unnamed
set fillchars+=vert:\ 
let mapleader=","
filetype off
filetype plugin on
filetype plugin indent on
" autocmd CompleteDone * pclose

" "вечная" отмена изменений
" http://funix.ru/programs_utilities/ispolzovanie-vim-v-povsednevnoj-rabote.html
set undofile
set undodir=~/.vim/undo/

" color
syntax on
let g:solarized_termcolors=256
set t_Co=256
" set background=light
set background=dark
colorscheme solarized

" abbreviations
abbr help tab help

" airline
" [ryanoasis/nerd-fonts: Iconic font aggregator](https://github.com/ryanoasis/nerd-fonts)
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" autopep8
" let g:autopep8_disable_show_diff = 1

" easymotion
" https://github.com/easymotion/vim-easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget Search
hi EasyMotionTarget2First ctermfg=202 ctermbg=None cterm=None
hi EasyMotionTarget2Second ctermfg=202 ctermbg=None cterm=None
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" syntastic
" https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamlxs']
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
" [ruby - How do I fix this annoying syntastic rails error - Stack Overflow](https://stackoverflow.com/questions/29635150/how-do-i-fix-this-annoying-syntastic-rails-error)
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

" session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_default_to_last = 1

" tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_width = 40
let g:tagbar_iconchars = ['+', '-']
" let g:tagbar_map_close = '<C-m>'
let g:tagbar_type_javascript = {
\'ctagstype':'JavaScript',
	\'kinds' : [
		\'f:functions',
		\'c:classes',
		\'m:methods',
		\'p:properties'
	\]
\}

" map <alt+n> to navigate through tabs
for c in range(1, 9)
	exec "set <A-".c.">=\e".c
	exec "map \e".c." <A-".c.">"
	let n = c - '0'
	exec "map <M-". n ."> ". n ."gt"
endfor

" delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>,>:<"

" FZF
" [Vim спустя 15 лет / Блог компании Mail.Ru Group / Хабрахабр](https://habrahabr.ru/company/mailru/blog/340740/)
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_map = ''
let g:ctrlp_buftag_types = {
	\'php': '--php-kinds=icdf'
\}

" ctrlsf
let g:ctrlsf_position = 'right'

" easytags
let g:easytags_file = '~/.vim/tags'
let g:easytags_auto_highlight = 0
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1

" move
let g:move_key_modifier = 'C'

" nerdtree
nnoremap <C-p> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" https://github.com/shime/vim-livedown
" Need to install NodeJS from from https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
"
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
" the browser to use
let g:livedown_browser = "firefox"

" https://habrahabr.ru/post/224979/
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1
" поддержка virtualenv
let g:pymode_virtualenv = 1
" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" отключить autofold по коду
let g:pymode_folding = 0
" возможность запускать код
let g:pymode_run = 0

" youcompleteme
" [vim - UltiSnips and YouCompleteMe - Stack Overflow](https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme))
" let g:ycm_key_list_select_completion = ['<C-j>']
" let g:ycm_key_list_previous_completion = ['<C-k>']
" для файлов python используем jedi-vim
let g:ycm_filetype_blacklist = { 'python': 1  }

" ultisnips
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

map <Tab> <C-W>w
map <S-Tab> <C-W>W
nmap <F2> :wa<CR>
nmap <S-F2> :e!<CR>

" Режим "вклейки"
" http://funix.ru/programs_utilities/ispolzovanie-vim-v-povsednevnoj-rabote.html
set pastetoggle=<F7>

" https://stackoverflow.com/questions/2345519/how-can-i-script-vim-to-run-perltidy-on-a-buffer
" define :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

" run :Tidy on entire buffer and return cursor to (approximate) original position
fun DoTidy()
	let l = line(".")
	let c = col(".")
	:Tidy
	call cursor(l, c)
endfun

" shortcut for normal mode to run on entire buffer then return to current line
au Filetype perl nmap <leader>pt :call DoTidy()<CR>

" shortcut for visual mode to run on the the current visual selection
au Filetype perl vmap <leader>pt :Tidy<CR>

au FileType python noremap <buffer> <leader>pt :call Autopep8()<CR>
au FileType python noremap <leader>pd <Plug>(pydocstring)

au BufNewFile,BufRead *.py
            \set tabstop=4
            \set softtabstop=4
            \set shiftwidth=4
            \set textwidth=79
            \set expandtab
            \set autoindent
            \set fileformat=unix

" https://github.com/stephpy/vim-yaml/blob/master/after/syntax/yaml.vim
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/syntax/yaml.vim

