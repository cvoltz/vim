set backspace=indent,eol,start    " Intuitive backspacing.
set cursorline                    " Highlight entire line where cursor is
"set directory=$HOME/.vim/tmp//,. " Keep swap files in one location
set hidden                        " Handle multiple buffers better.
set hlsearch                      " Highlight matches.
set ignorecase                    " Case-insensitive searching.
set incsearch                     " Highlight matches as you type.
set nobackup                      " Don't make a backup before overwriting a file.
set noerrorbells                  " No beeping.
set nocompatible                  " We're running Vim, not Vi!
set nowritebackup                 " And again.
"set number                       " Show line numbers.
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set showcmd                       " Display incomplete commands.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set title                         " Set the terminal's title
"set visualbell                   " Flash when a beep would have sounded
set wildmenu                      " Enhanced command line completion.
set wildmode=longest,list:longest " Complete files like a shell.
set wildignore+=*.so,*.swp,*.zip
set wrap                          " Turn on line wrapping.
"set completeopt=menu,preview
"set complete=.,w,b,u,t           " Get completion keywords from current file, other windows, buffers, and tags
"set complete=.,t                 " Get completion keywords from current file, other windows, buffers, and tags
set completefunc=syntaxcomplete#Complete " For YCM
set sessionoptions+=localoptions,resize,winpos " When a session is saved, save the local options and mappings, the size of the window, and its position
set autoindent                    " Always set autoindenting on
set copyindent                    " Copy the previous indentation on autoindenting
set expandtab                     " Insert spaces instead of tabs
set antialias                     " Smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set laststatus=2                  " Show the status line all the time
set showtabline=2                 " Always display the tabline
set noshowmode                    " Hide the default mode text
set clipboard=unnamed,unnamedplus,autoselectplus
set viminfo='100,:100,/50,h,f1    " Save 100 file marks, 100 lines command-line history, 50 last searches, disable hlsearch loading, enable saving file marks
set mouse=a                       " Enable the mouse in all modes
set cmdheight=2

" Setup term color support
if exists('$TMUX')
  "set term=screen-256color
  set term=xterm-256color-italic
endif

" Force 256 color on
if $TERM =~ "xterm-256color.*" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

if $BACKGROUND ==? "light"
  let g:background="light"
else
  let g:background="dark"
endif

" Change vim-textobj-comment mappings
let g:textobj_comment_no_default_key_mappings=1
omap ax <Plug>(textobj-comment-a)
xmap ax <Plug>(textobj-comment-a)
omap ix <Plug>(textobj-comment-i)
xmap ix <Plug>(textobj-comment-i)
omap aX <Plug>(textobj-comment-big-a)
xmap aX <Plug>(textobj-comment-big-a)

"
" ALE configuration
"

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
"et g:ale_completion_enabled=1

"setlocal omnifunc=ale#completion#OmniFunc

" Tell ALE to use balloons. This setting must be set before ALE is loaded.
"et g:ale_set_balloons=1

" Tell ALE to use the preview window.
" let g:ale_hover_to_preview=1

"
" Plug configuration
"

" Install vim-plug if it isn't installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Install missing plugins
autocmd VimEnter *
  \| if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif

" After adding a new plugin, reload .vimrc and run :PlugInstall. Run PlugUpdate
" to update the plugins. Run PlugUpgrade to upgrade vim-plug.
source /home/cvoltz/.vim/autoload/plug.vim

call plug#begin()
  Plug 'tpope/vim-abolish'
  Plug 'mileszs/ack.vim'
  Plug 'rking/ag.vim'
  Plug 'dense-analysis/ale'
  "Plug 'pseewald/vim-anyfold'
  Plug 'cvoltz/autoproto.vim'
  "Plug 'vim-scripts/bash-support.vim'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'vim-scripts/CCTree'
  Plug 'vim-scripts/CRefVim'
  "Plug 'vim-scripts/dbext.vim'
  Plug 'vim-scripts/echofunc.vim'
  "Plug 'vim-scripts/errormarker.vim'
  Plug 'sjl/gundo.vim'
  Plug 'Rykka/InstantRst'
  Plug 'cvoltz/Kwbd.vim'
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'LaTeX-Box-Team/LaTeX-Box'
  Plug 'ddollar/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'aklt/plantuml-syntax'
  "Plug 'vim-scripts/pylint.vim'
  "Plug 'vim-scripts/pylint-mode'
  Plug 'cvoltz/refactor'
  Plug 'vim-scripts/Rename2'

  "Disable due to slow startup time
  "Plug 'Rykka/riv.vim'

  Plug 'MicahElliott/Rocannon'
  Plug 'm2ym/rsense'
  Plug 'bcaccinolo/rspec-vim-folding'
  Plug 'vim-scripts/ShowTrailingWhitespace'
  Plug 'vim-scripts/Specky'
  Plug 'ervandew/supertab'
  Plug 'AndrewRadev/switch.vim'
  "Plug 'scrooloose/syntastic'
  Plug 'godlygeek/tabular'
  Plug 'majutsushi/tagbar'
  Plug 'tomtom/tcomment_vim'
  Plug 'tomtom/tlib_vim'
  Plug 'jgdavey/tslime.vim'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'chase/vim-ansible-yaml'
  "Plug 'onehouse/vim-bufexplorer'
  "Plug 'jeetsukumaran/vim-buffergator'
  Plug 'tpope/vim-bundler'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-cucumber'
  Plug 'quentindecock/vim-cucumber-align-pipes'
  Plug 'tpope/vim-dispatch'
  if filereadable($HOME."/.vim/dokuvimki")
    Plug 'kynan/dokuvimki'
  endif
  Plug 'junegunn/vim-easy-align'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-endwise'
  "Plug 'sentientmonkey/vim-flog'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'fatih/vim-go'
  Plug 'tpope/vim-haml'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'mitsuhiko/vim-jinja'
  Plug 'elzr/vim-json'
  Plug 'clones/vim-l9'
  "Plug 'vim-latex/vim-latex'
  Plug 'killphi/vim-legend'
  Plug 'groenewege/vim-less'
  "Plug 'rakr/vim-one'
  Plug 'reinh/vim-makegreen'
  Plug 'tpope/vim-markdown'
  Plug 'vim-scripts/matchit.zip'
  "Plug 'sickill/vim-pasta'
  Plug 'shemerey/vim-peepopen'
  Plug 'shemerey/vim-project'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'rainerborene/vim-reek'
  Plug 'tpope/vim-repeat'
  Plug 'depuracao/vim-rdoc'
  Plug 'airblade/vim-rooter'
  "Plug 'thoughtbot/vim-rspec'
  Plug 'bdauria/vim-rspec-cucumber'
  Plug 'ngmy/vim-rubocop'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'sunaku/vim-ruby-minitest'
  Plug 'ecomba/vim-ruby-refactoring'
  Plug 'christoomey/vim-sort-motion'
  "Plug 'slim-template/vim-slim'
  Plug 'gabebw/vim-spec-runner'
  Plug 'christoomey/vim-system-copy'
  Plug 'tpope/vim-surround'
  Plug 'thisivan/vim-taglist'
  "Plug 'lervag/vimtex'
  Plug 'vim-scripts/voom'
  Plug 'vim-scripts/xterm16.vim'

  " Disable concealing double quotes in JSON files'
  "Plug 'jgdavey/vim-turbux'
  Plug 'tpope/vim-unimpaired'
  Plug 'skalnik/vim-vroom'
  Plug 'vim-scripts/visualrepeat'
  Plug 'vim-scripts/vst'
  Plug 'vim-scripts/vtreeexplorer'
  Plug 'posva/vim-vue'
  Plug 'wannesm/wmgraphviz.vim'
  Plug 'KabbAmine/zeavim.vim'
  Plug 'vim-scripts/ZoomWin'

  "Plug 'airblade/fuzzyfinder_textmate'
  "Plug 'sjbach/lusty'
  Plug 'ctrlpvim/ctrlp.vim'

  " When updated, run:
  " cd ~/.vim/plugged/command-t/ruby/command-t; make clean; ruby extconf.rb; make
  Plug 'wincent/command-t'

  "Plug 'tlavi/SnipMgr'
  "Plug 'msanders/snipmate.vim'
  "Plug 'vim-scripts/vim-autocomplpop'
  "Plug 'garbas/vim-snipmate'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/snipmate-snippets'

  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  " Run ~/.vim/build-you-complete-me when YouCompleteMe is updated
  if has('patch-8.1.2269')
    " Latest YCM needs at least this version of vim 
    Plug 'ycm-core/YouCompleteMe'
  else
    " Version compatible with the vim in CentOS 8
    Plug 'ycm-core/YouCompleteMe', { 'commit':'d98f896' }
  endif
  Plug 'Valloric/YouCompleteMe'
  Plug 'christoomey/vim-titlecase'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'christoomey/vim-tmux-runner'
  "Plug 'benmills/vimux'

  Plug 'rhysd/vim-textobj-anyblock'
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'beloglazov/vim-textobj-quotes'
  Plug 'tek/vim-textobj-ruby'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'kana/vim-textobj-user'
  Plug 'Julian/vim-textobj-variable-segment'
call plug#end()

" Disable concealing double quotes in JSON files
let g:vim_json_syntax_conceal=0

"
" YCM configuration
"

" Disable asking whether it is OK to run .ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0

"  \     'cmdline': [ 'tcp://localhost:7658' ],
let g:ycm_language_server = [
  \   {
  \     'name': 'ruby',
  \     'cmdline': [ 'solargraph', 'stdio' ],
  \     'filetypes': [ 'ruby' ],
  \   },
  \ ]

" Trigger configuration. Do not use <tab> since it will conflict with
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:SuperTabDefaultCompletionType='context'
if has('gui_running')
  let g:SuperTabMappingForward='<c-space>'
  let g:SuperTabMappingBackward='<s-c-space>'
else
  let g:SuperTabMappingForward='<nul>'
  let g:SuperTabMappingBackward='<s-nul>'
endif

" BASH support
let g:BASH_AuthorName='Christopher Voltz'
let g:BASH_AuthorRef='CDV'
let g:BASH_Email='christopher.voltz@hpe.com'
let g:BASH_Company='Hewlett Packard Enterprise'
let g:BASH_CopyrightHolder="© Hewlett Packard Enterprise, 2017"
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

" Conversion HTML (:help 2html.vim)
let g:html_use_css=1
let g:html_use_encoding="utf8"
let g:use_xhtml=1
set fileencodings=ucs-bom,utf8

" Load all of the plugins in ~/.vim/bundle
" silent! call pathogen#infect()

syntax on               " Enable syntax highlighting
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins
compiler ruby           " Enable compiler support for ruby
tab 15                  " Increase the limit on the number of tabs which can be opened

" Setup powerline
if matchstr($HOSTNAME, "cvoltz.*") != -1
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
else
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c%V\ %)%P
endif

if has('gui_running')
  "colorscheme github
  colorscheme koehler
  :set guifont=Cousine\ for\ Powerline\ 10
  :set showtabline=1
  :set guioptions-=T               " Hide toolbar.
  :set lines=58 columns=102        " Window dimensions.
else
  if g:background == "light"
    "colorscheme github
    ":highlight ColorColumn ctermbg=255
    "colorscheme one
    "highlight ColorColumn ctermbg=254

    let xterm16_colormap="softlight"
    let xterm16_brightness="high"
    let xterm16_white="#ffffff"
    colorscheme xterm16
    highlight ColorColumn ctermbg=lightgray
    highlight Comment ctermfg=lightgray
  else
    "colorscheme rubyblue
    colorscheme koehler
    highlight SpellBad cterm=none ctermfg=red ctermbg=black
    "colorscheme default
  end
endif

" For languages other than C, this will show trailing spaces
let g:ShowTrailingWhitespace=1
highlight ShowTrailingWhitespace ctermbg=233 guibg=#0c0c0c

" Highlight text beyond 80 columns with a grey background
if exists('+colorcolumn')
  let &colorcolumn=join(range(81,999),",")
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
highlight ColorColumn ctermbg=233 guibg=#0c0c0c

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

" Show tabs with a chevron (right-pointing double angle quotation mark) at
" each tab position, show trailing and non-breaking space with a middle dot,
" and show extended lines which aren't displayed with a trailing right angular
" bracket
set list
set listchars=tab:»\ ,trail:·,extends:>,nbsp:·

" C Syntax file can highlight spaces before tabs and trailing spaces
let c_space_errors=1

" Autowrap text to 80 chars for certain filetypes
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

" Turn off wrapping for files being edited using ItsAllText
autocmd BufRead,BufNewFile /tmp/itsalltext/*.txt setlocal textwidth=0

" auto remove trailing whitespace on buffer save
"autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

" remove trailing whitespace using \W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

function! DoRake()
  exec "w"
  exec "!xterm -e /bin/bash -c rake &"
  exec "i"
endfunction

function! DoMake()
  exec "w"
  exec "!xterm -e /bin/bash -c make &"
  exec "i"
endfunction

function! DoReset()
  exec "!xterm -e /bin/bash -c make clean && make clobber &"
  exec "i"
endfunction

function! DoTest()
  exec "w"
  exec "!xterm -e /bin/bash -c make test &"
  exec "i"
endfunction

" Adjust QuickFix window size to the optimal # of lines (minimum 3, maximum 10)
"function AdjustWindowHeight(minheight, maxheight)
"  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
"endfunction
"au FileType qf call AdjustWindowHeight(3, 10)

" Automatically load and enable cscope if cscope.out is avaialable
if has("cscope")
  set csto=0 " search cscope before ctags
  set cscopetag
  set nocscopeverbose
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set cscopeverbose

  " Map cscope functionality
  "   's'   symbol: find all references to the token under cursor
  "   'g'   global: find global definition(s) of the token under cursor
  "   'c'   calls:  find all calls to the function name under cursor
  "   't'   text:   find all instances of the text under cursor
  "   'e'   egrep:  egrep search for the word under cursor
  "   'f'   file:   open the filename under cursor
  "   'i'   includes: find files that include the filename under cursor
  "   'd'   called: find functions that function under cursor calls
  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

  " Using 'CTRL-/' then a search type makes the vim window
  " split horizontally, with search result displayed in
  " the new window.
  nmap <C-/>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-/>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-/>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-/>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-/>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-/>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-/>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-/>d :scs find d <C-R>=expand("<cword>")<CR><CR>

  " Hitting Shift-Ctrl-/ before the search type does a vertical
  " split instead of a horizontal one
  nmap <S-C-/>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <S-C-/>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <S-C-/>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <S-C-/>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <S-C-/>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <S-C-/>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <S-C-/>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

runtime macros/matchit.vim

autocmd BufNewFile,BufRead Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*,*.rb set filetype=ruby

" Automatic fold settings for specific files.
autocmd FileType c,cpp,h,vim,xml,html,xhtml,ruby setlocal foldmethod=syntax
autocmd FileType c,cpp,h,vim,xml,html,xhtml,ruby normal zR
"autocmd FileType c,cpp,h set foldmethod=syntax
autocmd FileType ruby setlocal foldmethod=syntax shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" F8: Run currently open cucumber feature file
" F9: Run current cucumber scenario
" F10: Run all cucumber feature files
autocmd FileType cucumber
\ compiler cucumber |
\ setlocal makeprg=cucumber\ \"%:p\" |
\ setlocal foldmethod=syntax shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd FileType cucumber nmap <F8> :w<cr>:!bin/cucumber --no-color %<cr> |
autocmd FileType cucumber nmap <F9> :w<cr>:exe "!bin/cucumber  --no-color %" . ":" . line(".")<cr> |
autocmd FileType cucumber nmap <F10> :w<cr>:!bin/cucumber --no-color<cr>

autocmd User Bundler
\ if &makeprg !~ 'bundle' | setl makeprg^=bundle\ exec\  | endif

let g:LustyJugglerSuppressRubyWarning=1
let g:errormarker_disablemappings=1

let g:rooter_patterns=['Rakefile', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
map <silent> <Leader>lcd <Plug>RooterChangeToRootDirectory
" Disable automatic change of directory to project root
let g:rooter_manual_only=1

" Changes to support vim-latex
" Force grep to always show the filename (even for a single file)
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
"let g:Tex_UseEditorSettingInDVIViewer=1
"let g:Tex_ViewRule_ps='okular'
"let g:Tex_ViewRule_pdf='okular'
"let g:Tex_ViewRule_dvi='okular'

" vim-latex defines C-j, which is mapped over by tmux-naviagator,  so redefine
" the vim-latex key to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

" Settings for LaTeX files
autocmd FileType tex
\ set spell |
\ set expandtab |
\ set tw=80 |
\ set sw=2

" latex-box configuration
autocmd FileType tex
\ imap <buffer> [[     \begin{ |
\ imap <buffer> ]]     <Plug>LatexCloseCurEnv |
\ imap <buffer> ((     \eqref{ |
\ nmap <buffer> <F5>   <Plug>LatexChangeEnv |
\ vmap <buffer> <F7>   <Plug>LatexWrapSelection |
\ vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
let g:LatexBox_quickfix=2
let g:LatexBox_split_type="vnew"
let g:LatexBox_split_resize=1
let g:LatexBox_Folding=1
let g:LatexBox_custom_indent=0

" Restore cursor position
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Add \s and \g hotkeys to lookup blame for svn and git for highlighted lines
vmap <Leader>s :<C-U>!svn blame <C-R>=expand("%:p") <CR> \|
\ sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \|
\ sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"let g:tmux_navigator_no_mappings=1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nmap <silent> <c-\> :TmuxNavigatePrevious<cr>

" For the MakeGreen plugin and Ruby RSpec.
autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby

let g:speckyBannerKey="<C-S>b"
let g:speckyQuoteSwitcherKey="<C-S>'"
let g:speckyRunRdocKey="<C-S>r"
let g:speckySpecSwitcherKey="<C-S>x"
let g:speckyRunSpecKey="<C-S>s"
let g:speckyRunRdocCmd="ri"
let g:speckyWindowType=2

autocmd FileType ruby
\ if expand('%') =~# '_test\.rb$' |
\   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
\ elseif expand('%') =~# '_spec\.rb$' |
\   compiler rspec | setl makeprg=rspec\ \"%:p\" |
\ else |
\   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
\ endif

"
" These mappings run rspec in a command window which replaces the editor
"

" Run currently open RSpec test file
map <Leader>rf :w<cr>:!bin/rspec % --format documentation --no-color<cr>

" Run current RSpec test. RSpec is clever enough to work out test to run if
" cursor is on any line within the test.
map <Leader>rl :w<cr>:exe "!bin/rspec --no-color %" . ":" . line(".")<cr>

" Run all RSpec tests
map <Leader>rt :w<cr>:!bin/rspec --format documentation< --no-color<cr>

"
" These mappings run rspec in a new horizontal split below the current page
" or in an already open tmux pane.
"

"map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
"map <Leader>rq :call VimuxRunCommand("clear; rspec " . bufname("%"), 0)<CR><CR>
"map <Leader>vc :VimuxClearRunnerHistory<CR>
"map <Leader>vi :VimuxInspectRunner<CR>
"map <Leader>vl :VimuxRunLastCommand<CR>
"map <Leader>vp :VimuxPromptCommand<CR>
"map <Leader>vq :VimuxCloseRunner<CR>
"map <Leader>vs :VimuxInterruptRunner<CR>
"let g:VimuxHeight="20" " 20% window size
"let g:VimuxOrientation="v"

"
" These mappings run rspec in a tmux pane
"

" Run rspec in new pane
"let g:rspec_command="Dispatch rspec {spec}"

"let g:rspec_command="call VtrSendCommand('rspec {spec}')"

" Run rspec in selected TMux pane (use \stv to reset which pane)
let g:rspec_command='call Send_to_Tmux("rspec {spec}\n")'
map <Leader>stv <Plug>SetTmuxVars

autocmd BufNewFile,BufRead *_spec.rb
\ map <Leader>t :call RunCurrentSpecFile()<CR> |
\ map <Leader>s :call RunNearestSpec()<CR> |
\ map <Leader>l :call RunLastSpec()<CR> |
\ map <Leader>a :call RunAllSpecs()<CR>

" TMux runner
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
let g:VtrClearSequence="clear<cr>"
let g:VtrOrientation="h"
let g:VtrClearBeforeSend=1
let g:VtrUseVtrMaps=1

"let g:switch_custom_definitions=
" \ [
" \     'unity': { 'Expect': 'Ignore' },
" \      'ruby_string': {
" \        '"\(\k\+\)"':                '''\1''',
" \        '''\(\k\+\)''':              ':\1',
" \        ':\(\k\+\)\@>\%(\s*=>\)\@!': '"\1"\2',
" \      },
" \ ]

" looks for DokuWiki headlines in the first 20 lines
" of the current buffer
function! IsDokuWiki()
  if match(getline(1,20),'^ \=\(=\{2,6}\).\+\1 *$') >= 0
    set textwidth=0
    set wrap
    set linebreak
    set filetype=dokuwiki
    set colorcolumn=
  endif
endfun

" check for dokuwiki syntax
autocmd BufWinEnter *.txt call IsDokuWiki()

" Dokuvimki plugin
if filereadable($HOME."/.vim/dokuvimki")
  source $HOME/.vim/dokuvimki
  highlight DokuCodeGeneric ctermbg=black ctermfg=gray
  highlight DokuHeadline    ctermbg=black ctermfg=yellow
  highlight DokuBlockColor  ctermbg=black ctermfg=blue
  highlight DokuLink        cterm=none ctermbg=black ctermfg=blue
  highlight DokuItalic      cterm=italic
  highlight DokuBold        cterm=bold
  highlight DokuUnderlined  cterm=underline
  highlight DokuSmileys     ctermbg=black ctermfg=yellow
  let g:DokuVimKi_INDEX_WINWIDTH = 10
endif

" automatically set paste and nopaste mode for tmux at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start="\<Esc>Ptmux;"
  let tmux_end="\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" set foldenable      " fold by default
set nofoldenable    " dont fold by default
"set foldclose=all     " automatically close folds when leaving them
set foldlevel=1       " open the first fold by default
set foldmethod=indent " fold based on indentation
set foldnestmax=10    " deepest fold is 10 levels
"set foldopen=all      " automatically open folds when entering them

"let anyfold_activate=1          " activate folding for any file
"let anyfold_fold_comments=1     " fold multiline comments
"let anyfold_fold_display=1      " minimalistic display of closed folds
"let anyfold_fold_toplevel=0     " don't fold subsequent unindented lines
"let anyfold_identify_comments=1 " identify and ignore comment lines
"let anyfold_motion=1            " map motion commands to [[, ]], [j, and ]k
"hi Folded term=None cterm=None

" Use ack for grepping
set grepprg=ack
set grepformat=%f:%l:%m

" Auto read when a file is changed on disk
" set autoread

" Automatically write file to disk when switching to another file or the shell
set autowrite

" Mode list and corresponding mode symbol
" n: normal only
" v: visual and select
" o: operator-pending
" x: visual only
" s: select only
" i: insert
" c: command-line
" l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

autocmd FileType c,cpp,h
\ nmap <C-C> :! make clean<enter> |
\ " set makeprg=build/buildit\ -l |
\ nmap <C-M> :make<enter> |
\ nmap <F8> :call DoMake()<enter> |
\ nmap <F9> :call DoTest()<enter> |

nmap <C-F10> :TagbarToggle<enter>
nmap <C-F11> :TlistToggle<enter>
nmap <C-F12> :NERDTreeToggle<enter>

" toggle paste mode
nmap <leader>o :set paste!<CR>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <quiet> <leader>tm :tabmove
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent><A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent><A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap \ :Switch<cr>

" make j and k act normally for wrapped lines
nnoremap j gj
nnoremap k gk

" allow saving a sudo file if forgot to open as sudo
cmap w!! w !sudo tee % >/dev/null

" Close vim if the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Turn on spell check for certain filetypes automatically
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us
autocmd FileType dokuwiki setlocal spell spelllang=en_us

" CtrlP config
" disable setting a local working directory
"let g:ctrlp_working_path_mode = 0
" ignore files we wouldn't be searching for
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|artifacts'
" don't scan dotfiles and dotdirs
let g:ctrlp_show_hidden = 0
" use ag for listing the files--way faster and no useless files.
"let g:ctrlp_user_command='ag %s -l --hidden --ignore .git --nocolor'
" disable caching of list of files
let g:ctrlp_use_caching=0
" Open files in vertical split
let g:ctrlp_open_new_file = 'v'
" Prompt for a key specifying how to open a file when c-o or c-y pressed
let g:ctrlp_arg_map = 1

" Command-t config
nmap <Leader>T <Plug>(CommandT)

" Vimux config
"let g:vroom_use_vimux=1
"let g:vroom_use_zeus=1
let g:vroom_cucumber_path='cucumber'
let g:vroom_use_binstubs=1

" Map F8 to rake for Hovercraft files
autocmd BufNewFile,BufRead *.rst setl makeprg=rake

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <Leader>= :wincmd =<cr>

"BEGIN_DEVASSISTANT_1
"Setting value devassistant to 0 will use your existing .vimrc file
"Setting value devassistant to 1 will use the vimrc defined by the devassistant feature
"let devassistant=0
"if devassistant==1
":source /usr/share/devassistant/files/snippets/vim/vimrc
"endif
"END_DEVASSISTANT_1

" Toggle crosshair cursor
nmap <Leader>+ :set cursorline cursorcolumn!<CR>

" Mappings already in use
" Mapping          Mode Plugin     Function
"<LocalLeader>ch   n    .vimrc     :set cursorline cursorcolumn!<CR>
"<LocalLeader>se   n    dbext      <Plug>DBExecSQLUnderCursor
"<LocalLeader>se   v    dbext      <Plug>DBExecVisualSQL
"<LocalLeader>sas  n    dbext      :1,$DBVarRangeAssign<CR>
"<LocalLeader>tm   n    turbux     <Plug>SendTestToTmux
"<LocalLeader>tm   v    .vimrc     :tabmove

" Disable search highlights with <Esc><Esc>
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Auto-reload vimrc when it is changed
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:PyLintOnWrite = 1

autocmd BufNewFile,BufRead .stgit-edit.txt setlocal spell tw=60
autocmd BufNewFile,BufRead .stgit-new.txt setlocal spell tw=60
autocmd BufNewFile,BufRead .stgit-squash.txt setlocal spell tw=60
autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal spell tw=60
autocmd Filetype stgnew setlocal spell tw=60
autocmd Filetype gitcommit setlocal spell textwidth=60

" Set cadre settings
let g:legend_file_path = "artifacts/cadre/coverage.vim"
let g:legend_hit_color = "ctermfg=Green cterm=bold gui=bold guifg=Green"
let g:legend_ignored_color = "ctermfg=DarkGrey guifg=DarkGrey"

" Allow project specific .vimrc files but don't let shell and write commands
" be run unless the .vimrc is owned by me
set exrc
set secure

" Add command to redraw the screen
nmap <LocalLeader>R :redraw!<cr>

"
" Language client configuration
"

" Ideally this is what we would use:
"   let g:LanguageClient_serverCommands = { "ruby": ["solargraph", "stdio"] }
" but the solargraph process becomes defunct so we have to tell the client
" to talk to solargraph over TCP and then we have to tell the client
" not to stop solargraph upon exit (so we don't have to keep starting it).
" Unfortunately, this configuration requires one to have externally started
" solargraph (by running "solargraph socket") before vim is started.
"let g:LanguageClient_autoStop = 0
"let g:LanguageClient_serverCommands = { "ruby": ["tcp://localhost:7658"] }
let g:LanguageClient_serverCommands = { "ruby": ["solargraph", "stdio"] }

"let g:LanguageClient_serverCommands = {
"    \ "ruby": ["~/.rvm/gems/ruby-2.7.0/bin/solargraph", "stdio"],
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ }

"let g:LanguageClient_hoverPreview  = Auto
"set omnifunc=LanguageClient#complete

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

" Enable flog
"silent exe "g:flog_enable"

ab _so Signed-off-by: Christopher Voltz <christopher.voltz@hpe.com>
