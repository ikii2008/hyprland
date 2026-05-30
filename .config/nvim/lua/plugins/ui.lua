return {
  -- Theme
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        nvimtree = true,
        lualine = true,
        bufferline = true,
      }
    })
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
},
  -- Icons
  { "nvim-tree/nvim-web-devicons" },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          icons_enabled = true,
        }
      })
    end
  },

  -- Bufferline (tab bar)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          separator_style = "slant",
        }
      })
    end
  },

{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          }
        }
      },
      filters = { dotfiles = false },
    })

    -- Keymap sederhana
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end
},

{
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
    },
  },

}
