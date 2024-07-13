return {
  {
    'folke/neodev.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local neodev_status_ok, neodev = pcall(require, 'neodev')

      if not neodev_status_ok then
        return
      end

      neodev.setup()
    end
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    branch = "v3.x",
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim', },
      { 'williamboman/mason-lspconfig.nvim', },
      { 'hrsh7th/nvim-cmp' },
      { "j-hui/fidget.nvim",                 opts = {} },
    },
    keys = {
      { "K",          vim.lsp.buf.hover,                   desc = "Hover" },
      { "gK",         vim.lsp.buf.signature_help,          desc = "Signature Help" },
      { "gr",         "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>rn", vim.lsp.buf.rename,                  desc = "Rename symbol" },
      { "<leader>ca", vim.lsp.buf.code_action,             desc = "Code action" },
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
        lsp.buffer_autoformat()
      end)

      require("mason").setup {}
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer@nightly", "tsserver", "gopls" },
        handlers = { lsp.default_setup }
      }
      require('lspconfig').rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            rust = {
              analyzerTargetDir = true
            },
            checkOnSave = {
              command = 'clippy',
            },
            inlayHints = {
              bindingModeHints = { enable = true },
              closureReturnTypeHints = { enable = 'always' },
              discriminantHints = { enable = 'always' },
              parameterHints = { enable = true },
            },
            procMacro = { enable = true },
            files = {
              excludeDirs = {
                ".direnv",
                ".git",
                ".gitlab",
                ".venv",
                ".vscode",
                "bin",
                "target",
                "assets",
                "ci",
                "docs",
                "node_modules",
                "store-metadata",
                "js",
                "brain/op-navi/data",
                "ffi/op-core-wasm-web/node_modules",
                "ffi/op-wasm-trusted-device-key-exchange/node_modules",
                "ffi/op-web-core-bindings/node_modules",
                "ffi/op-core-bindings/node_modules",
                "ffi/op-core-node/node_modules",

              }
            },
          },
        },
      })
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = {
                "vim",
                "require",
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      require('lspconfig').typst_lsp.setup({
        settings = {
          exportPdf = "never"
        }
      })
    end
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets"
    },
    config = function()
      local cmp = require("cmp")
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
      local select_opts = { behavior = cmp.SelectBehavior.Select }

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

      require('luasnip.loaders.from_vscode').lazy_load()

      local luasnip = require('luasnip')

      local select_opts = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 1 },
          { name = 'buffer',   keyword_length = 3 },
          { name = 'luasnip',  keyword_length = 2 },
        },
        window = {
          documentation = cmp.config.window.bordered()
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              luasnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),

          ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
          ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      })
    end
  },


  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "folke/neodev.nvim"
  }
}
