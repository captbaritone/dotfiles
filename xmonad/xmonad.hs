import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Google-chrome" --> doShift "3:web"
    , className =? "Vncviewer"  --> doFloat
    -- , isFullscreen -?> doFloat
    ]

main = do
xmproc <- spawnPipe "xmobar"
xmonad $ defaultConfig
     { terminal    = "gnome-terminal"
     , modMask     = mod4Mask
     , borderWidth = 1
     , workspaces = ["term","vim","web", "4", "5", "6", "7", "8"]
     , focusedBorderColor = "#ffffff"
     , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
     , startupHook = do
        spawn "~/.xmonad/startup-hook"
        -- Map capslock to esc
        spawn "xmodmap -e \"remove Lock = Caps_Lock\""
        spawn "xmodmap -e \"keysym Caps_Lock = Escape\""
        --spawnOn "2:vim" "gvim"
        spawn "gvim"
        spawn "google-chrome"
        spawn "gnome-terminal"
        spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut false --expand true --width 5 --transparent true --tint 0x000000 --height 17"
        spawn "dropbox start"
        spawn "gnome-settings-daemon"
        spawn "nm-applet"
     , layoutHook = avoidStruts  $  layoutHook defaultConfig
     , logHook = dynamicLogWithPP $ xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = shorten 50
        }
     }
