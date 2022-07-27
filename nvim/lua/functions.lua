local myfuncs = {}

function myfuncs.toggleSideBar(opts)
    if vim.opt.number._value == true then
        vim.opt.number = false
        vim.opt.signcolumn = "no"
    else
        vim.opt.number = true
        vim.opt.signcolumn = "yes:2"
    end
end

return myfuncs
