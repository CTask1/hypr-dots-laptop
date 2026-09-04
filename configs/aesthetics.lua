--####################
--## LOOK AND FEEL ###
--####################

-- Refer to https://wiki.hypr.land/Configuring/Variables/

local gaps_in = 5
local gaps_out = 3
local bordera = { colors = { "rgba(335599ff)", "rgba(0055aaee)" }, angle = 270 }
local borderi = "rgba(19395bcc)"
local border_size = 2
local opacitya = .98
local opacityi = .9
local blur_size = 3
local blur_passes = 1
local shadow_range = 5
local shadow_render_power = 1
local shadow_color = "rgba(333366bb)"

-- https://wiki.hypr.land/Configuring/Variables/#general

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2.5,
    bezier = "easeInOutCubic",
    style = "slide",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 2.5,
    bezier = "easeInOutCubic",
    style = "slide right",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 2,
    bezier = "easeInOutCubic",
    style = "slide left",
})
hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 7,
    bezier = "quick",
})

hl.config({
    general = {
        gaps_in = gaps_in,
        gaps_out = gaps_out,
        border_size = border_size,
        -- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = bordera,
            inactive_border = borderi,
        },
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "master",
    },
    -- https://wiki.hypr.land/Configuring/Variables/#decoration
    decoration = {
        rounding = 10,
        rounding_power = 2,
        -- Change transparency of focused and unfocused windows
        active_opacity = opacitya,
        inactive_opacity = opacityi,
        shadow = {
            enabled = true,
            range = shadow_range,
            render_power = shadow_render_power,
            color = shadow_color,
        },
        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = blur_size,
            passes = blur_passes,
            vibrancy = 0.1696,
        },
    },
    -- https://wiki.hypr.land/Configuring/Variables/#animations
    animations = {
        enabled = true,
        -- Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
        --        NAME,           X0,   Y0,   X1,   Y1
        -- Default animations, see https://wiki.hypr.land/Configuring/Animations/
        --           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
    },
    -- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/
    -- "Smart gaps" / "No gaps when only"
    -- uncomment all if you wish to use that.
    -- workspace = w[tv1], gapsout:0, gapsin:0
    -- workspace = f[1], gapsout:0, gapsin:0
    -- windowrule {
    --     name = no-gaps-wtv1
    --     match:float = false
    --     match:workspace = w[tv1]
    --
    --     border_size = 0
    --     rounding = 0
    -- }
    --
    -- windowrule {
    --     name = no-gaps-f1
    --     match:float = false
    --     match:workspace = f[1]
    --
    --     border_size = 0
    --     rounding = 0
    -- }
    -- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
    dwindle = {
        preserve_split = true, -- You probably want this
    },
    -- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
    master = {
        new_status = "slave",
        mfact = .5,
        new_on_top = false,
        new_on_active = "none",
        allow_small_split = false,
        orientation = "left",
        drop_at_cursor = true,
    },
    -- https://wiki.hypr.land/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})
