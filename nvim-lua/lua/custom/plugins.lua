local plugins = {
  { "tpope/vim-surround", lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- low level
        "ocaml"
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "ocaml-lsp",
        "ocamlformat"
      },
      automatic_installation = { exclude = { "ocaml-lsp", "ocamlformat" } }
    },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     -- Copilot integration
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       dependencies = {
  --         "zbirenbaum/copilot.lua",
  --         cmd = "Copilot",
  --         event = "InsertEnter",
  --         config = function()
  --           require("copilot").setup({
  --             suggestion = { enabled = false },
  --             panel = { enabled = false }
  --           })
  --         end,
  --       },
  --       config = function()
  --         require("copilot_cmp").setup()
  --       end
  --     },
  --   },
  --   opts = function()
  --     return require "custom.configs.cmp"
  --   end,
  --   config = function(_, opts)
  --     require("cmp").setup(opts)
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   config = function()
    --     require "custom.configs.null-ls"
    --   end,
    -- },

    config = function()
      -- require "plugins.configs.lspconfig"
      require "custom.lspconfig"
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "BufEnter",
    config = function()
      require("dressing").setup {
        select = {
          backend = { "telescope", "fzf", "builtin" },
        },
      }
    end
  },
  {
    "easymotion/vim-easymotion", lazy = false
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
          }
        }
      }
    }
  }
}

return plugins
