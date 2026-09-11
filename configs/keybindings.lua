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

local dsp = hl.dsp
local focus = dsp.focus
local cmd = dsp.exec_cmd
local window = dsp.window
local move = window.move
local asink = "@DEFAULT_AUDIO_SINK@"
local asource = "@DEFAULT_AUDIO_SOURCE@"

binds ({
    {"SHIFT + Q", window.close()},
    {"E", cmd(vars.fileManager)},
    {"T", cmd(vars.textedit)},
    {"SHIFT + T", cmd(vars.textedith)},
    {"N", cmd(vars.texteditn)},
    {"P", cmd(vars.texteditp)},
    {"C", cmd(vars.texteditc)},
    {"F", window.fullscreen({ mode = "maximized", action = "toggle" })},
    {"Return", cmd(vars.terminal)},
    {"V", window.float({ action = "toggle" })},
    {"B", cmd(vars.browser)},
    {"Space", cmd(vars.menu)},
    {"CTRL + ALT + SHIFT + Q", cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'")},
    {"CTRL + SHIFT + Q", cmd("hyprshutdown")},
    {"L", cmd("hyprlock")},
    -- Move focus with mainMod + arrow keys
    {"left", focus({ direction = "left" })},
    {"right", focus({ direction = "right" })},
    {"up", focus({ direction = "up" })},
    {"down", focus({ direction = "down" })},
    -- Move active window with mainMod + Shift + arrow keys
    {"SHIFT + left", move({ direction = "left" })},
    {"SHIFT + right", move({ direction = "right" })},
    {"SHIFT + up", move({ direction = "up" })},
    {"SHIFT + down", move({ direction = "down" })},
    -- Switch workspaces with mainMod + [0-9]
    {"1", focus({ workspace = 1 })},
    {"2", focus({ workspace = 2 })},
    {"3", focus({ workspace = 3 })},
    {"4", focus({ workspace = 4 })},
    {"5", focus({ workspace = 5 })},
    {"6", focus({ workspace = 6 })},
    {"7", focus({ workspace = 7 })},
    {"8", focus({ workspace = 8 })},
    {"9", focus({ workspace = 9 })},
    {"0", focus({ workspace = 10 })},
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    {"SHIFT + 1", move({ workspace = 1 })},
    {"SHIFT + 2", move({ workspace = 2 })},
    {"SHIFT + 3", move({ workspace = 3 })},
    {"SHIFT + 4", move({ workspace = 4 })},
    {"SHIFT + 5", move({ workspace = 5 })},
    {"SHIFT + 6", move({ workspace = 6 })},
    {"SHIFT + 7", move({ workspace = 7 })},
    {"SHIFT + 8", move({ workspace = 8 })},
    {"SHIFT + 9", move({ workspace = 9 })},
    {"SHIFT + 0", move({ workspace = 10 })},
    -- Special workspaces
    {"S", dsp.workspace.toggle_special("term")},
    {"SHIFT + S", move({ workspace = "special:term" })},
    {"X", dsp.workspace.toggle_special("work1")},
    {"SHIFT + X", move({ workspace = "special:work1" })},
    {"Z", dsp.workspace.toggle_special("work2")},
    {"SHIFT + Z", move({ workspace = "special:work2" })},
    {"A", dsp.workspace.toggle_special("work3")},
    {"SHIFT + A", move({ workspace = "special:work3" })},
    -- Scroll through existing workspaces with mainMod + scroll
    {"mouse_down", focus({ workspace = "e+1" })},
    {"mouse_up", focus({ workspace = "e-1" })},
    -- Move/resize windows with mainMod + LMB/RMB and dragging
    {"mouse:272", window.drag()},
    {"mouse:273", window.resize()},
    -- Screenshots
    {"Print", cmd("grim ~/Pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') && notify-send \"Screenshot taken\" \"Saved to Pictures\"")},
    {"SHIFT + Print", cmd("grim -g \"$(slurp)\" ~/Pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png') && notify-send \"Screenshot taken\" \"Saved to Pictures\"")},
})

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", cmd("wpctl set-volume -l 1 " .. asink .. " 5%+ && notify-send \"Volume increased\" \"$(wpctl get-volume " .. asink .. ")\""), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", cmd("wpctl set-volume " .. asink .. " 5%- && notify-send \"Volume decreased\" \"$(wpctl get-volume " .. asink .. ")\""), { locked = true, repeating = true })
hl.bind("XF86AudioMute", cmd("wpctl set-mute " .. asink .. " toggle && notify-send \"Audio State Changed\" \"$(wpctl get-volume " .. asink .. ")\""), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", cmd("wpctl set-mute " .. asource .. " toggle && notify-send \"Mic State Changed\" \"$(wpctl get-volume " .. asource .. ")\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", cmd("brightnessctl -e4 -n2 set 5%+ && notify-send \"Brightness increased\" \"Brightness: $(($(brightnessctl g) * 100 / $(brightnessctl m)))%\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", cmd("brightnessctl -e4 -n2 set 5%- && notify-send \"Brightness decreased\" \"Brightness: $(($(brightnessctl g) * 100 / $(brightnessctl m)))%\""), { locked = true, repeating = true })

-- Screenshots
hl.bind("Print", cmd("grim - | wl-copy && notify-send \"Screenshot taken\" \"Copied to clipboard\""))
hl.bind("SHIFT + Print", cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send \"Screenshot taken\" \"Copied to clipboard\""))
