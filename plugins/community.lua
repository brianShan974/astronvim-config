return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.fluormachine-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  { import = "astrocommunity.color.transparent-nvim" },

  { import = "astrocommunity.debugging.nvim-bqf" },

  { import = "astrocommunity.indent.mini-indentscope" },

  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },

  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.tabout-nvim" },

  { import = "astrocommunity.pack.java" },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk/",
              },
            },
          },
        },
      },
    },
  },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python-ruff" },

  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.test.nvim-coverage" },

  { import = "astrocommunity.utility.noice-nvim" },

  { import = "astrocommunity.workflow.hardtime-nvim" },

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
