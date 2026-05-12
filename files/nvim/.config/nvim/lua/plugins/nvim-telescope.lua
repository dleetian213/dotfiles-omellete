return {
  "nvim-telescope/telescope-media-files.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  defaults = {
    preview_cutoff = 1,
  },
  config = function()
    require("telescope").setup({
      extensions = {
        media_files = {
          -- Optional: configure file types to preview
          filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
          -- Optional: set custom find command (e.g., fd, rg)
          find_cmd = "fd",
        },
      },
    })
    -- Load the extension
    require("telescope").load_extension("media_files")
  end,
}
