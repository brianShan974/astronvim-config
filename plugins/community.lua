return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },

  { import = "astrocommunity.motion.leap-nvim" },

  { import = "astrocommunity.markdown-and-latex.vimtex" },

  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
}
