-- base nvim configuration file settings

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- plug manager. Loads lazy.lua which then loads all plugins.
require("config.lazy")

-- vars
local o = vim.opt
vim.opt.updatetime = 500

-- tabs / intendation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

-- search behavior
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- qol options
o.wrap = false
o.cursorline = true
o.scrolloff = 8
o.sidescrolloff = 8
o.termguicolors = true
o.mouse = "a" -- lets mouse work everywhere

-- line numbers
o.number = true
o.relativenumber = true

-- functions
-- saves and runs file depending on file type.
local runner = {        -- key=filetype name
    python = "python3", -- value=cmd
    lua = "lua"
}
local function runFile (search)
    local filetype = vim.bo.filetype
    local filecmd = search[filetype]
    local filepath = vim.fn.expand("%")
    if filecmd == nil then
        print("No file runner set for this file type. Check ==> ~/.config/init.lua")
    else
        vim.cmd ("w")
        vim.cmd(":!"..filecmd.." %")
        print("\n==> "..filepath)
    end
end

-- checks if file has a name
local function namecheck ()
    if vim.api.nvim_buf_get_name(0) == "" then
        return false
    else
        return true
    end
end

-- custom commands
vim.api.nvim_create_user_command ("Runfl", function()
    runFile(runner)
end, {
    nargs = 0, --number req arguments
    desc = "Runs current file"
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
    vim.diagnostic.open_float(nil, {
        focus = false,
        scope = "cursor",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    })
    end,
    desc = "Shows error msg when cursor hovers"
})

-- general (keybinds)
vim.keymap.set ("i","jj", "<Esc>", {desc = "swap from insert to norm"})

vim.keymap.set ("n","<C-s>", function ()
   vim.cmd ("w")
end, {desc = "Saves file"})

vim.keymap.set ("n","<leader>r", function()
    runFile(runner)
end, {desc = "Save and run current file"})

vim.keymap.set ("n","<leader>e", function ()
    vim.cmd ("Ex")
end, {desc = "File explorer"})

vim.keymap.set("n","<leader>h", function ()
    vim.cmd ("lua vim.diagnostic.open_float()")
end, {desc = "Displays all hints on highlighted row"})

-- buffer, window, and tab management (keybinds)
vim.keymap.set ("n","<leader>bd", function ()
    if namecheck() then
        if vim.bo.modified then
            vim.cmd ("w")
            vim.cmd ("bd")
        else
            vim.cmd ("bd")
        end
   else
        vim.cmd ("bd!")
    end
end, {desc = "Closes current active buffer"})

local orientations = {
    { key = "v", command = "vertical" },
    { key = "h", command = "" },
}
for _,ori in ipairs(orientations) do
    for i = 1, 9 do
        vim.keymap.set("n","<leader>s".. ori.key .. i, function()
            local buffers = vim.fn.getbufinfo({ buflisted = 1 })
            local buffer = buffers[i]

            if buffer then
                vim.cmd(ori.command .. " sbuffer " .. buffer.bufnr)
            end
        end, { desc = "Splits window and fills w selected buffer" })
    end
end

vim.keymap.set ("n","<leader>t", function()
    vim.cmd("tabnew")
end, {desc = "Load a new tab"})

vim.keymap.set ("n", "<leader>tx", function()
    vim.cmd("tabclose")
end, {desc = "Close the current tab"})

for i = 1, 9 do
    vim.keymap.set("n", "<C-" .. i .. ">", function()
        vim.cmd(i .. "wincmd w")
    end, { desc = "Changes window" })
end

vim.keymap.set ("n","<leader>sv", function ()
   vim.cmd ("vnew")
end, {desc = "Splits window verticaly and does not fill window w buffer"})

vim.keymap.set ("n","<leader>sh", function ()
   vim.cmd ("new")
end, {desc = "Splits window horizontaly and does not fill window w buffer"})
