-- http://projects.haskell.org/xmobar/

Config { 
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=16:antialias=true:hinting=true"
    , bgColor = "#0e1019"
    , fgColor = "#fffaf4"
    , lowerOnStart = True
    , hideOnStart = False
    , allDesktops = True
    , persistent = True
    , alpha = 255
    , commands = [ 
                   Run Date "<fc=#008df8>  %d %b %Y %H:%M </fc>" "date" 10
                 , Run Com "volume" [] "volume" 10
                 , Run Com "battery" [] "battery" 10
                 , Run Com "brightness" [] "brightness" 10
                 , Run Com "/home/kaisererwin/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 10
                 , Run UnsafeStdinReader
      ]
    , alignSep = "}{"
    , template = "%UnsafeStdinReader% }{ \
        \<fc=#ffb900> %brightness%</fc>\
        \<fc=#8ce10b> %battery%</fc>\
        \<fc=#00d8df> %volume% </fc>\
        \%date%\
        \%trayerpad%"
}
