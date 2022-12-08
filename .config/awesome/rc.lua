pcall(require, "luarocks.loader")
package.loaded["naughty.dbus"] = {}

--- Imports 
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

--local vol_widget = require("widgets.volume-widget.volume")
--local wt_widget  = require("widgets.weather-widget.weather")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")


--- Cosmetic stuff 
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")
beautiful.useless_gap = 12
beautiful.font = "IBM Plex Mono Medium 10.5"

--- Definitions of mostly used programs.
terminal     = "alacritty"
dmenu        = "dmenu_run -fn 'IBM Plex Mono:style=SemiBold:size=11' -nf '#eae3d2' -sf '#000000' -sb '#bbe1fa'"
file_manager = "thunar"
web_browser  = "firefox"
music_player = "deadbeef"
code_editor  = terminal .. " -e " .. "nvim"
mail_client  = "thunderbird"
screen_lock  = "slock"
calculator   = terminal .. " -e " .. "qalc"
calendar     = terminal .. " -e " .. "calcurse"

--- Commands used with hotkeys.
play_pause   = "playerctl play-pause"
raise_volume = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
lower_volume = "pactl set-sink-volume @DEFAULT_SINK@ -5%"
mute_volume  = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
mute_mic     = "pactl set-source-mute @DEFAULT_SOURCE@ toggle"
media_prev   = "playerctl previous"
media_next   = "playerctl next"
ss_util      = "flameshot gui"
switch_kb    = "sh -c \"setxkbmap -query | grep -q \'us\' && setxkbmap -layout tr || setxkbmap -layout us\""

modkey = "Mod4"

--- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair,
    awful.layout.suit.floating,
}

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Widgets
mykeyboardlayout = awful.widget.keyboardlayout()
mytextclock = wibox.widget.textclock("|📅%a %d.%m.%y ⏰%H:%M")

-- Mouse key bindings to taglist widget.
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end)
                )

awful.screen.connect_for_each_screen(function(s)
	
    -- Each screen has its own tag table.
    awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 25 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mylayoutbox,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            awful.widget.watch('sb-loadavg', 1),
            awful.widget.watch('sb-memory', 1),
            awful.widget.watch('sb-network', 1),
            wibox.widget.systray(),
            mytextclock,
        },
    }
end)
-- }}}


-- Keys 
globalkeys = gears.table.join(
    awful.key({ modkey }, "Left",   awful.tag.viewprev),
    awful.key({ modkey }, "Right",  awful.tag.viewnext),
    awful.key({ modkey }, "Tab",    awful.tag.history.restore),


    awful.key({ modkey, "Control" }, "r", awesome.restart ),
    awful.key({ "Mod1", "Control" }, "Delete", awesome.quit ),

    awful.key({ modkey }, "l", function () awful.tag.incmwfact( 0.05) end), 
    awful.key({ modkey }, "h", function () awful.tag.incmwfact(-0.05) end),

    awful.key({ "Mod1",}, "Tab", function () awful.client.focus.byidx( 1) end ),
    awful.key({ modkey, "Shift" }, "w",   function () awful.client.movetoscreen() end),
    awful.key({ modkey }, "w",   function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey }, "Tab", function () awful.client.focus.history.previous() if client.focus then client.focus:raise() end end),
    awful.key({ modkey, "Control" }, "space", function () awful.layout.inc( 1) end),

    -- Launch programs.
    awful.key({ modkey }, "Return", function () awful.spawn(terminal)     end),
    awful.key({ modkey }, "F1",     function () awful.spawn(file_manager) end),
    awful.key({ modkey }, "F2",     function () awful.spawn(web_browser)  end),
    awful.key({ modkey }, "F3",     function () awful.spawn(mail_client)  end),
    awful.key({ modkey }, "F4",     function () awful.spawn(code_editor)  end),
    awful.key({ modkey }, "F5",     function () awful.spawn(music_player) end),
    awful.key({ modkey }, "d",      function () awful.spawn(dmenu)        end),
    awful.key({ },        "Print",  function () awful.spawn(ss_util)      end),
    awful.key({ modkey,  "Shift" }, "l",   function () awful.spawn(screen_lock)  end),
    awful.key({ modkey },"XF86Calculator", function () awful.spawn(calendar)   end),

    -- Media keys.
    awful.key({},"XF86Calculator",  function () awful.spawn(calculator)   end),
    awful.key({},"XF86AudioPlay",   function () awful.spawn(play_pause)   end),
    awful.key({},"XF86AudioRaiseVolume",  function () awful.spawn(raise_volume)   end),
    awful.key({},"XF86AudioLowerVolume",  function () awful.spawn(lower_volume)   end),
    awful.key({},"XF86AudioMute",   function () awful.spawn(mute_volume)    end),
    awful.key({ modkey },"XF86AudioMute",  function () awful.spawn(mute_mic)end),
    awful.key({ modkey },"F11",  function () awful.spawn(media_prev) end),
    awful.key({ modkey },"F12",  function () awful.spawn(media_next) end),
    
    -- Misc commands
    awful.key({ modkey }, "space",     function () awful.spawn(switch_kb) end)

)

clientkeys = gears.table.join(
    awful.key({ modkey }, "f", function (c) c.fullscreen = not c.fullscreen c:raise() end),
    awful.key({ modkey }, "q", function (c) c:kill() end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    }
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
   if not awesome.startup then awful.client.setslave(c) end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--
awesome.connect_signal(
    'startup',
    function(args)
        awful.util.spawn('bash -c "rm ~/.awesome-restart || ~/.config/awesome/autostart.sh"')
    end
)

