require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

local set = vim.opt

set.hidden = true
set.swapfile = false
set.backup = false
set.hlsearch = false
set.wrap = true
set.mouse = 'a'
set.termguicolors = true
set.scrolloff = 2
set.relativenumber = true

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0

vim.cmd([[
  syntax enable
  colorscheme default
]])

-- ========================================================================== --
-- ==                             KEY MAPPINGS                             == --
-- ========================================================================== --

vim.g.mapleader = ' '
local bind = vim.keymap.set
local remap = {remap = true}

bind('n', '<CR>', ':')
bind('n', '<leader>w',':w<CR>')
bind('i', 'jk', '<ESC>')

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
