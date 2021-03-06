Config
    { bgColor = "#002b36"
    , fgColor = "#839496"
    , font = "xft:Input:style=bold:size=11:antialias=true"
    , iconRoot = ".xmonad/icons"
    , commands =
        [ Run Date "%d/%m/%y %H:%M" "date" 10
        , Run StdinReader
        , Run Brightness
            [ "-t", "<ipat>"
            , "-w", "3"
            , "--"
            , "-D", "intel_backlight"
            , "--brightness-icon-patter"
            , "<icon=brightness/%%.xpm/> <percent>%"
            ]
            10
        , Run Battery
            [ "-t", "<leftipat>"
            , "-w", "3"
            , "--"
            , "--on-icon-pattern"
            , "<icon=batteryac/%%.xpm/> <fc=#859900><left>%</fc>"
            , "--off-icon-pattern"
            , "<icon=battery/%%.xpm/> <left>%"
            , "--idle-icon-pattern"
            , "<icon=batteryac/%%.xpm/> <fc=#268bd2><left>%</fc>"
            ]
            10
        , Run DynNetwork
            [ "-t", "<dev> <rxipat> <txipat>"
            , "-S", "true"
            , "-w", "6"
            , "--"
            , "--rx-icon-pattern", "<icon=rx.xpm/> <rx>"
            , "--tx-icon-pattern", "<icon=tx.xpm/> <tx>"
            ]
            10
        , Run Com ".xmonad/scripts/sound.sh" [] "sound" 10
        , Run Com ".xmonad/scripts/mic.sh" [] "mic" 10
        ]
    , template =
        "%StdinReader% }{ \
        \%dynnetwork% <fc=#fdf6e3>:</fc> \
        \%sound% <fc=#fdf6e3>:</fc> \
        \%mic% <fc=#fdf6e3>:</fc> \
        \%bright% <fc=#fdf6e3>:</fc> \
        \%battery% <fc=#fdf6e3>:</fc> \
        \<fc=#268bd2>%date%</fc>"
    }
