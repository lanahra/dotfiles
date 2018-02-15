Config
    { bgColor = "#002b36"
    , fgColor = "#839496"
    , font = "xft:Inconsolata:size=14:antialias=true"
    , commands =
        [ Run Date "%d/%m/%y %H:%M" "theDate" 10
        , Run StdinReader
        , Run BatteryP
            [ "BAT0", "BAT1" ]
            [ "-t", "<acstatus>: <left>% - <timeleft>"
            , "--"
            , "-O", "Charging"
            , "-i", "Idle"
            , "-o", "Discharging"
            ]
            10
        ]
    , template = "%StdinReader% }{ %battery% <fc=#fdf6e3>%theDate%</fc>"
    }
