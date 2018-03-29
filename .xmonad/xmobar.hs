Config
    { bgColor = "#002b36"
    , fgColor = "#839496"
    , font = "xft:Inconsolata:size=14:antialias=true"
    , iconRoot = ".xmonad/icons"
    , commands =
        [ Run Date "%d/%m/%y %H:%M" "date" 10
        , Run StdinReader
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
        ]
    , template =
        "%StdinReader% }{ \
        \%dynnetwork% <fc=#fdf6e3>:</fc> \
        \%sound% <fc=#fdf6e3>:</fc> \
        \<fc=#268bd2>%date%</fc>"
    }
