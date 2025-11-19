return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      auto_integrations = true,
      float = {
        transparent = true,
        solid = false,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "poimandresish",
    },
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Your configuration options here.
      theme = {
        transparent = true,
        contrast = "high",
      },
    },
  },
  {
    "webhooked/poimandresish.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandresish").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        disable_background = true,
        disable_float_background = true,
      })
    end,
  },
  {
    "aliqyan-21/darkvoid.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("darkvoid").setup({
        transparent = true,
      })
    end,
  },
  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    opts = { transparent = true },
  },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable", -- versioned tags + docs updates from main
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.lavender = {
        transparent = {
          background = true, -- do not render the main background
          float = true, -- do not render the background in floating windows
          popup = true, -- do not render the background in popup menus
          sidebar = true, -- do not render the background in sidebars
        },
      }
    end,
  },
}
