let $LANG = 'en'  "设置英文
set langmenu=en   "设置 gvim 为英文，注意 = 两边没有空格的

set guifont=Sarasa\ Mono\ SC

set nocompatible               "去除VIM一致性，必须"
filetype off                   "必须"

"设置包括vundle和初始化相关的运行时路径"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set rtp+=~/.vim/bundle/ctrlp.vim

"启用vundle管理插件，必须"
Plugin 'VundleVim/Vundle.vim'

"在此增加其他插件，安装的插件需要放在vundle#begin和vundle#end之间"
"安装github上的插件格式为 Plugin '用户名/插件仓库名'"

Plugin 'tpope/vim-fugitive'
Plugin 'grep.vim'
Plugin 'taglist.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathangrigg/vim-beancount'

Plugin 'preservim/nerdtree'
            \ | Plugin 'Xuyuanp/nerdtree-git-plugin'
"            \ | Plugin 'ryanoasis/vim-devicons'
Plugin 'kien/ctrlp.vim'
"Plugin 'liuchengxu/eleline.vim'

Plugin 'powerline/powerline'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 开启 YouCompleteMe 安装，去掉下面一行的注释
" Plugin 'Valloric/YouCompleteMe' "YouCompleteMe requires Vim 7.4.1578+, python3

" for flutter
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'

Plugin 'iamcco/markdown-preview.nvim'

" for rust
"Plugin 'rust-lang/rust.vim'
let g:ycm_semantic_triggers={'c,cpp,python,rust,java,go,erlang,perl,cs,lua,javascript':['re!\w{2}']}
let g:ycm_rust_src_path = '~/self/rust/rust-1.50.0/src/'

" 可选插件 pandoc-vim
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-latex/vim-latex'

" vim org mode
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'mattn/calendar-vim'
Plugin 'majutsushi/tagbar'
Plugin 'skywind3000/vim-rt-format', { 'do': 'pip3 install autopep8' }

let g:rtf_ctrl_enter = 0

" Enable formatting when leaving insert mode
let g:rtf_on_insert_leave = 1

set nofoldenable

"set laststatus=2
set encoding=UTF-8
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:NERDTreeGitStatusPorcelainVersion = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'!',
                \ 'Staged'    :'+',
                \ 'Untracked' :'u',
                \ 'Renamed'   :'*',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'x',
                \ 'Dirty'     :'|',
                \ 'Ignored'   :'-',
                \ 'Clean'     :'.',
                \ 'Unknown'   :'?',
                \ }

call vundle#end()            " required

syntax enable
filetype plugin indent on      "加载vim自带和插件相应的语法和文件类型相关脚本，必须"

autocmd FileType dart :call FlutterMenu()

" Some of these key choices were arbitrary;
" it's just an example.
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1

set nonu
set background=dark
syntax on

nnoremap <silent> <F3> :Grep<CR>

" switch windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

set backspace=indent,eol,start
" Taglist
let Tlist_Auto_Update=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=27
let Tlist_Show_One_File=1

"omnicppcomplete
set nocp
filetype plugin on
let g:OmniCpp_GlobalScopeSearch = 1
let g:OmniCpp_NamespaceSearch = 1

"color
color molokai
"set t_Co=256

"ctags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q  .<CR> <Esc>:set tags+=./tags <CR>

filetype indent on
"set path+=/usr/include
set listchars=tab:>-,trail:%
set list
"paste module
set pastetoggle=<F11>
"设定 tab 宽度为 4 个字符
set tabstop=4
"设定自动缩进为 4 个字符
set shiftwidth=4
"用 space 替代 tab 的输入
set expandtab
"不用 space 替代 tab 的输入
"set noexpandtab

set encoding=utf-8

set laststatus=2

"第80行之后高亮显示
hi LineTooLong ctermfg=223
au BufWinEnter *.py,*.h,*.cc let w:m1=matchadd('Search', '\%>79v', -1)
au BufWinEnter *.py,*.h,*.cc let w:m2=matchadd('LineTooLong', '\%>79v.\+', -1)
au BufWinEnter *.py,*.h,*.cc let w:m2=matchadd('LineTooLong', '^ +$', -1)

" highlight search
set hlsearch

" py highlight
let python_highlight_builtins = 1
let python_highlight_builtin_objs = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 1
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 1
let python_highlight_doctests = 1
let python_highlight_all = 1
let python_print_as_function = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete

augroup filetype
au! BufRead,BufNewFile *.proto set filetype=proto
au! BufRead,BufNewFile *.txt,*.INFO,*.ERROR,*.WARNING set filetype=python
au! BufRead,BufNewFile CMakeLists.txt set filetype=cmake
au! BufRead,BufNewFile *.rs set filetype=rust
au! BufRead,BufNewFile SConstruct,SConscript set filetype=python
augroup end

noremap <F2> <ESC>:TlistToggle<CR>
inoremap <C-F2> <ESC>:TlistToggle<CR>
"NERD_tree
noremap <F3> <ESC>:NERDTreeToggle<CR>
inoremap <F3> <ESC>:NERDTreeToggle<CR>
"switch h, cc
noremap <leader>av :AV<CR>

set ic
set incsearch
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"自动加载~/tags下的文件
execute "set tags+=" . system("ls -l ~/tags/ | grep -v ^total | awk 'BEGIN{a=\"\"}{if (a != \"\") a = a \",\"; a=a \"~/tags/\" $NF} END{print a}'")

" https://agentzh.org/misc/.vimrc


"自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-]>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-[>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28 "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1 "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1 "在左侧窗口中显示taglist窗口


" Ctrlp setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"vim orgmode
packloadall
silent! hellptags ALL
let g:org_agenda_files=['~/self/org/orgmode.org']
let g:org_todo_keywords=['TODO', 'FEEDBACK', 'VERIFY', '|', 'DONE', 'DELEGATED']

