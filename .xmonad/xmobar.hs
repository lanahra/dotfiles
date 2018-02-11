Config {
    font = "xft:Inconsolata:size=12:bold:antialias=true",
    commands = [ Run Date "%a %b %_d %Y * %H:%M:%S" "theDate" 10,
                 Run StdinReader,
                 Run BatteryP [ "BAT0", "BAT1" ]
                              [ "-t", "<acstatus>: <left>% - <timeleft>",
                                "--",
                                "-O", "Charging",
                                "-i", "Idle",
                                "-o", "Discharging",
                                "-h", "green",
                                "-l", "red" ]
                                10 ],
    template = "%StdinReader% }{ %battery% <fc=#FF0000>%theDate%</fc>"
}
