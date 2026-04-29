return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- When true, hidden items are shown but dimmed
        hide_dotfiles = false,
        hide_gitignore = false,
      },
    },
  },
}
