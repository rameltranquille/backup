local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 30
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    close_on_exit = false, -- close the terminal window when the process exits
    start_in_insert = true,
    shell = vim.o.shell,
    direction = "float",
}

