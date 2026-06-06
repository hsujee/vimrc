# Vim配置使用说明

> 基于 Vim 8+ / Neovim，使用 `vim-plug` 管理插件，集成了代码补全、语法检查、文件搜索、Git 集成等现代 IDE 功能。

## 1 目录

- [2 安装](#2-安装)
- [3 插件列表](#3-插件列表)
- [4 关键插件详细说明](#4-关键插件详细说明)
- [5 自定义快捷键](#5-自定义快捷键)
- [6 基础设置](#6-基础设置)
- [7 依赖要求](#7-依赖要求)
- [8 更新与维护](#8-更新与维护)
- [9 参考资源](#9-参考资源)

## 2 安装

### 2.1 克隆仓库

```bash
git clone https://github.com/hsujee/vimrc.git ~/.vim
```

### 2.2 创建软链接

```bash
ln -sf ~/.vim/vimrc ~/.vimrc
```



### 2.3 安装 vim-plug（如未安装）

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 2.4 安装插件

启动 Vim 并运行：

```bash
:PlugInstall
```

### 2.5 配置 coc.nvim（可选）

安装语言服务器扩展（示例）：

```bash
:CocInstall coc-clangd coc-pyright coc-java coc-sh coc-tsserver
```

## 3 插件列表

### 3.1 界面美观与辅助

| 插件                        | 说明                    |
| :-------------------------- | :---------------------- |
| `itchyny/lightline.vim`     | 轻量级状态栏（备选）    |
| `azabiong/vim-highlighter`  | 临时高亮光标下的单词    |
| `Yggdroot/indentLine`       | 可视化显示缩进线        |
| `easymotion/vim-easymotion` | 快速移动光标            |
| `preservim/nerdtree`        | 经典文件树浏览器        |
| `majutsushi/tagbar`         | 代码大纲（函数/类列表） |
| `wesleyche/SrcExpl`         | IDE 风格上下文预览窗口  |

### 3.2 状态栏增强

| 插件                             | 说明           |
| :------------------------------- | :------------- |
| `vim-airline/vim-airline`        | 强大的状态栏   |
| `vim-airline/vim-airline-themes` | airline 主题包 |

### 3.3 代码搜索与导航

| 插件               | 说明                     |
| :----------------- | :----------------------- |
| `Yggdroot/LeaderF` | 模糊查找文件、缓冲区等   |
| `rking/ag.vim`     | 基于 `ag` 的全局文本搜索 |

### 3.4 智能补全与 IDE 功能

| 插件                | 说明                                     |
| :------------------ | :--------------------------------------- |
| `neoclide/coc.nvim` | LSP 客户端，提供智能补全、跳转、错误提示 |

### 3.5 编辑效率增强

| 插件                   | 说明                     |
| :--------------------- | :----------------------- |
| `tpope/vim-surround`   | 快速修改括号、引号、标签 |
| `jiangmiao/auto-pairs` | 自动补全成对的括号、引号 |

### 3.6 版本控制与代码检查

| 插件                     | 说明                    |
| :----------------------- | :---------------------- |
| `tpope/vim-fugitive`     | Git 集成                |
| `airblade/vim-gitgutter` | 侧边栏显示 Git 修改标记 |
| `dense-analysis/ale`     | 异步语法检查            |

## 4 关键插件详细说明

### 4.1 coc.nvim（智能补全核心）

**功能**：基于 LSP 的补全引擎，提供 IDE 级的智能补全、函数跳转、实时错误提示、代码重构等功能。

**使用方式**：

| 操作              | 命令/快捷键               | 说明                         |
| :---------------- | :------------------------ | :--------------------------- |
| 安装扩展          | `:CocInstall <extension>` | 例如 coc-clangd、coc-pyright |
| 查看扩展          | `:CocList extensions`     | 管理已安装扩展               |
| 查看状态          | `:CocInfo`                | 显示 coc.nvim 运行信息       |
| 编辑配置          | `:CocConfig`              | 打开用户配置文件             |
| 跳转到定义        | `gd`                      | 光标在符号上时               |
| 查找引用          | `gr`                      | 显示符号的所有引用位置       |
| 悬浮文档          | `K`                       | 显示当前符号的文档           |
| 上一个/下一个错误 | `[g` / `]g`               | 在诊断错误之间跳转           |
| 重命名符号        | `<Leader>rn`              | 自动重命名变量/函数          |

**配置方法**：

配置文件位置：`~/.vim/coc-settings.json`

示例配置（支持多语言）：

```json
{
  "languageserver": {
    "clangd": {
      "command": "clangd",
      "filetypes": ["c", "cpp"]
    }
  },
  "coc.preferences": {
    "formatOnSave": true,
    "diagnostic.virtualText": true
  },
  "suggest": {
    "autoTrigger": true,
    "snippetsSupport": true
  }
}
```

更推荐使用官方扩展（如 `coc-clangd`），此时无需手动配置 `languageserver`。

### 4.2 LeaderF（模糊查找神器）

**功能**：高性能模糊查找器，支持文件、缓冲区、MRU、tags 等。

**使用方式**：

| 命令               | 说明                          |
| :----------------- | :---------------------------- |
| `:LeaderfFile`     | 在当前目录查找文件            |
| `:LeaderfBuffer`   | 在打开的缓冲区中查找          |
| `:LeaderfMru`      | 查找最近使用的文件            |
| `:LeaderfTag`      | 查找 tags（需生成 tags 文件） |
| `:LeaderfLine`     | 在当前文件中查找行            |
| `:LeaderfFunction` | 查找函数列表（需 tags）       |

**LeaderF 窗口内快捷键**：

| 快捷键            | 功能            |
| :---------------- | :-------------- |
| `<C-j>` / `<C-k>` | 上下移动        |
| `<C-n>` / `<C-p>` | 下一页 / 上一页 |
| `<CR>`            | 打开选中项      |
| `<C-x>`           | 水平分屏打开    |
| `<C-v>`           | 垂直分屏打开    |
| `<Esc>`           | 退出            |

**配置方法**（可选，放入 `.vimrc`）：

```bash
" 让 LeaderF 使用更快的模糊算法
let g:Lf_UseVersionControlTool = 0
let g:Lf_ShortcutF = '<Leader>f'
" 不显示帮助提示（界面更干净）
let g:Lf_HideHelp = 1
```

### 4.3 tagbar（代码大纲）

**功能**：侧边栏显示当前文件的代码结构（函数、类、变量等），依赖 `ctags`。

**使用方式**：

- 快捷键 `<F8>` 切换打开/关闭 tagbar 窗口。
- 在 tagbar 窗口中使用方向键或鼠标单击，可跳转到对应符号定义。

**配置方法**（已预设）：

```bash
let g:tagbar_position = 'right'    " 窗口在右侧
let g:tagbar_width = 40            " 宽度
let g:tagbar_singleclick = 1       " 单击跳转
```

如需生成 tags 文件，在项目根目录运行：

```bash
ctags -R .
```

### 4.4 vim-airline（状态栏美化）

**功能**：增强底部状态栏，显示 Vim 模式、文件名、Git 分支、行号、列号、诊断数量等。

**使用方式**：无需额外操作，安装后自动生效。

**配置方法**：

```bash
" 启用 Powerline 字体支持
let g:airline_powerline_fonts = 1
" 顶部显示标签栏（类似浏览器标签页）
let g:airline#extensions#tabline#enabled = 1
" 更换主题（可选 bubblegum, molokai, solarized）
let g:airline_theme = 'bubblegum'
```

**注意**：需要安装 Powerline 字体并将终端字体设置为该字体（如 `Meslo LG M for Powerline`）。

### 4.5 vim-surround（快速编辑括号/引号/标签）

**功能**：添加、修改、删除成对的符号（括号、引号、HTML/XML 标签）。

**使用方式**（Normal 模式）：

| 操作    | 效果                                 |
| :------ | :----------------------------------- |
| `ds"`   | 删除光标所在位置的双引号对           |
| `cs"'`  | 将双引号改为单引号                   |
| `ysiw)` | 在光标所在的单词两侧加上括号         |
| `yss)`  | 在当前行整行两侧加上括号             |
| `S"`    | 在可视模式下，为选中的内容加上双引号 |

**示例**：将 `"Hello"` 改为 `'Hello'`：光标停在单词内，执行 `cs"'`。

**配置方法**：无需配置，安装即用。

### 4.6 auto-pairs（自动补全括号）

**功能**：输入左括号时自动补全右括号，并智能处理引号、方括号、花括号。

**使用方式**：安装后自动生效，无需映射。

**特性**：

- 自动跳过已存在的右括号
- 同时删除一对括号（在右括号上按退格键）
- 在花括号内按回车自动换行并增加缩进

**配置方法**（可选）：

```bash
" 禁用某些文件类型的自动配对
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"'}
let g:AutoPairsShortcutToggle = '<C-a>'  " 按 Ctrl+a 临时开关
```

### 4.7 vim-fugitive（Git 集成）

**功能**：在 Vim 内执行 Git 命令。

**使用方式**：

| 命令          | 说明                                 |
| :------------ | :----------------------------------- |
| `:Git status` | 显示 `git status` 结果（专用缓冲区） |
| `:Git commit` | 提交更改                             |
| `:Git diff`   | 查看差异                             |
| `:Git blame`  | 显示每一行的提交信息                 |
| `:Gwrite`     | 将当前文件添加到暂存区               |
| `:Gread`      | 撤销未提交的更改                     |

在 `:Git status` 缓冲区中，可使用以下快捷键：

| 快捷键 | 功能              |
| :----- | :---------------- |
| `-`    | 暂存/取消暂存文件 |
| `dd`   | 丢弃文件更改      |
| `cc`   | 提交              |
| `?`    | 显示帮助          |

**配置方法**：无需配置，安装即用。

### 4.8 vim-gitgutter（行级 Git 标记）

**功能**：在行号左侧实时显示 Git 修改标记（`+` 新增、`~` 修改、`-` 删除）。

**使用方式**：

| 操作         | 说明                         |
| :----------- | :--------------------------- |
| `[c` / `]c`  | 跳转到上一个/下一个修改块    |
| `<Leader>hs` | 暂存当前修改块（hunk stage） |
| `<Leader>hr` | 撤销当前修改块（hunk reset） |

**配置方法**：

```bash
" 更新间隔（毫秒）
let g:gitgutter_update_on_focus = 1
let g:gitgutter_max_signs = 1000
" 自定义符号
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
```

### 4.9 ALE（异步代码检查）

**功能**：后台异步运行 linter，实时标记错误和警告，不阻塞编辑。

**使用方式**：

| 操作        | 说明                              |
| :---------- | :-------------------------------- |
| `[e` / `]e` | 跳转到上一个/下一个错误           |
| `<Leader>e` | 显示当前行的详细错误信息          |
| `:ALEFix`   | 自动修复（如 prettier、autopep8） |

**配置方法**：

```bash
" 指定每个文件类型使用的 linter
let g:ale_linters = {
\   'python': ['pylint', 'flake8'],
\   'c': ['clang', 'gcc'],
\   'cpp': ['clang', 'gcc'],
\   'javascript': ['eslint'],
\}
" 自动修复工具
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'black'],
\}
" 在保存时自动修复
let g:ale_fix_on_save = 1
```

## 5 自定义快捷键

| 快捷键      | 模式   | 功能                       |
| :---------- | :----- | :------------------------- |
| `ss`        | Normal | easymotion 二字符快速跳转  |
| `<C-n>`     | Normal | 打开/关闭 NERDTree 文件树  |
| `<F1>`      | Normal | 底部打开 15 行高终端窗口   |
| `<F4>`      | Normal | 跳转到匹配的括号           |
| `<F5>`      | Normal | 打开光标下函数的定义窗口   |
| `<F6>`      | Normal | 关闭定义窗口               |
| `<F8>`      | Normal | 打开/关闭 Tagbar 代码大纲  |
| `zz`        | Insert | 退出插入模式（相当于 Esc） |
| `<Leader>/` | Normal | 清除搜索高亮               |
| `<Leader>y` | Visual | 复制到系统剪贴板           |
| `<Leader>p` | Normal | 粘贴系统剪贴板内容         |
| `dg`        | Normal | 删除从光标到文件开头       |
| `dG`        | Normal | 删除从光标到文件结尾       |
| `<`         | Normal | quickfix 列表上一个结果    |
| `>`         | Normal | quickfix 列表下一个结果    |

> Leader 键默认为空格（``）。可通过 `let mapleader = " "` 自定义。

## 6 基础设置

```bash
filetype plugin indent on      " 根据文件类型加载缩进规则
syntax on                      " 语法高亮
set number                     " 显示行号
set relativenumber             " 相对行号
set cursorline                 " 高亮当前行
set expandtab                  " 使用空格代替制表符
set shiftwidth=4 softtabstop=4 " 缩进宽度 4 空格
set autoindent                 " 自动缩进
set ignorecase                 " 搜索忽略大小写
set incsearch hlsearch         " 增量搜索 + 高亮结果
set encoding=utf-8             " 全局编码
set fileencodings=utf-8,gb18030,gbk   " 中文兼容
```

## 7 依赖要求

| 工具                       | 安装命令 (Ubuntu/Debian)             |
| :------------------------- | :----------------------------------- |
| `ag` (The Silver Searcher) | `sudo apt install silversearcher-ag` |
| `ctags`                    | `sudo apt install exuberant-ctags`   |
| Node.js (for coc.nvim)     | `sudo apt install nodejs npm`        |
| Powerline 字体 (可选)      | `sudo apt install fonts-powerline`   |

> 若使用 Airline 特殊符号，需将终端字体设置为 Powerline 字体（如 `Fira Code`、`Meslo`）。

## 8 更新与维护

- 安装新插件：在 `~/.vimrc` 中添加 `Plug 'xxx/yyy'`，然后运行 `:PlugInstall`
- 更新所有插件：`:PlugUpdate`
- 清理未使用的插件：`:PlugClean`

## 9 参考资源

- [vim-plug](https://github.com/junegunn/vim-plug)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

------

## 许可证

MIT License
