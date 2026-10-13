return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {
          root_dir = function(bufnr, on_dir)
            local path = vim.api.nvim_buf_get_name(bufnr)
            local root = vim.fs.root(bufnr, {
              ".taplo.toml",
              "taplo.toml",
              ".git",
            })

            -- Use the file's directory for standalone TOML files.
            on_dir(root or vim.fs.dirname(path))
          end,
        },
      },
    },
  },
}
