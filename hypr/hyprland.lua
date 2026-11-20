-- Hyprland configuration (Lua format, supported since Hyprland 0.55).

require("modules.screen")
require("modules.autostart")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

require("modules.decorations")

hl.config({
    debug = {
        disable_logs = false,
        gl_debugging = true,
    },

    input = {
        kb_layout = "us,latam",
        kb_variant = "intl",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        numlock_by_default = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.device({
    name = "at-translated-set-2-keyboardi",
    enabled = false,
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

require("modules.binds")
require("modules.windowrules")
