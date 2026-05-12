return {
  "hkupty/iron.nvim",
  config = function(plugins, opts)
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            -- Pro Tip: Use "ipython" instead of "python" if you have it installed
            -- It handles multi-line indentation much better in a REPL.
            command = { "ipython", "--no-autoindent" },
          },
        },
        repl_open_cmd = require("iron.view").right(60),
      },
      keymaps = {
        send_motion = "<space>rc",
        visual_send = "<space>rc",
        send_file = "<space>rf",
        send_line = "<space>rl",
        send_mark = "<space>rm",
        mark_motion = "<space>rmc",
        mark_visual = "<space>rmc",
        remove_mark = "<space>rmd",
        cr = "<space>r<cr>",
        interrupt = "<space>r<space>",
        exit = "<space>rq",
        clear = "<space>rx",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })

    -- 1. Standard Commands
    vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
    vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
    vim.keymap.set("n", "<space>rF", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")

    -- 2. THE CHUNK SENDER
    -- This looks for # %% (Standard Jupyter/VS Code markers)
    vim.keymap.set("n", "<space>rX", function()
      iron.send_chunk()
    end, { desc = "Send cell/chunk to REPL" })
  end,
}
