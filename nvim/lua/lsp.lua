local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Mappings.
  local opts = { noremap=true, silent=true }
  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<leader>lD", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>lF", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>lG", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>lg", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "<leader>lH", vim.diagnostic.hide, opts)
  vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, opts)
end

-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { "ansiblels", "gopls", "yamlls", "pylsp" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- local servers = { "gopls", "yamlls", "pylsp" }
-- for _, lsp in ipairs(servers) do
--     require('lspconfig')[lsp].setup {
--         capabilities = capabilities
--     }
-- end
