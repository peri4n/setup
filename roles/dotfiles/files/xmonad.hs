import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

main = xmonad =<< xmobar defaultConfig { 
      borderWidth        = 1
    , terminal           = "urxvt"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#1e90ff"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    }
