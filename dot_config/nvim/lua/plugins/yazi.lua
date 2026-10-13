return {
  "mikavilpas/yazi.nvim",
  version = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Yazi",
  keys = {
    { "<leader>fy", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Yazi (current file)" },
    { "<leader>fY", "<cmd>Yazi cwd<cr>", desc = "Yazi (cwd)" },
    { "<leader>uy", "<cmd>Yazi toggle<cr>", desc = "Resume Yazi" },
  },
  opts = { open_for_directories = false },
}
