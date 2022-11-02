local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.n_map = bind("n", {noremap = false})
M.n_noremap = bind("n")
M.v_noremap = bind("v")
M.x_noremap = bind("x")
M.i_noremap = bind("i")

return M
