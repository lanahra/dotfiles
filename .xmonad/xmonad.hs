import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import qualified Data.Map as Map


myLogHook xmproc = dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "#859900" "" . shorten 100
    , ppCurrent = xmobarColor "#268bd2" "" . wrap "[" "]"
    , ppSep = xmobarColor "#fdf6e3" "" " : "
    }

myKeys conf@(XConfig {XMonad.modMask = modMask}) = Map.fromList $
    [ ((modMask, xK_p), spawn "dmenu_run -b") ]

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ defaultConfig
        { terminal = "urxvt"
        , modMask = mod4Mask
        , focusedBorderColor = "#ffffff"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , logHook = myLogHook xmproc
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , keys = \c -> myKeys c `Map.union` keys defaultConfig c
        }
