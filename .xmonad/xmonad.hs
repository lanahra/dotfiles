import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import Graphics.X11.ExtraTypes.XF86
import qualified Data.Map as Map


myLogHook xmproc = dynamicLogWithPP def
    { ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "#859900" ""
    , ppCurrent = xmobarColor "#268bd2" "" . wrap "[" "]"
    , ppSep = xmobarColor "#fdf6e3" "" " : "
    }

myKeys conf@(XConfig {XMonad.modMask = modMask}) = Map.fromList $
    [ ((modMask, xK_p), spawn "dmenu_run -b")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
    ]

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ def
        { terminal = "urxvt"
        , modMask = mod4Mask
        , focusedBorderColor = "#ffffff"
        , manageHook = manageDocks <+> manageHook def
        , handleEventHook = handleEventHook def <+> docksEventHook
        , layoutHook = avoidStruts $ layoutHook def
        , logHook = myLogHook xmproc
        , keys = \c -> myKeys c `Map.union` keys def c
        }
