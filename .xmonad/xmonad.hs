import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import Graphics.X11.ExtraTypes.XF86
import qualified Data.Map as Map

xF86XK_AudioMicMute = 0x1008ffb2

myLogHook xmproc = dynamicLogWithPP def
    { ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "#859900" ""
    , ppCurrent = xmobarColor "#268bd2" "" . wrap "[" "]"
    , ppSep = xmobarColor "#fdf6e3" "" " : "
    }

myKeys conf@(XConfig {XMonad.modMask = modMask}) = Map.fromList $
    [ ((modMask, xK_p), spawn "dmenu_run -b")
    , ((modMask, xK_s), spawn "xset dpms force off && slock")
    , ((modMask, xK_i), spawn "import png:- | xclip -selection clipboard -t image/png")
    , ((modMask, xK_F1), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((modMask, xK_F2), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ((modMask, xK_F3), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ((modMask, xK_F4), spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    , ((modMask, xK_F5), spawn "xbacklight -dec 10")
    , ((modMask, xK_F6), spawn "xbacklight -inc 10")
    , ((modMask, xK_F8), spawn "~/.xmonad/scripts/toggle_wifi.sh")
    ]

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ def
        { terminal = "urxvt"
        , modMask = mod4Mask
        , focusedBorderColor = "#ffffff"
        , startupHook = setWMName "LG3D"
        , manageHook = manageDocks <+> manageHook def
        , handleEventHook = handleEventHook def <+> docksEventHook
        , layoutHook = avoidStruts $ layoutHook def
        , logHook = myLogHook xmproc
        , keys = \c -> myKeys c `Map.union` keys def c
        }
