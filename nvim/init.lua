local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-treesitter/nvim-treesitter" },
  { "neovim/nvim-lspconfig" },
  { "nvim-tree/nvim-web-devicons"},
  { "folke/trouble.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "nvim-lualine/lualine.nvim" },
  { "mhartington/formatter.nvim" },
  { "numToStr/Comment.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
})

require("catppuccin").setup({
  flavour = "mocha",
  dim_inactive = {
    enabled = true,
  },
  integrations = {
    lsp_trouble = true,
  },
})

vim.cmd.colorscheme("catppuccin")

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
	local entry = cmp.get_selected_entry()
      	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
	  cmp.confirm()
	end
      else
	fallback()
      end
    end, {"i", "s", "c",}),
  }),
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").ruff_lsp.setup({
  capabilities = capabilities
})

require("lspconfig").pyright.setup({
  capabilities = capabilities
})

require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities
})

require("trouble").setup({
  auto_open =  true,
  auto_close = true,
})

require("formatter").setup({
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
  },
})

vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost",  {
  group = "FormatAutogroup",
  pattern = "*",
  command = "FormatWrite"
})

require("indent_blankline").setup()
require("nvim-tree").setup()
require("lualine").setup()
require('Comment').setup()


local set = vim.opt

set.number = true
set.relativenumber = true
set.cursorline = true

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
