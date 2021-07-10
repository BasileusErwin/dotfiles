call plug#begin('~/.config/nvim/plugged')

        " Easy motion for VSCode
        Plug 'asvetliakov/vim-easymotion'
        " Comment code
        Plug 'tpope/vim-commentary'
        " Treeesitter
        Plug 'nvim-treesitter/nvim-treesitter'
        " Syntax support
        Plug 'sheerun/vim-polyglot'
        Plug 'HerringtonDarkholme/yats.vim'
        Plug 'othree/yajs.vim'
        Plug 'ap/vim-css-color'
        Plug 'chrisbra/Colorizer'
        Plug 'wavded/vim-stylus'
        Plug 'leafgarland/typescript-vim'
        Plug 'peitalin/vim-jsx-typescript'
        
        " Autopairs
        Plug 'jiangmiao/auto-pairs'
        " File explorer
        Plug 'scrooloose/NERDTree'    
        " Icons
        Plug 'ryanoasis/vim-devicons'
        " Intellisense
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'neoclide/jsonc.vim'
        " Tabnine
 "       Plug 'codota/tabnine-vim'

        " Git
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        Plug 'junegunn/gv.vim'

        " Markdown
        Plug 'nelstrom/vim-markdown-folding'
        Plug 'dhruvasagar/vim-table-mode'
        Plug 'junegunn/goyo.vim'

        " JS
        Plug 'moll/vim-node'
        Plug 'pangloss/vim-javascript'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'kevinoid/vim-jsonc'
        Plug 'vimwiki/vimwiki'

        Plug 'mattn/emmet-vim'
        " Airline
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        " Indent guides
        " Plug 'Yggdroot/indentLine' 
        " Git integration
        Plug 'mhinz/vim-signify'
        " Autoclose tags
        Plug 'alvan/vim-closetag'
        " Ranger
        Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
        " Fzf
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-rooter'

        " Prettier
        Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

        " Themes
        Plug 'morhetz/gruvbox'
        Plug 'ayu-theme/ayu-vim'
        Plug 'joshdick/onedark.vim'
        Plug 'tomasr/molokai'
        Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
        Plug 'AlessandroYorba/Despacio'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
        Plug 'mhartington/oceanic-next'
        Plug 'ghifarit53/tokyonight-vim'
        Plug 'kaicataldo/material.vim'
        Plug 'tomasiser/vim-code-dark'
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

