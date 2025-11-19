return {
  "folke/snacks.nvim",
  dependencies = {
    { "juansalvatore/git-dashboard-nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = {
      config = function(opts, defaults)
        local header = [[
 .              +   .                .   . .     .  .  
                   .                    .       .     *
  .       *                        . . . .  .   .  + . 
            "You Are Here"            .   .  +  . . .  
.                 |             .  .   .    .    . .   
                  |           .     .     . +.    +  . 
                 \|/            .       .   . .        
        . .       V          .    * . . .  .  +   .    
           +      .           .   .      +             
                            .       . +  .+. .         
  .                      .     . + .  . .     .      . 
           .      .    .     . .   . . .        ! /    
      *             .    . .  +    .  .       - O -    
          .     .    .  +   . .  *  .       . / |      
               . + .  .  .  .. +  .                    
.      .  .  .  *   .  *  . +..  .            *        
 .      .   . .   .   .   . .  +   .    .            + 
        ]]
        local ascii_heatmap = require("git-dashboard-nvim").setup({
          show_only_weeks_with_commits = true,
          centered = false,
          fallback_header = "no repo",
        })

        for _, line in ipairs(ascii_heatmap) do
          header = header .. "\n" .. line
        end
        opts.preset.header = header
      end,
    },
    image = { enabled = true },
    indent = { enabled = false },
    picker = {
      sources = {
        explorer = {
          layout = {
            auto_hide = { "input" },
          },
        },
      },
      layout = {
        preset = "telescope",
      },
    },
  },
}
