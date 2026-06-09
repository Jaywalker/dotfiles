" Workman vim keybindings, based on:
" https://github.com/ajgrf/dotfiles/blob/master/.config/vim/workman.vim
" https://axiomatic.neophilus.net/workman-layout-for-vim/
" With colmak support and other inspirations from https://github.com/bunnyfly/dotfiles

let mapleader = ","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 
Plug 'jodosha/vim-godebug'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tyok/nerdtree-ack'
" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'Chiel92/vim-autoformat'
Plug 'kovetskiy/sxhkd-vim'
Plug 'darfink/vim-plist'
Plug 'rhysd/git-messenger.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'StanAngeloff/php.vim'
Plug 'rhysd/vim-grammarous'
Plug 'vimwiki/vimwiki'
call plug#end()

set nocompatible
filetype plugin on
syntax on
set termguicolors
colorscheme cobalt
" Overrides to keep the bg transparent
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE
hi LineNr guifg=#59809d  guibg=NONE
set encoding=utf-8
set number relativenumber
set clipboard+=unnamedplus
set statusline+=%{gutentags#statusline()}

augroup python_files
	autocmd!
	autocmd FileType python setlocal noexpandtab
	autocmd FileType python set tabstop=8
	autocmd FileType python set shiftwidth=8
augroup END

if executable('pt')
  let g:ackprg = 'pt --nogroup --smart-case' " --ignore-case also an option
endif

" Keyboard  **************************
"(O)pen line -> (L)ine
nnoremap l o
vnoremap l o
nnoremap o l
vnoremap o l
nnoremap L O
vnoremap L O
nnoremap O L
vnoremap O L

"Search (N)ext -> (J)ump
nnoremap j n
vnoremap j n
nnoremap n j
vnoremap n j
nnoremap J N
vnoremap J N
nnoremap N J
vnoremap N J

"(E)nd of word -> brea(K) of word
nnoremap k e
vnoremap k e
nnoremap e k
vnoremap e k
nnoremap K E
vnoremap K E
nnoremap E <nop>
vnoremap E <nop>

"(Y)ank -> (H)aul
nnoremap h y
vnoremap h y
onoremap h y
nnoremap y h
vnoremap y h
nnoremap H Y
vnoremap H Y
nnoremap Y H
vnoremap Y H

"G key remaps
noremap gn gj
noremap ge gk
noremap gy gh
noremap gk gn
noremap gh ge
noremap gl go
noremap gN gJ
noremap gY gH
noremap gK gN
noremap gH gE
noremap gL gO

" This is useful if we don't use tmux/vim nav.
" nnoremap <silent> <c-w>n :wincmd j<cr>
" nnoremap <silent> <c-w>e :wincmd k<cr>
" nnoremap <silent> <c-w>y :wincmd h<cr>
" nnoremap <silent> <c-w>o :wincmd l<cr>
" nnoremap <silent> <c-w>k :wincmd n<cr>
" nnoremap <silent> <c-w>l :wincmd o<cr>

" Shortcutting split navigation, saving a keypress:
map <C-y> <C-w>h
map <C-n> <C-w>j
map <C-e> <C-w>k
map <C-o> <C-w>l

" get control-j back, so switch it with ctrl-n at qwerty position of j
imap <c-n> <cr>
cmap <c-n> <cr>
inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>

nnoremap jj yy
" nunmap yy " TODO: Taken out in an update??


function Keyboard(type)
   if a:type == "workman"
       "(O)pen line -> (L)ine
       nnoremap l o
       vnoremap l o nnoremap o l
       vnoremap o l
       nnoremap L O
       vnoremap L O
       nnoremap O L
       vnoremap O L

       "Search (N)ext -> (J)ump
       nnoremap j n
       vnoremap j n
       nnoremap n j
       vnoremap n j
       nnoremap J N
       vnoremap J N
       nnoremap N J
       vnoremap N J

       "(E)nd of word -> brea(K) of word
       nnoremap k e
       vnoremap k e
       nnoremap e k
       vnoremap e k
       nnoremap K E
       vnoremap K E
       nnoremap E <nop>
       vnoremap E <nop>

       "(Y)ank -> (H)aul
       nnoremap h y
       vnoremap h y
       onoremap h y
       nnoremap y h
       vnoremap y h
       nnoremap H Y
       vnoremap H Y
       nnoremap Y H
       vnoremap Y H

       "G key remaps
       noremap gn gj
       noremap ge gk
       noremap gy gh
       noremap gk gn
       noremap gh ge
       noremap gl go
       noremap gN gJ
       noremap gY gH
       noremap gK gN
       noremap gH gE
       noremap gL gO

       " This is useful if we don't use tmux/vim nav.
       " nnoremap <silent> <c-w>n :wincmd j<cr>
       " nnoremap <silent> <c-w>e :wincmd k<cr>
       " nnoremap <silent> <c-w>y :wincmd h<cr>
       " nnoremap <silent> <c-w>o :wincmd l<cr>
       " nnoremap <silent> <c-w>k :wincmd n<cr>
       " nnoremap <silent> <c-w>l :wincmd o<cr>

	" Shortcutting split navigation, saving a keypress:
	map <C-y> <C-w>h
	map <C-n> <C-w>j
	map <C-e> <C-w>k
	map <C-o> <C-w>l

       " get control-j back, so switch it with ctrl-n at qwerty position of j
       imap <c-n> <cr>
       cmap <c-n> <cr>
       inoremap <c-j> <c-n>
       cnoremap <c-j> <c-n>
       
       nnoremap jj yy
       nunmap yy
   else " qwerty
       call UnmapWorkman()
   endif
endfunction

function UnmapWorkman()
    "Unmaps Workman keys
    silent! nunmap h
    silent! ounmap h
    silent! vunmap h
    silent! nunmap j
    silent! vunmap j
    silent! nunmap k
    silent! vunmap k
    silent! nunmap l
    silent! vunmap l
    silent! nunmap y
    silent! vunmap y
    silent! nunmap n
    silent! vunmap n
    silent! nunmap e
    silent! vunmap e
    silent! nunmap o
    silent! vunmap o
    silent! nunmap H
    silent! vunmap H
    silent! nunmap J
    silent! vunmap J
    silent! nunmap K
    silent! vunmap K
    silent! nunmap L
    silent! vunmap L
    silent! nunmap Y
    silent! vunmap Y
    silent! nunmap N
    silent! vunmap N
    silent! nunmap E
    silent! vunmap E
    silent! nunmap O
    silent! vunmap O
endfunction

function LoadKeyboard()
   let keys = $keyboard
   if (keys == "workman")
       call Keyboard("workman")
   endif
endfunction

autocmd VimEnter * call LoadKeyboard()

:noremap <Leader>q :call Keyboard("qwerty")<CR>:echom "Qwerty Keyboard Layout"<CR>
:noremap <Leader>w :call Keyboard("workman")<CR>:echom "Workman Keyboard Layout"<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
	" let g:UltiSnipsExpandTrigger="<tab>"
	" let g:UltiSnipsJumpForwardTrigger="<c-b>"
	" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
	" let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
	"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

 " Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

"------------------------
"-    FZF Configuration -
"------------------------
	map <leader>f :Files<CR>

"------------------------
"-    Tab Management    -
"------------------------
	" Tab management vim-style
	" nmap t :tabnew 
	" nnoremap th  :tabfirst<CR>
	" nnoremap tk  :tabnext<CR>
	" nnoremap tj  :tabprev<CR>
	" nnoremap tl  :tablast<CR>
	" nnoremap tt  :tabedit<Space>
	" nnoremap tn  :tabnext<Space>
	" nnoremap tm  :tabm<Space>
	" nnoremap td  :tabclose<CR>
	" Alternatively use..
	nnoremap te :tabnext<CR>
	nnoremap tn :tabprev<CR>
	nnoremap tt :tabnew 
	" nnoremap N :tabprevious
	" nnoremap E :tabNext


" Golang Shortcuts
	autocmd FileType go map <leader>i :GoImport 

"----------------------
"-    NeoMutt Conf    -
"----------------------
" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

"-----------------------------
"-     YCM Clang defaults    -
"-----------------------------
" add some sensible clang flags by default
	autocmd FileType *.c,*.h,*.cpp,*.hpp,*.m,*.mm,*.x,*.xm let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'

"-----------------------------
"-     YCM Python defaults    -
"-----------------------------
" Tell YCM where Python lives and what to stick on sys.path
let g:ycm_python_interpreter_path = '/usr/bin/python3.13'
let g:ycm_python_sys_path = ['/usr/lib/python3.13/site-packages']

" Expose those values to YCM’s config and point to a global config file
let g:ycm_extra_conf_vim_data = [
      \ 'g:ycm_python_interpreter_path',
      \ 'g:ycm_python_sys_path'
      \ ]
let g:ycm_language_server = [
  \ {
  \   'name': 'basedpyright',
  \   'filetypes': ['python'],
  \   'cmdline': ['basedpyright-langserver', '--stdio'],
  \   'settings': {
  \     'basedpyright': {
  \       'analysis': {
  \         'stubPath': '/home/jaywalker/.cache/pyright-stubs/typings',
  \         'extraPaths': ['/usr/lib/python3.13/site-packages'],
  \         'autoImportCompletions': v:true,
  \         'useLibraryCodeForTypes': v:true,
  \         'logLevel': 'Trace'
  \       }
  \     }
  \   }
  \ }
  \ ]
"---------------------
"-    TagBar Conf    -
"---------------------
" Tagbar Toggle
	nnoremap tb :TagbarToggle<CR>

" Enable Tagbar by default for sourcecode
	autocmd vimenter,BufRead *.go,*.c,*.h,*.cpp,*.hpp,*.m,*.mm,*.x,*.xm,*.py,*.pl,*.php,*.java TagbarOpen

"----------------------
"-    NERDTree Conf   -
"----------------------
" NerdTree toggle
	map <leader>n :NERDTreeToggle<CR>

" Close NerdTree if its the only window left
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable NerdTree by default for source code
	autocmd vimenter *.go,*.c,*.h,*.cpp,*.hpp,*.m,*.mm,*.x,*.xm,*.py,*.pl,*.php,*.java,*.plist,*.strings,*.xml NERDTree

" NERDTress File highlighting
	function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
	endfunction

	call NERDTreeHighlightFile('c', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('h', 'Magenta', 'none', '#ff00ff', '#151515')
	call NERDTreeHighlightFile('hpp', 'Magenta', 'none', '#ff00ff', '#151515')
	call NERDTreeHighlightFile('m', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('mm', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('x', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('xm', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('go', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('java', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('pl', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
	call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('xml', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('html', 'blue', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
	call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" NERDTree start on directroy open
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" NerdTree Workman remapping
	let NERDTreeMenuDown = "n"
	let NERDTreeMenuUp = "e"
	let NERDTreeMapJumpLastChild = "N"
	let NERDTreeMapJumpFirstChild = "E"
	let NERDTreeMapOpenExpl = "k"
	let NERDTreeMapJumpNextSibling = ",N" "default <C-J>, but that's taken by our split navigation shortcut above
	let NERDTreeMapJumpPrevSibling = ",E" "default <C-J>, but that's taken by our split navigation shortcut above
	let NERDTreeMapOpenRecursively = "L"
	let NERDTreeMapActivateNode = "L" 

"-----------------------
"-    GitGutter Conf   -
"-----------------------
" Define a reasonable git-gutter limit
	let g:gitgutter_max_signs = 1000

" Default marks n and e for next and previous git hunks
	nmap 'n <Plug>(GitGutterNextHunk)
	nmap 'e <Plug>(GitGutterPrevHunk)
	nmap U <Plug>(GitGutterUndoHunk)
	" map 'n :GitGutterNextHunk<CR>
	" map 'e :GitGutterPrevHunk<CR>

"--------------------------------
"-    Auto Save/Close Actions   -
"--------------------------------
" LaTeX stuff
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	" autocmd VimLeave *.tex !texclear %
" Compiles on on write
	autocmd BufWritePost *.latex !xelatex %

" Lilypond stuff
"Compile on write
	autocmd BufWritePost *.ly !lilypond %

" Linux sysconfig stuff
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Push any ghostwriter updates automatically
	autocmd BufWritePost *.ghostwriter.html !ghostwriter_push "%"
	
" autocmd FileType go inoremap != ≠

" vimwiki
let personal_wiki = {}
let personal_wiki.path = '~/RnD/personal_wiki/wiki'
" let personal_wiki.html_template = '~/RnD/personal_wiki/public_html/template.tpl'
let personal_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'go': 'go'}

let medsec_wiki = {}
let medsec_wiki.path = '~/RnD/Work/Medsec/vimwiki/wiki/'
let medsec_wiki.index = 'main'
let medsec_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'go': 'go'}

let g:vimwiki_list = [personal_wiki, medsec_wiki]


inoremap ,A Ā
inoremap ,a ā
inoremap ,E Ē
inoremap ,e ē
inoremap ,I Ī
inoremap ,i ī
inoremap ,O Ō
inoremap ,o ō
inoremap ,U Ū
inoremap ,u ū

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

" Navigating with guides
	" inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	" vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	" map <Space><Tab> <Esc>/<++><Enter>"_c4l

"""LATEX
	" Word count:
	" autocmd FileType tex map <leader><leader>o :w !detex \| wc -w<CR>
	" Code snippets
	" autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	" autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	" autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	" autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	" autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	" autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	" autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	" autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	" autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	" autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	" autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	" autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	" autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	" autocmd FileType tex inoremap ,li <Enter>\item<Space>
	" autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	" autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	" autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	" autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	" autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	" autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	" autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	" autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	" autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	" autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	" autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	" autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	" autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	" autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	" autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	" autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	" autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	" autocmd FileType tex inoremap ,bt {\blindtext}
	" autocmd FileType tex inoremap ,nu $\varnothing$
	" autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	" autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
	" autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	" autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	" autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	" autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	" autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	" autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	" autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	" autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	" autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	" autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	" autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	" autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	" autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	" autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	" autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	" autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	" autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	" autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	" autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	" autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	" autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	" autocmd FileType html inoremap &<space> &amp;<space>
	" autocmd FileType html inoremap á &aacute;
	" autocmd FileType html inoremap é &eacute;
	" autocmd FileType html inoremap í &iacute;
	" autocmd FileType html inoremap ó &oacute;
	" autocmd FileType html inoremap ú &uacute;
	" autocmd FileType html inoremap ä &auml;
	" autocmd FileType html inoremap ë &euml;
	" autocmd FileType html inoremap ï &iuml;
	" autocmd FileType html inoremap ö &ouml;
	" autocmd FileType html inoremap ü &uuml;
	" autocmd FileType html inoremap ã &atilde;
	" autocmd FileType html inoremap ẽ &etilde;
	" autocmd FileType html inoremap ĩ &itilde;
	" autocmd FileType html inoremap õ &otilde;
	" autocmd FileType html inoremap ũ &utilde;
	" autocmd FileType html inoremap ñ &ntilde;
	" autocmd FileType html inoremap à &agrave;
	" autocmd FileType html inoremap è &egrave;
	" autocmd FileType html inoremap ì &igrave;
	" autocmd FileType html inoremap ò &ograve;
	" autocmd FileType html inoremap ù &ugrave;


""".bib
	" autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	" autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	" autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"""MARKDOWN
	" autocmd Filetype md,markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	" autocmd Filetype md,markdown,rmd inoremap ,n ---<Enter><Enter>
	" autocmd Filetype md,markdown,rmd inoremap ,b ****<++><Esc>F*hi
	" autocmd Filetype md,markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	" autocmd Filetype md,markdown,rmd inoremap ,e **<++><Esc>F*i
	" autocmd Filetype md,markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	" autocmd Filetype md,markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	" autocmd Filetype md,markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	" autocmd Filetype md,markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	" autocmd Filetype md,markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	" autocmd Filetype md,markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	" autocmd Filetype md,markdown,rmd inoremap ,l --------<Enter>
	" autocmd Filetype md,rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	" autocmd Filetype md,rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	" autocmd Filetype md,rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
	" autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	" autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"
