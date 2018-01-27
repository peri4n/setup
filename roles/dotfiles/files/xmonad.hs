import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.Maximize
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
  , focusFollowsMouse  = False
  , startupHook        = setWMName "LG3D"
  , workspaces         = myWorkspaces
  , manageHook         = manageDocks <+> myManageHook <+> manageHook defaultConfig
  , layoutHook         = avoidStruts  $ myLayout
    }

myWorkspaces :: [String]
myWorkspaces = ["Web", "Dev", "Chat", "Mail"]

myManageHook  = composeAll [ 
  appName  =? "Navigator"       --> doShift "Web" -- firefox
                          ]

myLayout = maximize (tiled) ||| Mirror tiled ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100
