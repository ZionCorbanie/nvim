require("neo-tree").setup({
    event_handlers = {{
        event = "file_opened",
        handler = function(file_path)
        -- auto close Neo-tree after opening a file
        require("neo-tree.command").execute({ action = "close" })
        end
    },},
    filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
    },
    default_component_configs = {
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
        },
    },
    window = {
        mappings = {
            ["<Tab>"] = "toggle_preview", -- toggle preview manually
        },
        position = "left",
        width = 30,
    },
    enable_preview = true,
})
