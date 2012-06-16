"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My (mostly) custom vim configuration file.                "
" Author: Kristof Coninx <kristofconinx369 AT gmail DOT com>"
"                                                           "
" Credit to: Steve Francia and his ultimate vim config.     "
" Some snippets of this config have been used for this file."
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Custom syntax defintions
augroup syntax
au! BufNewFile,BufReadPost *.smv
au  BufNewFile,BufReadPost *.smv  so ~/vim/smv.vim
au BufNewFile,BufRead *.idp set filetype=c
augroup END

"Enable syntax highlighting
syntax enable
syntax on

"Enable filetype detection
filetype on
filetype plugin indent on

"Load pathogen enviroment plugin.
call pathogen#infect() 

"Set gundo toggle to F5
nnoremap <F5> :GundoToggle<CR>

"Show line numbers
:set number
:highlight LineNr ctermfg=red

"Set mouse control capability in terminal.
:set mouse=a

"Set F8 to tagbar
nmap <F8> :TagbarToggle<CR>

"Set F6 to nerdtree:
nmap <F6> :NERDTreeToggle<CR>


" Setting up the directories
set backup                      " backups are nice ...
au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)



" Vim UI 
set tabpagemax=15               " only show 15 tabs
set showmode                    " display the current mode

set cursorline                  " highlight current line
hi cursorline guibg=#333333     " highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor

if has('cmdline_info')
	set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
endif

"Define the statusline.
if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\   " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

	set backspace=indent,eol,start  " backspace for dummys
	set linespace=0                 " No extra spaces between rows

" Formatting 
	set nowrap                      " wrap long lines
	set autoindent                  " indent at the same level of the previous line
	set shiftwidth=4                " use indents of 4 spaces
	set expandtab                   " tabs are spaces, not tabs
	set tabstop=4                   " an indentation every four columns
	set softtabstop=4               " let backspace delete indent
	"set matchpairs+=<:>                " match, to be used with % 
	set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
	" Remove trailing whitespaces and ^M chars
	autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"""""""""""""""
"" Spellchecking
""""""""""""""
:set spell
 
if v:version >= 700
    "Sets in-line spellchecking
    set spell
 
    " Set local language 
    " setlocal spell spelllang=en_us
    setlocal spell spelllang=nl,en_us
endif

"" Spell Check toggle function
"Current spell option.
let t:currIdx=0
let g:langOptions=["nospell","nl","en_us","en_gb"]

"Function for toggling one option further in spellcheck language.
function! ToggleSpell()
  let t:currIdx=(t:currIdx+1)%len(g:langOptions)
  if t:currIdx!=0
    execute "setlocal spell spelllang=".get(g:langOptions, t:currIdx)
  else
    setlocal nospell
  endif
  echo "Spellcheck language:" g:langOptions[t:currIdx]
endfunction

"Map F7 to toggle spell language or on/off.
nmap <silent> <F7> :call ToggleSpell()<CR>

"Function for setting up directory for temp files and buffers.
function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
              \ 'backup': 'backupdir', 
              \ 'views': 'viewdir', 
              \ 'swap': 'directory' }

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories() 
