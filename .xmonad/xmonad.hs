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
    , ((modMask, xK_s), spawn "slock")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
    , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ((0, xF86XK_AudioMicMute), spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
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
