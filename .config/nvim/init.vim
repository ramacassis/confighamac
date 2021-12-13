set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

luafile ~/.config/nvim/lua/packages.lua

luafile ~/.config/nvim/lua/lsp.lua
luafile ~/.config/nvim/lua/mappings.lua
luafile ~/.config/nvim/lua/settings.lua
luafile ~/.config/nvim/lua/functions.lua
