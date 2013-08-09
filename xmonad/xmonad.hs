import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Google-chrome"       --> doShift "3"
    , className =? "Vncviewer"  --> doFloat
    ]

main = do
xmproc <- spawnPipe "xmobar"
xmonad $ defaultConfig
     { terminal    = "gnome-terminal"
     , modMask     = mod4Mask
     , borderWidth = 1
     , workspaces = ["term","vim","web"]
     , focusedBorderColor = "#ffffff"
     , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
     , layoutHook = avoidStruts  $  layoutHook defaultConfig
     , logHook = dynamicLogWithPP $ xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = xmobarColor "green" "" . shorten 50
        }
     }
