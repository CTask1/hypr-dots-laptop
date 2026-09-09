--##################
--## KEYBINDINGS ###
--##################

-- See https://wiki.hypr.land/Configuring/Keywords/

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local vars = {
    terminal = "kitty",
    fileManager = "thunar",
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

local dsp = hl.dsp
local cmd = dsp.exec_cmd
local window = dsp.window

binds ({
    {"SHIFT + Q", window.close()},
    {"E", cmd(vars.fileManager)},
    {"T", cmd(vars.textedit)},
    {"SHIFT + T", cmd(vars.textedith)},
    {"CTRL + T", cmd(vars.texteditn)},
    {"F", window.fullscreen({ mode = "maximized", action = "toggle" })},
    {"Return", cmd(vars.terminal)},
    {"V", window.float({ action = "toggle" })},
    {"B", cmd(vars.browser)},
    {"Space", cmd(vars.menu)},
    {"CTRL + ALT + SHIFT + Q", cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'")},
    {"CTRL + SHIFT + Q", cmd("hyprshutdown")},
    {"L", cmd("hyprlock")},
    -- Move focus with mainMod + arrow keys
    {"left", dsp.focus({ direction = "left" })},
    {"right", dsp.focus({ direction = "right" })},
    {"up", dsp.focus({ direction = "up" })},
    {"down", dsp.focus({ direction = "down" })},
    -- Move active window with mainMod + Shift + arrow keys
    {"SHIFT + left", window.move({ direction = "left" })},
    {"SHIFT + right", window.move({ direction = "right" })},
    {"SHIFT + up", window.move({ direction = "up" })},
    {"SHIFT + down", window.move({ direction = "down" })},
    -- Switch workspaces with mainMod + [0-9]
    {"1", dsp.focus({ workspace = 1 })},
    {"2", dsp.focus({ workspace = 2 })},
    {"3", dsp.focus({ workspace = 3 })},
    {"4", dsp.focus({ workspace = 4 })},
    {"5", dsp.focus({ workspace = 5 })},
    {"6", dsp.focus({ workspace = 6 })},
    {"7", dsp.focus({ workspace = 7 })},
    {"8", dsp.focus({ workspace = 8 })},
    {"9", dsp.focus({ workspace = 9 })},
    {"0", dsp.focus({ workspace = 10 })},
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    {"SHIFT + 1", window.move({ workspace = 1 })},
    {"SHIFT + 2", window.move({ workspace = 2 })},
    {"SHIFT + 3", window.move({ workspace = 3 })},
    {"SHIFT + 4", window.move({ workspace = 4 })},
    {"SHIFT + 5", window.move({ workspace = 5 })},
    {"SHIFT + 6", window.move({ workspace = 6 })},
    {"SHIFT + 7", window.move({ workspace = 7 })},
    {"SHIFT + 8", window.move({ workspace = 8 })},
    {"SHIFT + 9", window.move({ workspace = 9 })},
    {"SHIFT + 0", window.move({ workspace = 10 })},
    -- Example special workspace (scratchpad)
    {"S", dsp.workspace.toggle_special("term")},
    {"SHIFT + S", window.move({ workspace = "special:term" })},
    {"X", dsp.workspace.toggle_special("work1")},
    {"SHIFT + X", window.move({ workspace = "special:work1" })},
    {"Z", dsp.workspace.toggle_special("work2")},
    {"SHIFT + Z", window.move({ workspace = "special:work2" })},
    {"A", dsp.workspace.toggle_special("work3")},
    {"SHIFT + A", window.move({ workspace = "special:work3" })},
    -- Scroll through existing workspaces with mainMod + scroll
    {"mouse_down", dsp.focus({ workspace = "e+1" })},
    {"mouse_up", dsp.focus({ workspace = "e-1" })},
    -- Move/resize windows with mainMod + LMB/RMB and dragging
    {"mouse:272", window.drag()},
    {"mouse:273", window.resize()},
    -- Screenshots
    {"Print", cmd("grim ~/Pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') && notify-send \"Screenshot taken\" \"Saved to Pictures\"")},
    {"SHIFT + Print", cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') && notify-send \"Screenshot taken\" \"Saved to Pictures\"")},
})

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && notify-send \"Volume increased\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify-send \"Volume decreased\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""), { locked = true, repeating = true })
hl.bind("XF86AudioMute", cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send \"Audio State Changed\" \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify-send \"Mic State Changed\" \"$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", cmd("brightnessctl -e4 -n2 set 5%+ && notify-send \"Brightness increased\" \"Brightness: $(($(brightnessctl g) * 100 / $(brightnessctl m)))%\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", cmd("brightnessctl -e4 -n2 set 5%- && notify-send \"Brightness decreased\" \"Brightness: $(($(brightnessctl g) * 100 / $(brightnessctl m)))%\""), { locked = true, repeating = true })

-- Screenshots
hl.bind("Print", cmd("grim - | wl-copy && notify-send \"Screenshot taken\" \"Copied to clipboard\""))
hl.bind("SHIFT + Print", cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send \"Screenshot taken\" \"Copied to clipboard\""))
