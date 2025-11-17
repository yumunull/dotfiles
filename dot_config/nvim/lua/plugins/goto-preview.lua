return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  event = "BufEnter",
  config = function()
	vim.keymap.set("n", "g??pd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g??pt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g??pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g??pD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g??P",  "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g??pr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true, silent = true })
  end
}