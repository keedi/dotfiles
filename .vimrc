"
" Minimal Setting for remote host
"
"set t_Co=256
"hi CursorLine cterm=bold ctermbg=235
"hi Normal                ctermbg=Black ctermfg=White
"hi Search     cterm=bold ctermbg=232   ctermfg=220
"
"set cursorline
"set expandtab
"set hlsearch
"set number
"set pastetoggle=<Ins>
"set ruler
"set smartindent
"syntax on
"
"au BufNewFile,BufRead *.html.ep setf html

"
" Vundle
"   https://github.com/gmarik/Vundle.vim#quick-start
"   mkdir -p ~/.vim/bundle
"   git clone https://github.com/gmarik/Vundle.vim
"
"   Launch vim and run :PluginInstall
"   To install from command line: vim +PluginInstall +qall
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'WolfgangMehner/vim-plugins'
Plugin 'mattn/emmet-vim.git'
Plugin 'mattn/webapi-vim.git'
Plugin 'qstrahl/vim-matchmaker'
Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
" turn on plugin if it is needed
"
let g:matchmaker_enable_startup = 1

"
" coloring
"
syntax enable                              " 문법 강조 활성
set t_Co=256                               " 256 색상 사용
set t_AB=[48;5;%dm                       " 256 색상 사용
set t_AF=[38;5;%dm                       " 256 색상 사용
colorscheme desert256                      " 테마 설정
set cursorline "set cursor line highlight  " 현재 줄 강조
hi CursorLine cterm=bold ctermbg=236       " 현재 줄 색상 설정
hi Search cterm=bold ctermbg=0 ctermfg=220 " 검색 강조 색상 설정

"
" filetype
"
filetype plugin on
filetype plugin indent on " 주석의 #이 앞으로 강제이동하지 않도록 설정

" perl-support에서 펄 파일 생성시 템플릿 생성하지 않게 함
"let g:Perl_TemplateOverriddenMsg = 'no' " 경고 없애는데 실제로 안없애짐, 관련있는지 확인 필요
let g:Perl_InsertFileHeader = 'no'

set fileencodings=ucs-bom,utf-8,euc-kr,default,latin1 " utf-8, euc-kr 처리
set encoding=utf-8                                    " 화면에 보여지는 인코딩(현재 시스템이 utf-8)
set pastetoggle=<Ins>                                 " insert키로 paste토글
set number                                            " 줄 번호 표시
set hlsearch                                          " 검색 결과 반전
"set cindent                                           " C style indent
"set autoindent                                        " auto indent
set smartindent
set shiftround                                        " Always indent/outdent to the nearest tabstop

"
" mouse
"
set mouse=a
set mousefocus
set mousemodel=extend

"
" status
"
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC,FENC=%{&enc},%{&fenc}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]

"
" mapping keyboard
"
map <F2> <ESC>:NERDTreeToggle<CR> " NerdTree
map  1GVG                       " 전체 블록 설정
map  "+y                        " 블록 복사
map  "+x                        " 블록 잘라내기
map [[ 0?^\(sub\s\+\w*\s\+\)\{0,1}{<CR>f{ " [[가 C 또는 Perl에서 동작하게 함
map ]] 0/^\(sub\s\+\w*\s\+\)\{0,1}{<CR>f{ " ]]가 C 또는 Perl에서 동작하게 함
map ,sc <Esc>:set sw=8<CR>:set sts=8<CR>:set ts=8<CR>:set noexpandtab<CR>:set cindent<CR>:set autoindent<CR> " C 모드
map ,sp <Esc>:set sw=4<CR>:set sts=4<CR>:set ts=8<CR>:set expandtab<CR>:set nocindent<CR>                    " Perl 모드
map ,st <Esc>:set sw=2<CR>:set sts=2<CR>:set ts=8<CR>:set expandtab<CR>:set nocindent<CR>:set autoindent<CR> " 텍스트 모드
map ,sm <Esc>:set sw=2<CR>:set st=2<CR>:set ts=8<CR>:set expandtab<CR>:set cindent<CR>:set autoindent<CR>    " Mozilla mode
map ,se <Esc>:set sw=2<CR>:set sts=2<CR>:set ts=8<CR>:set expandtab<CR>:set cindent<CR>:set autoindent<CR>:set cinoptions=>2s,e-1s,n-1s,f0,{1s,}0,^-1s,:1s,=1s,l1,b0,g1s,h1s,p1s,t0,i1s,+1s,c3,C0,/0,(0,u0,U1,w0,W1s,m1,M0,)20,*30,#0<CR> " Emstone mode
map ,sd <Esc>:set sw=2<CR>:set sts=2<CR>:set ts=8<CR>:set noexpandtab<CR>:set cindent<CR>:set autoindent<CR>:set cinoptions=>2s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,j0,)20,*30,#0<CR> " Vim default mode

map [1;3D :tabprev<CR>       " alt + left
map [1;3C :tabnext<CR>       " alt + right
map ,sq <Esc>:'<,'>s/^/> /<CR> " 버그질라 인용

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

set expandtab

" abbr
abbr ㅍㅇㅎㅈ 必要韓紙
abbr pppp #!/usr/bin/env perl<CR><BS><CR>use utf8;<CR>use strict;<CR>use warnings;<CR>use feature qw( say );<CR><CR>binmode STDOUT, ":encoding(UTF-8)";<CR>binmode STDERR, ":encoding(UTF-8)";<CR>

" additional filetype
au BufNewFile,BufRead *.html.ep setf html " for Mojolicious

" emmet
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
