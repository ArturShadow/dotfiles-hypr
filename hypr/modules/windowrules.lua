hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({ name = "chromium-environment", match = { class = "chromium" }, workspace = "1" })
hl.window_rule({ name = "chatgpt-codex", match = { class = "codex-desktop" }, workspace = "3" })
hl.window_rule({ name = "kitty", match = { class = "kitty" }, workspace = "4" })
hl.window_rule({
    name = "visual-studio-code",
    match = { class = "code" },
    -- Move Code to workspace 2 without stealing the focus while it starts.
    workspace = "2 silent",
})
hl.window_rule({ name = "bb-backend", match = { title = "^BB-Backend$" }, workspace = "12" })
hl.window_rule({ name = "imvu", match = { title = "Loading IMVU" }, workspace = "special:imvu" })
hl.window_rule({ name = "ncspot", match = { class = "^ncspot$" }, workspace = "special:ncspot" })
hl.window_rule({
    name = "proton-pass",
    match = { class = "^(proton-pass|Proton Pass)$" },
    workspace = "special:pass",
})
hl.window_rule({
    name = "kruler",
    match = { class = "^(org\\.kde\\.kruler|kruler)$" },
    float = true,
    center = true,
    decorate = false,
    border_size = 0,
    rounding = 0,
    no_shadow = true,
    no_blur = true,
    no_dim = true,
})

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1" })
hl.workspace_rule({
    workspace = "2",
    monitor = "eDP-1",
})

hl.on("workspace.created", function(ws)
    if not ws.is_empty or ws.name ~= "2" then return end
    hl.exec_cmd("code /home/lbluis/workspace/BB-FE-contract-statement")
end)
