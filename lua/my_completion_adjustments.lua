

local M = {}

function M.handle_complete_done()

	-- Check if the file type is Rust
  if vim.bo.filetype ~= 'rust' then
    return
  end

  -- Get the completed item
  local completed_item = vim.v.completed_item

  -- Check if the completed item is valid
  if completed_item and completed_item.word then
    -- Get the current line
    local line = vim.api.nvim_get_current_line()

    -- Replace all placeholders in the line
		local new_line = line:gsub("%$%d+", ""):gsub("%${%d+:(.-)}", "%1")
		--local new_line = line:gsub("%$%d+", ""):gsub("%${%d+:.-}", "_")

    -- Update the current line with the new text
    vim.api.nvim_set_current_line(new_line)
  end
end

return M
