"------------------------------------------------------------------------------------------------
" vundle.vim
"------------------------------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

"if has('mac')
"  set macmeta
"  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_mac.so'
"elseif has('win32')
"  let g:vimproc_dll_path = $HOME . 'vimfiles/bundle/vimproc/autoload/vimproc_win32.dll'
"elseif has('win64')
"  let g:vimproc_dll_path = $HOME . 'vimfiles/bundle/vimproc/autoload/vimproc_win64.dll'
"endif
"

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'mattn/webapi-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'gregsexton/VimCalc'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'h1mesuke/unite-outline'
Bundle 'vim-scripts/django.vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'lambdalisue/vim-python-virtualenv'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'digitaltoad/vim-jade'
Bundle 'digitaltoad/vim-pug'
Bundle 'itchyny/calendar.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'moll/vim-node'
Bundle 'plasticboy/vim-markdown'
Bundle 'koron/codic-vim'
Bundle 'wavded/vim-stylus'
Bundle 'simeji/winresizer'
Bundle 'ryym/vim-riot'
Bundle 'vim-scripts/glsl.vim'
Bundle 'posva/vim-vue'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

filetype plugin indent on
filetype indent on
syntax on

"------------------------------------------------------------------------------------------------
"基本設定
"------------------------------------------------------------------------------------------------
set visualbell t_vb=
set nocompatible                 " vi互換なし
let mapleader = ","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set wrap                         " 折り返し
set showbreak=++                 " 折り返し行の先頭文字
set shortmess+=I                 " 起動時のメッセージを表示しない
set notitle                      " タイトル
set showtabline=2                " TABページの設定
set autochdir                    " アクティブなファイルをカレントディレクトリ
set mouse=a                      " ターミナルでマウスを使用できるようにする
set guioptions+=a
"set ttymouse=xterm2
set backupcopy=yes
set noundofile
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
    set clipboard& clipboard+=unnamedplus,unnamed
else
    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
    set clipboard& clipboard+=unnamed
endif

" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-K>  <ESC>"*pa

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

"スラッシュ区切り
set shellslash
:set formatoptions=Mm

autocmd QuickfixCmdPost make copen   "makeの後自動でQuickfixをopen

"<esc>
inoremap <C-Space> <esc>
vnoremap <C-Space> <esc>
noremap <C-Space> <esc>


"------------------------------------------------------------------------------------------------
"補完・履歴
"------------------------------------------------------------------------------------------------
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加

" -- tabでオムニ補完
function! InsertTabWrapper()
if pumvisible()
return "\<c-n>"
endif
let col = col('.') - 1
if !col || getline('.')[col -1] !~ '\k\|<\|/'
return "\<tab>"
elseif exists('&omnifunc') && &omnifunc == ''
return "\<c-n>"
else
return "\<c-x>\<c-o>"
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"------------------------------------------------------------------------------------------------
" 検索 search
"------------------------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<enter>

"置換
noremap <s-f> :%s///gc<left><left><left><left>
"検索結果を中心に
"noremap n nzz
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
"選択した文字列を置換（置換後のほうにも選択文字列をインサート）
vnoremap /gr "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>/<C-R>=escape(@x, '\\/.*$^~[]')<CR>/gc<Left><Left><Left>
"s*置換後文字列/g<Cr>でカーソル下のキーワードを置換
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Ctrl-iでヘルプ
nnoremap <C-i><C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-o> :<C-u>help<Space><C-r><C-w><Enter>

" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
set grepprg=grep\ -nh

" 連番に置換
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"------------------------------------------------------------------------------------------------
"インデント
"------------------------------------------------------------------------------------------------
set autoindent   " 自動でインデント
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める
set shiftround   " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=1 shiftwidth=2 softtabstop=0
"------------------------------------------------------------------------------------------------
"表示系
"------------------------------------------------------------------------------------------------
"gui無し
set guioptions-=m guioptions-=T
set guioptions-=r "右スクロールバーなし
set guioptions-=R
set guioptions-=l "左スクロールバーなし
set guioptions-=L
set guioptions-=b "下スクロールバーなし
set showmatch         " 括弧の対応をハイライト
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set matchtime=3       " 対応括弧のハイライト表示を3秒にする
set number            " 行番号表示
set list              " 不可視文字表示
set display=uhex      " 印字不可能文字を16進数で表示
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%,eol:↲ " 不可視文字の表示形式

"全角スペースを視覚化
if has('syntax')
syntax enable
function! ActivateInvisibleIndicator()
highlight ZenkakuSpace cterm=underline ctermfg=grey gui=underline guifg=#FF0000
match ZenkakuSpace /＿/
endfunction
augroup InvisibleIndicator
autocmd!
autocmd BufEnter * call ActivateInvisibleIndicator()
augroup END
endif

set cursorline " カーソル行をハイライト
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
:set lazyredraw     " コマンド実行中は再描画しない
:set ttyfast        " 高速ターミナル接続を行う
" 折りたたみの記憶
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options
" 折りたたみ作成 (, { => ), }
noremap <c-d><c-d> v%zf

"fullscreen f11でtoggle
nnoremap <F11> :call ToggleFullScreen()<CR>
function! ToggleFullScreen()
  if &guioptions =~# 'C'
      set guioptions-=C
      if exists('s:go_temp')
          if s:go_temp =~# 'm'
              set guioptions+=m
          endif
          if s:go_temp =~# 'T'
              set guioptions+=T
          endif
      endif
      simalt ~r
  else
      let s:go_temp = &guioptions
      set guioptions+=C
      set guioptions-=m
      set guioptions-=T
      simalt ~x
  endif
endfunction

"------------------------------------------------------------------------------------------------
" ステータスライン
"------------------------------------------------------------------------------------------------
" エディタ下部に表示させるステータス値
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

set ruler        " 何行目にカーソルがあるか表示
set laststatus=2 " 常にステータスラインを表示

function! GetB()
let c = matchstr(getline('.'), '.', col('.') - 1)
let c = iconv(c, &enc, &fenc)
return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
let n = a:nr
let r = ""
while n
let r = '0123456789ABCDEF'[n % 16] . r
let n = n / 16
endwhile
return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
let out = ''
let ix = 0
while ix < strlen(a:str)
let out = out . Nr2Hex(char2nr(a:str[ix]))
let ix = ix + 1
endwhile
return out
endfunc
"------------------------------------------------------------------------------------------------
" 移動系
"------------------------------------------------------------------------------------------------
"###############################################
" normal mode
"###############################################
" 行単位で移動
noremap j gj
noremap k gk

"行末行頭移動
noremap <C-l> $
noremap <C-h> ^

"ページ移動（半分）
noremap <C-j> <C-d>
noremap <C-k> <C-u>

"タブ移動
noremap <c-right> <:tabn<enter>
noremap <c-left> <:tabp<enter>

"ノーマルモードでの改行
noremap <CR><CR> o<ESC>

noremap <C-f>j :vnew<enter>
noremap <C-f>k :new<enter>

" カーソル位置の単語をyankする
nnoremap vy vawy

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap [ %
nnoremap ] %

" コマンドモード
nnoremap ; :
nnoremap ) t)
nnoremap ( t(

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

"###############################################
" visual mode
"###############################################
vnoremap <C-l> $h
vnoremap ) t)
vnoremap ( t(

"###############################################
" insert mode
"###############################################
imap <a-l> <END>
imap <a-h> <HOME>

" インサートモードでもhjklで移動（Ctrl押すけど）
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

inoremap <C-s> <esc>:w<enter>a
inoremap <C-v> <esc>pa


" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 矩形選択で自由に移動する
set virtualedit+=block

"------------------------------------------------------------------------------------------------
" 入力
"------------------------------------------------------------------------------------------------
" insertモードを抜けるとIMEオフ
set imdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>
" Visualモードでのpで選択範囲をレジスタの内容に置き換える
vnoremap p <Esc>;let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Tabキーを空白に変換
set expandtab

" XMLの閉タグを自動挿入
augroup MyXML
autocmd!
autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge
function! RTrim()
  let s:cursor = getpos(".")
  if &filetype == "markdown" || &filetype == "mkd"
    %s/\s\+\(\s\{2}\)$/\1/e
    match Underlined /\s\{2}/
  else
    %s/\s\+$//e
  endif
  call setpos(".", s:cursor)
endfunction
autocmd BufWritePre * call RTrim()

"diff
noremap <c-Down> :vertical diffsplit<space>
noremap <c-Up> :diffoff<Enter>

"------------------------------------------------------------------------------------------------
" 文字コード
"------------------------------------------------------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"------------------------------------------------------------------------------------------------
" ########################################## plugin #############################################
"------------------------------------------------------------------------------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'molokai'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
"###############################################
" text object
"###############################################
nmap "" vi"
nmap '' vi'
nmap (( vi(
nmap {{ vi{
nmap [[ vi[

"
"###############################################
" neocomplecache.vim (自動補完)
"###############################################
" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 自動補完開始文字数
let g:neocomplcache_auto_completion_start_length = 3
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplcache_enable_auto_select = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
"" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
"" neocomplcacheを自動的にロックするバッファ名のパターン
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" -入力による候補番号の表示
"" let g:neocomplcache_enable_quick_match = 1
"" ユーザー定義スニペット保存ディレクトリ
let g:neocomplcache_snippets_dir = $HOME.'dotfiles/vimfiles/snippets'
"
"" スニペット
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)


"" FileType毎の辞書を設定
"autocmd FileType python set dictionary=
"autocmd FileType javascript set dictionary=
"autocmd FileType html set dictionary=
"autocmd FileType css set dictionary=
"autocmd FileType xml set dictionary=
"autocmd FileType php set dictionary=
"autocmd FileType c set dictionary=
"autocmd FileType ruby set dictionary=

"" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

"###############################################
" emmet.vim
"###############################################
let g:user_emmet_leader_key = '<c-a>'
noremap <a-t><a-t> :call emmet#balanceTag(-1)<cr>
noremap <a-t>t :call emmet#balanceTag(1)<cr>

"###############################################
" NERDTreeToggle.vim ( ファイら )
"###############################################
noremap <F4> <:NERDTreeToggle<enter>

"###############################################
" NERDCommenter.vim ( コメント補助 )
"###############################################
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

nmap <Leader>cc <Plug>NERDCommenterAlignLeft
vmap <Leader>c  <Plug>NERDCommenterComment
nmap <Leader>C  <Plug>NERDCommenterToEOL
vmap <Leader>C  <Plug>NERDCommenterAlignLeft

nmap <Leader>u  <Plug>NERDCommenterUncomment
vmap <Leader>u  <Plug>NERDCommenterUncomment

nmap <Leader>xm <Plug>NERDCommenterMinimal
nmap <Leader>xs <Plug>NERDCommenterSexy
vmap <Leader>xm <Plug>NERDCommenterMinimal
vmap <Leader>xs <Plug>NERDCommenterSexy
nmap <Leader>xa <Plug>NERDCommenterAltDelims

"###############################################
" commentInsert.vim ( コメント補助 )
"###############################################
let g:endtagcommentFormat = '<!-- /%id%class -->'
"
"###############################################
" str2htmlentity.vim ( html文字実体参照の変換 )
"###############################################
vnoremap <silent> sx :Str2HtmlEntity<cr>
vnoremap <silent> sr :Entity2HtmlString<cr>
"
"
"###############################################
" unite.vim (emacsのanthingみたいなの)
"###############################################
" The prefix key.
nnoremap [unite]   <Nop>
nmap mm [unite]
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
"
"" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()"{{{
"  " Overwrite settings.
"  imap <buffer> jj      <Plug>(unite_insert_leave)
"  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
"  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"  " Start insert.
"  let g:unite_enable_start_insert = 1
"endfunction"}}}
"
"let g:unite_source_file_mru_limit = 200

"###############################################
" vimshell.vim
"###############################################
"let g:vimproc_dll_path = $VIMRUNTIME.'/autoload/proc.so'
"let g:VimShell_EnableInteractive = 1
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64')
" Display user name on Windows.
let g:vimshell_prompt = $USERNAME."% "
else
" Display user name on Linux.
let g:vimshell_prompt = $USER."% "


call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
let g:vimshell_execute_file_list['zip'] = 'zipinfo'
call vimshell#set_execute_file('tgz,gz', 'gzcat')
call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif
"
function! g:my_chpwd(args, context)
call vimshell#execute('echo "chpwd"')
endfunction
function! g:my_emptycmd(cmdline, context)
call vimshell#execute('echo "emptycmd"')
return a:cmdline
endfunction
function! g:my_preprompt(args, context)
call vimshell#execute('echo "preprompt"')
endfunction
function! g:my_preexec(cmdline, context)
call vimshell#execute('echo "preexec"')

if a:cmdline =~# '^\s*diff\>'
  call vimshell#set_syntax('diff')
endif
return a:cmdline
endfunction

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#hook#set('chpwd', ['g:my_chpwd'])
\| call vimshell#hook#set('emptycmd', ['g:my_emptycmd'])
\| call vimshell#hook#set('preprompt', ['g:my_preprompt'])
\| call vimshell#hook#set('preexec', ['g:my_preexec'])

command! Vs :VimShell


"###############################################
" vim-ref.vim
"###############################################
let g:ref_phpmanual_path = $HOME.'/ref/php-chunked-xhtml/'
let g:ref_phpmanual_cmd = 'w3m -dump %s'
let $PATH = $PATH.'/w3m-0.5.3'

"###############################################
" vimfiler.vim
"###############################################
command! Vf :VimFiler
nnoremap [vimFiler]   <Nop>
nmap qq [vimFiler]
nnoremap <silent> [vimFiler]f  :<C-u>VimFiler<CR>

let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_min_filename_width = 20
let g:vimfiler_max_filename_width = 80

nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=40 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! g:my_vimfiler_settings()
"  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
"  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
"endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)
"------------------------------------------------------------------------------------------------
"
" コマンド関連
"
"------------------------------------------------------------------------------------------------

"###############################################
" 無駄な改行削除
"###############################################
command! Eracebreak :%s/^\n//g

"###############################################
" 文字コードをUTF8にする
"###############################################
command! UTF :set fenc=utf-8
command! SJIS :set fenc=shift_jis
command! CP932 :set fenc=cp932
"###############################################
" cssTranceForm
"###############################################
" :<space>GREP
" \%(pattern\)\@! = 否定先読み
" css 疑似要素
" link visited active hover before after focus first-child first-letter first-line lang root last-child
" nth-child :nth-last-child :first-of-type :last-of-type :nth-of-type :nth-last-of-type :only-child :only-of-type :empty :enabled :disabled :checked :not
command! CssSpace1 :%s/\(\w\):\(\%(link\)\@!\&\%(visited\)\@!\&\%(active\)\@!\&\%(hover\)\@!\&\%(before\)\@!\&\%(after\)\@!\&\%(focus\)\@!\&\%(first-child\)\@!\&\%(first-letter\)\@!\&\%(first-line\)\@!\&\%(lang\)\@!\&\%(root\)\@!\&\%(last-child\)\@!\&\%(nth-child\)\@!\&\%(nth-last-child\)\@!\&\%(first-of-type\)\@!\&\%(last-of-type\)\@!\&\%(nth-of-type\)\@!\&\%(nth-last-of-type\)\@!\&\%(only-child\)\@!\&\%(only-of-type\)\@!\&\%(empty\)\@!\&\%(enabled\)\@!\&\%(disabled\)\@!\&\%(checked\)\@!\&\%(not\)\@!\&\S\)/\1: \2/g
command! CssSpace2 :%s/\(\w\){/\1 {/g  "<space>{GREP

"###############################################
"scss
"###############################################
augroup SassAutoCommands
  autocmd!
  autocmd FileType scss compiler scss
augroup END

function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

"###############################################
" surround.vim
"###############################################
" [key map]
" 1 : <h1>|</h1>
" 2 : <h2>|</h2>
" 3 : <h3>|</h3>
" 4 : <h4>|</h4>
" 5 : <h5>|</h5>
" 6 : <h6>|</h6>
"
" p : <p>|</p>
" u : <ul>|</ul>
" o : <ol>|</ol>
" l : <li>|</li>
" a : <a href="">|</a>
" A : <a href="|"></a>
" i : <img src="|" alt="" />
" I : <img src="" alt"|" />
" d : <div>|</div>
" D : <div class="section">|</div>
autocmd FileType html let b:surround_49  = "<h1>\r</h1>"
autocmd FileType html let b:surround_50  = "<h2>\r</h2>"
autocmd FileType html let b:surround_51  = "<h3>\r</h3>"
autocmd FileType html let b:surround_52  = "<h4>\r</h4>"
autocmd FileType html let b:surround_53  = "<h5>\r</h5>"
autocmd FileType html let b:surround_54  = "<h6>\r</h6>"
autocmd FileType html let b:surround_112 = "<p>\r</p>"
autocmd FileType html let b:surround_117 = "<ul>\r</ul>"
autocmd FileType html let b:surround_111 = "<ol>\r</ol>"
autocmd FileType html let b:surround_108 = "<li>\r</li>"
autocmd FileType html let b:surround_97  = "<a href=\"\">\r</a>"
autocmd FileType html let b:surround_65  = "<a href=\"\r\"></a>"
autocmd FileType html let b:surround_105 = "<img src=\"\r\" alt=\"\" />"
autocmd FileType html let b:surround_73  = ""
autocmd FileType html let b:surround_100 = "<div>\r</div>"
autocmd FileType html let b:surround_68  = "<div class=\"section\">\r</div>"

 "シングルクオートで囲む
map s <Plug>VSurround
vmap <C-s> s
"table
vmap <C-t>r <C-a>,tr<enter>
vmap <C-t>h <C-a>,th<enter>
vmap <C-t>d <C-a>,td<enter>

nmap <a-t>1 <c-h>v<C-l>sth1<enter>
nmap <a-t>2 <c-h>v<C-l>sth2<enter>
nmap <a-t>3 <c-h>v<C-l>sth3<enter>
nmap <a-t>4 <c-h>v<C-l>sth4<enter>
nmap <a-t>5 <c-h>v<C-l>sth5<enter>

"common
nmap <a-l> <c-h>v<C-l>stli<enter>
nmap <a-p> <c-h>v<C-l>stp<enter>
nmap <a-d>t <c-h>v<C-l>stdt<enter>
nmap <a-d>d <c-h>v<C-l>stdd<enter>
nmap <a-t>d <c-h>v<C-l>sttd<enter>
nmap <a-t>h <c-h>v<C-l>stth<enter>
nmap <a-h> <c-h>v<C-l>sta href=""<enter>
nmap <a-w> <c-h>v<C-l>stdiv class=""<enter>11la

"rowWrap
vmap <C-a>l <C-a>,li*<enter>
vmap <C-a>p <C-a>,p*<enter>
vmap <c-w> <C-l>stdiv class=""<enter>11la

" 削除
nmap <C-d>j dst


"###############################################
" py
"###############################################
command! Dj :set ft=htmldjango
let pyflakes_use_quickfix = 0


"###############################################
" vim-indent-guides.vim
"###############################################
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#660022 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#220066 ctermbg=235


"###############################################
" Filetype
"###############################################
au BufNewFile,BufRead *.as set ft=as3
au BufNewFile,BufRead *.browserify set ft=javascript
au BufNewFile,BufRead *.webpack set ft=javascript
au BufNewFile,BufRead *.concatjs set ft=javascript
au BufNewFile,BufRead Vagrantfile set ft=ruby
au BufNewFile,BufRead *.css set ft=css syntax=css3
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set ft=glsl

"###############################################
" calendar.vim
"###############################################
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

"###############################################
" Codic.vim
"###############################################
command! Co :Codic


"###############################################
" winresizer.vim
"###############################################
let g:winresizer_gui_enable = 1
let g:winresizer_gui_start_key = '<C-1>'
