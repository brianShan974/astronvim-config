return {
  {
    "nvim-tree/nvim-web-devicons",
    enabled = vim.g.icons_enabled,
    lazy = true,
    opts = {
      override = {
        default_icon = { icon = require("astronvim.utils").get_icon "DefaultFile" },
        deb = { icon = "", name = "Deb" },
        lock = { icon = "󰌾", name = "Lock" },
        mp3 = { icon = "󰎆", name = "Mp3" },
        mp4 = { icon = "", name = "Mp4" },
        out = { icon = "", name = "Out" },
        ["robots.txt"] = { icon = "󰚩", name = "Robots" },
        ttf = { icon = "", name = "TrueTypeFont" },
        rpm = { icon = "", name = "Rpm" },
        woff = { icon = "", name = "WebOpenFontFormat" },
        woff2 = { icon = "", name = "WebOpenFontFormat2" },
        xz = { icon = "", name = "Xz" },
        zip = { icon = "", name = "Zip" },
      },
    },
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
    opts = {
      mode = "symbol",
      symbol_map = {
        Array = "󰅪",
        Boolean = "⊨",
        Class = "󰌗",
        Constructor = "",
        Key = "󰌆",
        Namespace = "󰅪",
        Null = "NULL",
        Number = "#",
        Object = "󰀚",
        Package = "󰏗",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "󰀬",
        TypeParameter = "󰊄",
        Unit = "",
      },
      menu = {},
    },
    enabled = vim.g.icons_enabled,
    config = require "plugins.configs.lspkind",
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    init = function() require("astronvim.utils").load_plugin_with_func("nvim-notify", vim, "notify") end,
    opts = {
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 175 })
        if not vim.g.ui_notifications_enabled then vim.api.nvim_win_close(win, true) end
        if not package.loaded["nvim-treesitter"] then pcall(require, "nvim-treesitter") end
        vim.wo[win].conceallevel = 3
        local buf = vim.api.nvim_win_get_buf(win)
        if not pcall(vim.treesitter.start, buf, "markdown") then vim.bo[buf].syntax = "markdown" end
        vim.wo[win].spell = false
      end,
    },
    config = require "plugins.configs.notify",
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function() require("astronvim.utils").load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" }) end,
    opts = {
      input = { default_prompt = "➤ " },
      select = { backend = { "telescope", "builtin" } },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User AstroFile",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    opts = { user_default_options = { names = false } },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      -- -- local highlight = {
      -- --   "CursorColumn",
      -- --   "Whitespace",
      -- -- }
      -- -- require("ibl").setup {
      -- --   indent = { highlight = highlight, char = "" },
      -- --   whitespace = {
      -- --     highlight = highlight,
      -- --     remove_blankline_trail = false,
      -- --   },
      -- --   scope = { enabled = false },
      -- -- }
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      local opts = {
        -- indent = { highlight = highlight, char = "▏" },
        indent = { highlight = highlight, char = "┊" },
        scope = { show_start = true, show_end = true },
        exclude = {
          buftypes = {
            "nofile",
            "terminal",
          },
          filetypes = {
            "help",
            "startify",
            "aerial",
            "alpha",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "neo-tree",
            "Trouble",
          },
        },
      }

      require("ibl").setup(opts)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
    -- event = "User AstroFile",
    -- main = "ibl",
    -- opts = {
    --   indent = { char = "▏" },
    --   scope = { show_start = true, show_end = true },
    --   exclude = {
    --     buftypes = {
    --       "nofile",
    --       "terminal",
    --     },
    --     filetypes = {
    --       "help",
    --       "startify",
    --       "aerial",
    --       "alpha",
    --       "dashboard",
    --       "lazy",
    --       "neogitstatus",
    --       "NvimTree",
    --       "neo-tree",
    --       "Trouble",
    --     },
    --   },
    -- },
  },
}
