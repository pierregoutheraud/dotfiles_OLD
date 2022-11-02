local lspconfig = require("lspconfig")
local aerial = require('aerial')

aerial.setup({})

require("nvim-lsp-installer").setup({
  automatic_installation = true,
})

-- These are lsp keymaps
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
--vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  --vim.keymap.set("n", "ge", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "L", vim.lsp.buf.signature_help, bufopts)

  --vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set("n", "<leader>wl", function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

  -- Formatting is done with null-ls
  --vim.keymap.set("n", "<leader>d", vim.lsp.buf.formatting, bufopts)


  aerial.on_attach(client, bufnr)
end

-- Autocompletion

local protocol = require('vim.lsp.protocol')
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lspconfig["tsserver"].setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
})

lspconfig["eslint"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
