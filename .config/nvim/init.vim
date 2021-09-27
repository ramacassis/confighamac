set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

luafile ~/.config/nvim/lua/plugins.lua

luafile ~/.config/nvim/lua/lsp.lua
luafile ~/.config/nvim/lua/mappings.lua
luafile ~/.config/nvim/lua/settings.lua
