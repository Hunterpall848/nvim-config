-- provides alpha-nvim with a timer counting all time spent with neovim open

local started_at = vim.uv.hrtime()

vim.fn.mkdir(vim.fn.stdpath("data") .. "/nvim-timer", "p")
local tr_path = vim.fn.stdpath("data") .. "/nvim-timer/ttl_rntime.txt"
local bkup_path = tr_path .. ".bak"

local function calc_elapsed ()
    local elapsed = (vim.uv.hrtime() - started_at) / 1e9
    return elapsed
end

local function calctime (time)
    time = time or calc_elapsed()
    local h = math.floor(time / 3600)
    local m = math.floor((time % 3600) / 60)
    local s = math.floor(time % 60)
    return h, m, s
end

local function format_time (time)
    local h, m, s, _ = calctime(time)
    return string.format("%02d:%02d:%02d", h, m, s)
end

local function get_saved_total ()
    if not vim.uv.fs_stat(tr_path) then
        return 0
    end
    local lines = vim.fn.readfile(tr_path)
    local pst_time = lines[#lines]
    return pst_time
end

local function timeintervals ()
    local pst_time = get_saved_total()
    local elapsed = calc_elapsed()
    local cur_time = math.floor(elapsed)
    local ttl_time = pst_time + cur_time
    return cur_time, ttl_time
end

local function writetime ()
    local pst_time = get_saved_total()
    local cur_time, ttl_time = timeintervals()
    if vim.uv.fs_stat(tr_path) then
        vim.fn.writefile({ttl_time}, tr_path, "a")
        vim.fn.writefile({pst_time}, bkup_path)
    else
        -- creates a fresh file and backup
        vim.fn.writefile({cur_time}, tr_path, "a")
        vim.fn.writefile({cur_time}, bkup_path)
    end
end

local function alpha_time ()
    return format_time(get_saved_total())
end

vim.api.nvim_create_user_command("WriteTime", writetime, {})
vim.api.nvim_create_autocmd("VimLeave", {callback = writetime})
vim.api.nvim_create_user_command("Time",  function ()
    print("Local Elapsed Session Time (h|m|s) ==> " .. format_time())
end, {} )

return {
    alpha_time()
}
