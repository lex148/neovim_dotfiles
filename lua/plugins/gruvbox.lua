
return {

  {
    "luisiacc/gruvbox-baby", 
    branch= 'main',
    config = function()
      local status, _ = pcall(vim.cmd, "colorscheme gruvbox-baby")
    end

  }

  --{
  --  "morhetz/gruvbox",
  --  config = function()
  --    local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
  --  end
  --}
}
