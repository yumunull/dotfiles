return {
  "andrewferrier/debugprint.nvim",

  config = function()
    -- Unity-aware debugprint function
    local function cs(opts)
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      for _, line in ipairs(lines) do
        line = line:match("^%s*(.-)%s*$") -- trim whitespace
        if line:match("^using%s+UnityEngine") then
          return {
            left = 'Debug.Log($"',
            right = '");',
            mid_var = "{",
            right_var = '}");',
          }
        -- we only search continuous using package section, ignore empty line
        elseif line ~= "" and not line:match("^using%s+") then
          break
        end
      end
      return {
        left = 'System.Console.Error.WriteLine($"',
        right = '");',
        mid_var = "{",
        right_var = '}");',
      }
    end

    -- Python-aware debugprint function
    local function python(opts)
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local hasLoggingImport = false
      local useLogger = false
      for _, line in ipairs(lines) do
        line = line:match("^%s*(.-)%s*$") -- trim whitespace
        if line:match("^import%s+logging") or line:match("^from%s+logging%s+import") then
          hasLoggingImport = true
        elseif line:match("^import%s") or line:match("^from%s") or line:match("^#") or line == "" then
        -- skip comments and empty lines
        else
          if hasLoggingImport and line:match("^logger%s?=") then
            useLogger = true
          end
          break -- first "real" line outside import section
        end
      end
      if useLogger then
        return {
          left = 'logger.debug("',
          left_var = 'logger.debug(f"',
          right = '")',
          mid_var = "{",
          right_var = '}")',
        }
      elseif hasLoggingImport then
        return {
          left = 'logging.debug("',
          left_var = 'logging.debug(f"',
          right = '")',
          mid_var = "{",
          right_var = '}")',
        }
      end
      return {
        left = 'print("',
        left_var = 'print(f"',
        right = '")',
        mid_var = "{",
        right_var = '}")',
      }
    end

    require("debugprint").setup({
      filetypes = {
        ["cs"] = cs,
        ["python"] = python,
      },
    })
  end,

  dependencies = {
    -- "echasnovski/mini.nvim",         -- Optional: Needed for line highlighting (full mini.nvim plugin)
    -- ... or ...
    "nvim-mini/mini.hipatterns", -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)

    -- "ibhagwan/fzf-lua",              -- Optional: If you want to use the `:Debugprint search` command with fzf-lua
    -- "nvim-telescope/telescope.nvim", -- Optional: If you want to use the `:Debugprint search` command with telescope.nvim
    "folke/snacks.nvim",             -- Optional: If you want to use the `:Debugprint search` command with snacks.nvim
  },

  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = "*", -- Remove if you DON'T want to use the stable version
}
