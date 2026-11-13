-- Keymaps are automatically loaded on startup via init.lua

local function run_python()
  local file = vim.fn.expand("%:p")

  -- Jika buffer belum disimpan tapi ada isinya
  if file == "" or not file:match("%.py$") then
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local text = table.concat(lines, "\n"):gsub("^%s+", "")
    if text ~= "" and (file == "" or vim.bo.filetype == "python") then
      file = "/tmp/scratch_run.py"
      local f = io.open(file, "w")
      if f then
        f:write(table.concat(lines, "\n") .. "\n")
        f:close()
      end
    else
      vim.notify(
        "Silakan buka atau simpan file Python (.py) terlebih dahulu!",
        vim.log.levels.WARN,
        { title = "Python Runner" }
      )
      return
    end
  else
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end

  -- Tutup window runner lama jika masih terbuka
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.b[buf] and vim.b[buf].python_runner then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end

  -- Buka split terminal di bawah (tinggi 12 baris)
  vim.cmd("botright 12split")
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.b[buf].python_runner = true
  vim.bo[buf].buftype = "nofile"

  -- Jalankan menggunakan uv run
  local cmd = "uv run " .. vim.fn.shellescape(file)
  vim.fn.termopen(cmd)

  -- Tombol q untuk menutup jendela output
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      pcall(vim.api.nvim_win_close, win, true)
    end
  end, { buffer = buf, silent = true, desc = "Close runner output" })

  vim.notify("Menjalankan: " .. vim.fn.fnamemodify(file, ":t"), vim.log.levels.INFO, { title = "Python Runner" })
end

-- Shortcut <Space> r dan <leader>r
vim.keymap.set("n", "<leader>r", run_python, { desc = "Run Python with uv" })
vim.keymap.set("n", "<Space>r", run_python, { desc = "Run Python with uv" })

-- Command alternatif: ketik :Run atau :PyRun lalu Enter
vim.api.nvim_create_user_command("Run", run_python, { desc = "Run Python with uv" })
vim.api.nvim_create_user_command("PyRun", run_python, { desc = "Run Python with uv" })

-- Shortcut untuk restart LSP (misal setelah uv add atau saat cache macet)
vim.keymap.set("n", "<leader>cr", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
