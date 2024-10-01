-- This file needs to have same structure as nyxconfig.lua 
-- https://github.com/NyxVim/ui/blob/main/lua/nyxconfig.lua
-- Please read that file to know all available options :( 

---@type NyxrcConfig
local M = {}

M.base46 = {
	theme = "nyxdracula-evondev",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui = {
   tabufline = {
     --  more opts
     order = { "treeOffset", "buffers", "tabs", "btns", 'abc' },
     modules = {
       -- You can add your custom component
       abc = function()
         return "hi"
       end,
     }
   },
 
   statusline = {
     -- more opts
     order = require('nyxvim.stl.utils').orders.default, -- use the default order from utils.lua
     modules = {
       -- The default cursor module is override
       cursor = function()
         local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
         return string.format("Ln %d, Col %d", row, col)
       end
     },
 
     -- Separator style and theme
     theme = "default", -- default, vscode, vscode_colored or minimal
     -- default, round, block, and arrow are supported only by the default statusline theme.
     -- the round and block separators are also supported by the minimal theme.
     separator_style = "default", -- default, round, block or arrow
   }
 }

return M
