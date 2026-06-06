" ============================================================================
"  Plug 插件配置
" ============================================================================
" 使用 vim-plug 管理插件，目录为 ~/.vim/plugged
call plug#begin('~/.vim/plugged')

    " === 1. 界面美观与辅助 ==="
    " 轻量级状态栏 (与 vim-airline 二选一，目前保留以作备选)
    Plug 'itchyny/lightline.vim'
    " 临时高亮光标下的单词
    Plug 'azabiong/vim-highlighter'
    " 可视化显示缩进线，对 Python 等语言友好
    Plug 'Yggdroot/indentLine'
    " 革命性的快速移动工具，显著提升光标跳转效率
    Plug 'easymotion/vim-easymotion'
    " 经典的侧边栏文件树浏览器 (可选，键盘流可通过 LeaderF 替代)
    Plug 'preservim/nerdtree'
    " 强大的代码大纲工具，侧边栏显示函数/类列表 (Tagbar 是 Taglist 的现代替代)
    Plug 'majutsushi/tagbar'
    " IDE 风格的上下文预览窗口 (依赖 tagbar 或 ctags)
    Plug 'wesleyche/SrcExpl'

    " === 2. 状态栏增强 (二选一，vim-airline 更流行) ==="
    " 热门的状态栏增强插件，功能丰富，可配合 airline-themes 更换主题
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " === 3. 代码搜索与导航 ==="
    " 高性能模糊查找器，可找文件、缓冲区、历史记录等
    " 使用 SSH 协议克隆（解决 GnuTLS recv error）
    Plug 'git@github.com:Yggdroot/LeaderF.git'
    " 基于 ag (The Silver Searcher) 的全局文本搜索工具，需要系统安装 ag
    Plug 'rking/ag.vim'

    " === 4. 核心：智能补全与 IDE 功能 (coc.nvim 是现代 Vim 配置的核心) ==="
    " 提供 LSP 支持，实现智能补全、跳转、实时错误提示等 IDE 功能
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " === 5. 体验：效率与编辑增强 ==="
    " 快速处理括号、引号、XML/HTML 标签 (例如: cs"' 将 " 改为 ')
    Plug 'tpope/vim-surround'
    " 自动补全成对的括号、引号等 (已替代手动映射)
    Plug 'jiangmiao/auto-pairs'

    " === 6. 专业：版本控制与代码检查 ==="
    " 在 Vim 内执行所有 Git 操作 (如 :Git commit, :Git blame)
    Plug 'tpope/vim-fugitive'
    " 在侧边栏实时显示 Git 修改行标记 (+/-/~)
    Plug 'airblade/vim-gitgutter'
    " 异步代码检查，实时标出语法和风格错误
    Plug 'dense-analysis/ale'

call plug#end()


" ============================================================================
"  Airline 状态栏配置
" ============================================================================
" 启用 Powerline 字体支持（需要安装 Powerline 字体）
let g:airline_powerline_fonts = 1
" 在顶部显示缓冲区/标签栏（类似编辑器标签页）
let g:airline#extensions#tabline#enabled = 1
" 主题配色（可选：bubblegum, molokai, solarized, dark 等）
" let g:airline_theme='bubblegum'

" 自定义 Airline 符号（如果 Powerline 字体不可用时的备选）
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" 左侧分隔符
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
" 右侧分隔符
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
" 行号符号
let g:airline_symbols.linenr = ' ¶'
" Git 分支符号
let g:airline_symbols.branch = '⎇'
" 列号符号
let g:airline_symbols.colnr = ' ℅:'


" ============================================================================
"  基础编辑器设置
" ============================================================================
" 根据文件类型加载插件和缩进规则
filetype plugin indent on
" 启用语法高亮
syntax on
" 始终显示状态栏
set laststatus=2
" 禁用 vi 兼容模式（必须，启用 Vim 特有功能）
set nocompatible

" 缩进设置
set autoindent          " 保持上一行缩进
set expandtab           " 用空格代替制表符（推荐 Python/通用）
set softtabstop=4       " Tab 键缩进 4 个空格
set shiftwidth=4        " >>/<< 缩进 4 个空格
set shiftround          " >> 缩进到 shiftwidth 的倍数
" 注意：如果编辑 Makefile 需要制表符，建议用 autocmd 覆盖
" autocmd FileType make setlocal noexpandtab

" 编辑行为优化
set backspace=indent,eol,start  " 退格键可删自动缩进、换行、插入内容
set hidden                      " 切换缓冲区无需先保存
set display=lastline            " 尽量显示完整的最后一行（而非 @）
set showmode                    " 命令行显示当前模式
set showcmd                     " 显示已输入的按键（部分）
set incsearch                   " 输入搜索词时逐字符高亮
set hlsearch                    " 保持搜索高亮
set number                      " 显示行号
set relativenumber              " 相对行号（与绝对行号结合使用）
set ignorecase                  " 搜索忽略大小写
set cursorline                  " 高亮当前行
" set cursorcolumn               " 高亮当前列（可选，视觉负担较大）
set fo-=r                       " 取消自动插入注释符（避免换行时自动补注释）

" 编码与中文支持
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 空格键作为 Leader 键（用于自定义快捷键）
let mapleader = " "


" ============================================================================
"  快捷键映射
" ============================================================================
" 行操作（更安全的版本）
nnoremap dg dgg     " 删除到文件开头
nnoremap dG dG      " 删除到文件结尾

" easymotion 快速跳转（双击 s 触发二字符搜索）
nmap ss <Plug>(easymotion-s2)

" 系统剪贴板交互（使用 Leader 键避免冲突）
vnoremap <Leader>y "+y        " Visual 模式复制到系统剪贴板
nnoremap <Leader>p "+p        " Normal 模式粘贴系统剪贴板内容
" 保留原有的 Ctrl 键映射（如冲突可删除）
vnoremap <C-y> "+y
nnoremap <C-p> "*p

" 清除搜索高亮（按 Leader+/）
nnoremap <Leader>/ :nohlsearch<CR>

" NERDTree 文件树
map <C-n> :NERDTreeToggle<CR>

" 内置终端（底部 15 行高）
noremap <F1> :bot term++rows=15<Enter>

" 括号匹配（跳转匹配的括号）
map <F4> <S-%>

" 窗口跳转与关闭（函数定义）
map <F5> <C-w>]          " 打开函数定义窗口
map <F6> <C-w>c          " 关闭定义窗口

" Tagbar 代码大纲（F8 开关，替代旧的 Taglist）
nnoremap <silent> <F8> :TagbarToggle<CR>

" 插入模式快速退出
imap zz <Esc>

" quickfix 列表导航（配合 cscope/编译器）
map < :cprevious<CR>     " 上一个错误/匹配项
map > :cnext<CR>         " 下一个错误/匹配项


" ============================================================================
"  Tagbar 配置（代码大纲，Taglist 的现代替代）
" ============================================================================
" 设置 ctags 命令路径
let g:tagbar_ctags_bin = 'ctags'
" 设置窗口位置为右边
let g:tagbar_position = 'right'
" 设置宽度
let g:tagbar_width = 40
" 单击跳转
let g:tagbar_singleclick = 1
" 自动关闭
let g:tagbar_autoclose = 1
" 在不显示时仍然解析 tags
let g:tagbar_autofocus = 0


" ============================================================================
"  Cscope 配置（代码符号索引，用于大型项目）
" ============================================================================
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " 优先使用当前目录下的 cscope.out，否则使用环境变量指定的
    if filereadable("./cscope.out")
        cs add ./cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

" 设置 quickfix 窗口自动填充 cscope 搜索结果
set cscopequickfix=e-,i-,s-,t-

" Cscope 常用查找命令（未映射快捷键，按需手动使用）
" :cs find s <symbol>  : 查找 C 符号
" :cs find g <symbol>  : 查找定义
" :cs find c <symbol>  : 查找调用
" :cs find t <symbol>  : 查找字符串


" ============================================================================
"  vim-highlighter 插件配置（高亮光标下单词）
" ============================================================================
" 快捷键映射（按需启用/取消/清除高亮）
let HiSet   = 'f<CR>'     " 设置高亮：按 f 然后回车
let HiErase = 'f<BS>'     " 擦除当前高亮：按 f 然后退格
let HiClear = 'f<C-L>'    " 清除所有高亮：按 f 然后 Ctrl+L
let HiFind  = 'f<Tab>'    " 查找高亮：按 f 然后 Tab
let HiSetSL = 't<CR>'     " 设置单行高亮：按 t 然后回车

" 跳转快捷键（使用 Enter/退格等在高亮项之间移动）
nn <CR>     <Cmd>Hi><CR>
nn g<CR>    <Cmd>Hi<<CR>
nn [<CR>    <Cmd>Hi{<CR>
nn ]<CR>    <Cmd>Hi}<CR>

" 查找方向快捷键
nn -        <Cmd>Hi/next<CR>
nn _        <Cmd>Hi/previous<CR>
nn f<Left>  <Cmd>Hi/older<CR>
nn f<Right> <Cmd>Hi/newer<CR>

" 注释颜色（高亮注释显示为青色）
hi Comment ctermfg=6


" ============================================================================
"  旧版 Taglist 配置（已弃用，保留仅供参考）
" ============================================================================
" 注意：Taglist 已停止维护，Tagbar 是更好的替代方案
" 以下配置已注释，如需使用请取消注释并注释上面的 Tagbar 配置
" let Tlist_Ctags_Cmd = 'ctags'
" let Tlist_Show_One_File = 1
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_Use_SingleClick = 1
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Process_File_Always = 1
" nnoremap <silent> <F2> :TlistToggle<CR>


" ============================================================================
"  其他未启用的配置（参考/待用）
" ============================================================================
" 在光标所在行末尾插入日期
" map <F2> :s/$/\=   strftime(" %Y-%m-%d")<Enter>
" map <F2> :s/$/\=   strftime("    %Y-%m-%d %H:%M:%S")<Enter>

" 项目级别搜索（需自行实现搜索函数）
" map <F7> :call CS_Search_Word()<CR>
" map <F9> :call Search_Word()<CR>
" map <F11> :call CS_Search_calledfunc()<CR>
" map <F12> :call CS_Search_whatfunc()<CR>

" 关闭 quickfix 弹出窗口
" map <F8> :cclose<CR>

" 显示空白字符（空格/tab）
" set list listchars=tab:»·,trail:·,extends:>,precedes:<

" 自动重新加载外部修改的文件
" set autoread
