return {
  -- Install the Solarized plugin
  { "altercation/vim-colors-solarized" },

  -- Configure LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
