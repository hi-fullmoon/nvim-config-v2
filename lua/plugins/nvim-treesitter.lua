return {
  'nvim-treesitter/nvim-treesitter',
  cond = not vim.g.vscode,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function ()
    require('nvim-treesitter.configs').setup({
      auto_install = false,
      ensure_installed = {},
      matchup = {
       nenable = true,
      },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false
      },
      -- indent = {
      --   enable = true,
      -- },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
    })
  end
}
