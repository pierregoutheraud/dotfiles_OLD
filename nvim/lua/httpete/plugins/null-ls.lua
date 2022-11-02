-- local status, null_ls = pcall(require, "null-ls")
-- if (not status) then return end
--
-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       diagnostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     null_ls.builtins.diagnostics.fish
--   }
-- })

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    --require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.prettierd,
    --require("null-ls").builtins.formatting.eslint_d,
    --require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.completion.spell,
  },

  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>d :lua vim.lsp.buf.format()<CR>")

      -- format on save
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>d :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})
