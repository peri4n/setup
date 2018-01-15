import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

main = xmonad =<< xmobar myConfig

myConfig = defaultConfig {
    modMask = mod4Mask
  , borderWidth        = 1
  , terminal           = "urxvt"
  , normalBorderColor  = "#cccccc"
  , focusedBorderColor = "#1e90ff"
  , focusFollowsMouse = False
  , startupHook = setWMName "LG3D"
  , workspaces         = myWorkspaces
  , manageHook = manageDocks <+> manageHook defaultConfig
  , layoutHook = avoidStruts  $  layoutHook defaultConfig
    }

myWorkspaces :: [String]
myWorkspaces = ["Term", "Dev", "Chat", "Mail"]
