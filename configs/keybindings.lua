--##################
--## KEYBINDINGS ###
--##################

-- See https://wiki.hypr.land/Configuring/Keywords/

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local vars = {
    terminal = "kitty",
    fileManager = "dolphin",
    menu = "rofi -show drun",
    browser = "zen-browser",
    textedit = "code",
    textedith = "code ~/.config/hypr",
    texteditn = "code ~/Documents/Notes",
    texteditp = "code ~/Documents/Programming",
    texteditc = "code ~/Documents/Programming/CPP/Sepulcher",
}

local function binds(kb)
    for _, pair in ipairs(kb) do
        hl.bind(mainMod .. " + " .. pair[1], pair[2])
    end
end

binds ({
    {"SHIFT + Q", hl.dsp.window.close()},
    {"E", hl.dsp.exec_cmd(vars.fileManager)},
    {"T", hl.dsp.exec_cmd(vars.textedit)},
    {"SHIFT + T", hl.dsp.exec_cmd(vars.textedith)},
    {"CTRL + T", hl.dsp.exec_cmd(vars.texteditn)},
    {"F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })},
    {"Return", hl.dsp.exec_cmd(vars.terminal)},
    {"V", hl.dsp.window.float({ action = "toggle" })},
    {"B", hl.dsp.exec_cmd(vars.browser)},
    {"Space", hl.dsp.exec_cmd(vars.menu)},
    {"CTRL + ALT + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'")},
    {"CTRL + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown")},
    {"L", hl.dsp.exec_cmd("hyprlock")},
    -- Move focus with mainMod + arrow keys
    {"left", hl.dsp.focus({ direction = "left" })},
    {"right", hl.dsp.focus({ direction = "right" })},
    {"up", hl.dsp.focus({ direction = "up" })},
    {"down", hl.dsp.focus({ direction = "down" })},
    -- Move active window with mainMod + Shift + arrow keys
    {"SHIFT + left", hl.dsp.window.move({ direction = "left" })},
    {"SHIFT + right", hl.dsp.window.move({ direction = "right" })},
    {"SHIFT + up", hl.dsp.window.move({ direction = "up" })},
    {"SHIFT + down", hl.dsp.window.move({ direction = "down" })},
    -- Switch workspaces with mainMod + [0-9]
    {"1", hl.dsp.focus({ workspace = 1 })},
    {"2", hl.dsp.focus({ workspace = 2 })},
    {"3", hl.dsp.focus({ workspace = 3 })},
    {"4", hl.dsp.focus({ workspace = 4 })},
    {"5", hl.dsp.focus({ workspace = 5 })},
    {"6", hl.dsp.focus({ workspace = 6 })},
    {"7", hl.dsp.focus({ workspace = 7 })},
    {"8", hl.dsp.focus({ workspace = 8 })},
    {"9", hl.dsp.focus({ workspace = 9 })},
    {"0", hl.dsp.focus({ workspace = 10 })},
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    {"SHIFT + 1", hl.dsp.window.move({ workspace = 1 })},
    {"SHIFT + 2", hl.dsp.window.move({ workspace = 2 })},
    {"SHIFT + 3", hl.dsp.window.move({ workspace = 3 })},
    {"SHIFT + 4", hl.dsp.window.move({ workspace = 4 })},
    {"SHIFT + 5", hl.dsp.window.move({ workspace = 5 })},
    {"SHIFT + 6", hl.dsp.window.move({ workspace = 6 })},
    {"SHIFT + 7", hl.dsp.window.move({ workspace = 7 })},
    {"SHIFT + 8", hl.dsp.window.move({ workspace = 8 })},
    {"SHIFT + 9", hl.dsp.window.move({ workspace = 9 })},
    {"SHIFT + 0", hl.dsp.window.move({ workspace = 10 })},
    -- Example special workspace (scratchpad)
    {"S", hl.dsp.workspace.toggle_special("term")},
    {"SHIFT + S", hl.dsp.window.move({ workspace = "special:term" })},
    {"X", hl.dsp.workspace.toggle_special("work1")},
    {"SHIFT + X", hl.dsp.window.move({ workspace = "special:work1" })},
    {"Z", hl.dsp.workspace.toggle_special("work2")},
    {"SHIFT + Z", hl.dsp.window.move({ workspace = "special:work2" })},
    {"A", hl.dsp.workspace.toggle_special("work3")},
    {"SHIFT + A", hl.dsp.window.move({ workspace = "special:work3" })},
    -- Scroll through existing workspaces with mainMod + scroll
    {"mouse_down", hl.dsp.focus({ workspace = "e+1" })},
    {"mouse_up", hl.dsp.focus({ workspace = "e-1" })},
    -- Move/resize windows with mainMod + LMB/RMB and dragging
    {"mouse:272", hl.dsp.window.drag()},
    {"mouse:273", hl.dsp.window.resize()},
    -- Screenshots
    {"Print", hl.dsp.exec_cmd("grim ~/Pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') && notify-send \"Screenshot taken\" \"Saved to Pictures\"")},
    {"SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') && notify-send \"Screenshot taken\" \"Saved to Pictures\"")},
})

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && notify-send \"Volume increased\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify-send \"Volume decreased\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send \"Audio State Changed\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify-send \"Mic State Changed\" \"$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+ && notify-send \"Brightness increased\" \"Brightness: $(($(brightnessctl g) * 100 / $(brightnessctl m)))%\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%- && notify-send \"Brightness decreased\" \"Brightness: $(($(brightnessctl g) * 100 / $(brightnessctl m)))%\""), { locked = true, repeating = true })

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy && notify-send \"Screenshot taken\" \"Copied to clipboard\""))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send \"Screenshot taken\" \"Copied to clipboard\""))

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
