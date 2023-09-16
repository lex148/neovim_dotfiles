
return {
  {
    "morhetz/gruvbox",
    config = function()
      local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
    end
  }
}
