import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import qualified Data.Map as Map

main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/.xmobarrc"
    xmonad $ defaultConfig
        {
            terminal = "xterm",
            modMask = mod4Mask,
            focusedBorderColor = "#ffffff",
            manageHook = manageDocks <+> manageHook defaultConfig,
            layoutHook = avoidStruts $ layoutHook defaultConfig,
            logHook = dynamicLogWithPP xmobarPP
                {
                    ppOutput = hPutStrLn xmproc,
                    ppTitle = xmobarColor "green" "" . shorten 50
                },
            keys = \c -> keyMap c `Map.union` keys defaultConfig c
        }
    where
        keyMap conf@(XConfig {XMonad.modMask = modMask}) = Map.fromList $
            [ ((modMask, xK_p), spawn "dmenu_run -b") ]
