return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local hooks = require("ibl.hooks")

      -- define a single teal highlight for scope
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "ScopeHighlight", { fg = "#56B6C2" }) -- teal
      end)

      require("ibl").setup {
        scope = {
          highlight = { "ScopeHighlight" },
        },
      }

      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )
    end,
  },
}
