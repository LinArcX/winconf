require('lspconfig').clangd.setup({
    on_attach = function(client)
      require 'illuminate'.on_attach(client)
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')
vim.o.completeopt = 'menuone,noselect'
local luasnip = require 'luasnip'
local lspkind = require('lspkind')


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- Set completeopt to have a better completion experience
local cmp = require 'cmp'
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      --with_text = true, -- do not show text alongside icons
      mode = 'symbol_text',
      maxwidth = 45, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- preset = 'default',
      symbol_map = {
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "",
        File = "",
        Folder = "",
        Function = "",
        Interface = "",
        Keyword = "",
        Module = "",
        Method = "",
        Operator = "",
        Property = "",
        Reference = "",
        Snippet = "",
        Struct = "",
        Text = "",
        TypeParameter = "",
        Unit = "塞",
        Value = "",
        Variable = "",
      },
    })
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  completion = { autocomplete = false },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  window = {
    documentation = {
      maxwidth = 65,
    },
  },
}

local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Use a loop to conveniently call 'setup' on multiple servers and map buffer local keybindings when the language server attaches
 local servers = { 'clangd' }
 for _, lsp in ipairs(servers) do
 nvim_lsp[lsp].setup {
   on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
 }
end

-- Lua LSP
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       completion = { callSnippet = "Both" },
--       runtime = { version = 'LuaJIT', path = runtime_path },
--       diagnostics = { globals = {'vim'} },
--       workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--       telemetry = { enable = false },
--     },
--   },
-- }

--require'lspconfig'.zls.setup{}
--require'lspconfig'.nimls.setup{}
--require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
--require'lspconfig'.jdtls.setup{}
