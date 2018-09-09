" 插件
call plug#begin("~/.vimplug")
  Plug 'airblade/vim-gitgutter'
  Plug 'chiel92/vim-autoformat'
  Plug 'easymotion/vim-easymotion'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'honza/vim-snippets' | Plug 'sirver/ultisnips'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', {'dir': '~/.fzf'}
  Plug 'junegunn/fzf.vim'
  Plug 'lilydjwg/colorizer', {'for': ['html', 'css', 'less', 'scss']}
  Plug 'majutsushi/tagbar'
  Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
  Plug 'mbbill/undotree'
  Plug 'nlknguyen/papercolor-theme'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'valloric/Youcompleteme'
  Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  " Plug 'ryanoasis/vim-devicons'
call plug#end()

" -------------------------- 外观设置 --------------------------
set background=dark
set backspace=2
set cursorline
set laststatus=2
set mouse=a
set mousehide
set noshowmode
set ruler
set shortmess=atI
set wildignore=*.o,*~,*.swp,*.bak,*.pyc,*.class,.svn,.git
set wildmenu
filetype plugin indent on
color PaperColor
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins': 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins': 1
  \     }
  \   }
  \ }
" set termguicolors

set number rnu
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


" -------------------------- 编辑器行为 --------------------------
set modeline
set autoread
" 上次编辑位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" Tab与缩进
set autoindent
set cindent
set ts=4 sts=4 sw=4
set expandtab
set nowrap

" 代码折叠
set foldenable
set foldcolumn=0
set foldmethod=indent
set foldlevelstart=99

" 临时文件
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" 字符编码
set encoding=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,gb18030,latin1
set tenc=utf-8
set fileformat=unix
set nobomb

" 搜索选项
set hls
set incsearch
set ignorecase
set smartcase
noremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>


" -------------------------- 键盘设置 --------------------------
let mapleader=","
set whichwrap+=<,>,h,l
nnoremap <silent><F7> :cope<CR>
noremap j gj
noremap k gk
nnoremap gj j
nnoremap gk k
" 设置折叠级别
nnoremap z0 :set foldlevel=0<CR>
nnoremap z1 :set foldlevel=1<CR>
nnoremap z2 :set foldlevel=2<CR>
nnoremap z3 :set foldlevel=3<CR>
nnoremap z9 :set foldlevel=99<CR>



" -----------------------------  misc ----------------------------
nnoremap <silent><F2> :NERDTreeToggle<CR>
nnoremap <silent><F3> :TagbarToggle<CR>
nnoremap <C-F3>       :UndotreeToggle<CR>
nnoremap <leader>ff :Autoformat<CR>
let g:user_emmet_expandabbr_key = '<c-e>'
let g:used_javascript_libs = 'jquery,angularjs,vue,react'
let g:vim_markdown_fenced_languages = ['csharp=cs', 'js=javascript', 'bash=sh', 'c++=cpp']


" ------------------------------- vim-airline ---------------------------------
let g:airline_theme = 'light'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" 缩写vim模式
let g:airline_mode_map = {
\  '__' : '-',
\  'n'  : 'N',
\  'i'  : 'I',
\  'R'  : 'R',
\  'c'  : 'C',
\  'v'  : 'V',
\  'V'  : 'V',
\  '' : 'V',
\  's'  : 'S',
\  'S'  : 'S',
\  '' : 'S',
\  }

" ---------------------------------- FZF-vim ----------------------------------
nnoremap <C-p> :Files<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>

" 快速切换颜色主题
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" 在fzf中集成git grep， ag(the_silver_searcher)， rg(ripgrep)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" ------------------------------------ tagbar -----------------------------------
let g:tagbar_iconchars = ['▶', '▼']
let g:tagbar_type_css = {
\ 'ctagstype' : 'css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
    \ }
" 集成gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_type_rust = {
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits',
      \'i:impls,trait implementations',
  \]
  \}
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

" -------------------------- NERDTree -----------------------------
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode = 2
" 不在NERDTree中显示下列文件（夹）
let NERDTreeIgnore = [
\  '\.class$',   '\.pyc$',         '\~$',        '\.git',   '\.svn',
\  '\.hg',       'node_modules',   '\.vscode',   '\.o$',    '\.so$',
\  '\.a$',       '\.dll$',         '\.lib$',     '\.iso$',  '\.rar$',
\  '\.7z$',      '__pycache__',    '\.EXE$',     '\.pyc$',  '\.pyd$',
\  '\.exe$',     '\.msi$',         '^NTUSER',    '^ntuser'
\  ]



" --------------------------- ale ------------------------------
" lint触发条件
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
" 设置error和warning的提示符
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠ '
" 通知栏标示
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" ---------------------------------- YouCompleteMe  ----------------------------------
set completeopt=longest,menu
let g:ycm_add_preview_to_completeopt = 0 " 不显示预览框
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 不从注释与字符串中收集匹配项
let g:ycm_collect_identifiers_from_tags_files=1 " 从ctags中收集匹配项
let g:ycm_complete_in_strings = 0 " 不在字符串中启用补全
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' " 全局配置文件
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1 " 启用关键字补全
let g:ycm_complete_in_comments = 0 " 不在注释中启用补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_semantic_triggers =  {
      \ 'python': ['from ', 'import ', '.']
      \ }
let g:ycm_filetype_blacklist = {
      \ 'help': 1,
      \ 'vim-plug': 1,
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'text': 1,
      \ 'markdown': 1,
      \ 'gitcommit': 1
      \}

" vim:fdm=indent:noai:ts=2:sw=2

