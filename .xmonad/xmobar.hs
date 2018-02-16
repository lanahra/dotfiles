Config
    { bgColor = "#002b36"
    , fgColor = "#839496"
    , font = "xft:Inconsolata:size=14:antialias=true"
    , commands =
        [ Run Date "%d/%m/%y %H:%M" "date" 10
        , Run StdinReader
        , Run Brightness
            [ "-t", "<percent>%"
            , "-w", "3"
            , "--"
            , "-D", "intel_backlight"
            ]
            10
        , Run Battery
            [ "-t", "<leftipat>"
            , "-w", "3"
            , "--"
            , "--on-icon-pattern", "<fc=#859900><left>%</fc>"
            , "--off-icon-pattern", "<left>%"
            , "--idle-icon-pattern", "<fc=#268bd2><left>%</fc>"
            ]
            10
        , Run DynNetwork
            [ "-t", "<dev> <rx> | <tx>"
            , "-S", "true"
            , "-w", "6"
            ]
            10
        ]
    , template =
        "%StdinReader% }{ \
        \%dynnetwork% <fc=#fdf6e3>:</fc> \
        \%bright% <fc=#fdf6e3>:</fc> \
        \%battery% <fc=#fdf6e3>:</fc> \
        \<fc=#268bd2>%date%</fc>"
    }
