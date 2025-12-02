
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = { i = { ["<esc>"] = require("telescope.actions").close } },
      },
    })

    require("project_nvim").setup({
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "package.json", "tsconfig.json" },
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local root = require("project_nvim.project").get_project_root()
        if root and root ~= "" then vim.cmd("lcd " .. root) end
      end,
    })
  end,
}
