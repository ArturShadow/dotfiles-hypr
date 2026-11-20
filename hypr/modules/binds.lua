local mainMod = "SUPER"

-- Launchers
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi -S run -I"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("wofi -S drun -I"))
hl.bind(mainMod .. " + x", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("wofi-emoji"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/waybar/scripts/toggle.sh"))
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-workspace-monitor.sh"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-mouse-precision.sh"))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float())

-- Sacar del mosaico y mostrar en todos los workspaces (repetir para restaurar)
hl.bind(mainMod .. " + CTRL + F", function()
    hl.dispatch(hl.dsp.window.float())
    hl.dispatch(hl.dsp.window.pin())
end)

-- Mover y redimensionar con el ratón desde cualquier punto de la ventana
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Lock and session
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/lock.sh"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Focus and window movement
for _, direction in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mainMod .. " + " .. direction, hl.dsp.focus({ direction = direction }))
    hl.bind(mainMod .. " + SHIFT + " .. direction, hl.dsp.window.move({ direction = direction }))
end

hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))

-- Workspaces 1-10
for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Workspaces 11-20 on the numpad
for workspace = 11, 20 do
    local key = workspace % 10
    hl.bind(mainMod .. " + KP_" .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + SHIFT + KP_" .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind("ALT + w", hl.dsp.workspace.toggle_special("work"))
hl.bind("ALT + I", hl.dsp.workspace.toggle_special("imvu"))
hl.bind("ALT + P", hl.dsp.workspace.toggle_special("pass"))
hl.bind("XF86Tools", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-ncspot.sh"))
hl.bind("ALT + SHIFT + W", hl.dsp.exec_cmd("hyprctl dispatch workspace 11; sleep 2.0; ~/run-bb.sh"))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + left", hl.dsp.focus({ workspace = "e-1" }))

-- Monitors
hl.bind(mainMod .. " + ALT + left", hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(mainMod .. " + ALT + SHIFT + left", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-workspace-monitor.sh"))
hl.bind(mainMod .. " + ALT + SHIFT + right", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-workspace-monitor.sh"))

-- Volume, brightness and utilities
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --player=ncspot play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl --player=ncspot pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl --player=ncspot previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl --player=ncspot next"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl --player=ncspot stop"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty -e btop"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind("SUPER + SHIFT + F7", hl.dsp.exec_cmd("~/.config/hypr/scripts/battery-profile.sh desk"))
hl.bind("SUPER + SHIFT + F8", hl.dsp.exec_cmd("~/.config/hypr/scripts/battery-profile.sh normal"))
hl.bind("SUPER + SHIFT + F9", hl.dsp.exec_cmd("~/.config/hypr/scripts/battery-profile.sh travel"))
hl.bind("SUPER + SHIFT + F10", hl.dsp.exec_cmd("~/.config/hypr/scripts/battery-profile.sh full"))
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/battery-menu.sh"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd([=[grim -g "$(slurp)" - | wl-copy]=]))
