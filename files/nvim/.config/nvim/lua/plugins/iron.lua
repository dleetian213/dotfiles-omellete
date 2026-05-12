return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions
        repl_definition = {
          python = {
            -- Using ipython is smarter for handling pasted visual blocks and chunks
            command = { "ipython", "--no-autoindent" },
          },
        },
        -- How the repl window will be displayed
        repl_open_cmd = require("iron.view").right(60),
      },
      -- Keymaps for iron-specific actions
      keymaps = {
        send_motion = "<space>rc",
        visual_send = "<space>rc", -- This handles your Visual Mode sending
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

    -- 1. General Management Keymaps
    vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
    vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
    vim.keymap.set("n", "<space>rF", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")

    -- 2. SMART CHUNK/CELL SENDING (Normal Mode)
    -- Searches for # %% markers and sends the block
    vim.keymap.set("n", "<space>rX", function()
      local pattern = "# %%"
      -- Save current position
      local save_pos = vim.fn.getpos(".")

      -- Find boundaries
      local start_line = vim.fn.search(pattern, "bnW")
      if start_line == 0 then
        start_line = 1
      else
        start_line = start_line + 1
      end

      local end_line = vim.fn.search(pattern, "nW")
      if end_line == 0 then
        end_line = vim.fn.line("$")
      else
        end_line = end_line - 1
      end

      -- Fetch and send lines
      local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
      iron.send(nil, lines)

      -- Move to next cell for rapid execution
      vim.fn.search(pattern, "W")
    end, { desc = "Iron: Send code chunk" })
  end,
}
