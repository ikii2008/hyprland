return {
-- Telescope
{
"nvim-telescope/telescope.nvim",
dependencies = { "nvim-lua/plenary.nvim" },
},


-- Treesitter
{
"nvim-treesitter/nvim-treesitter",
build = ":TSUpdate",
},


-- Autopairs
{ "windwp/nvim-autopairs", config = true },


-- Comment
{ "numToStr/Comment.nvim", config = true },


-- Git signs
{ "lewis6991/gitsigns.nvim" },


-- Which-key
{ "folke/which-key.nvim", config = true },

}
