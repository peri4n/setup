module XMonad.MyDocks where

import XMonad
import XMonad.Hooks.DynamicLog

-- Key binding to toggle the gap for the bar.
myToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
myToggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

-- Command to launch the bar.
myBar :: String
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP :: PP
myPP = xmobarPP { 
        ppTitle = xmobarColor "orange" "" . shorten 150
      , ppCurrent = xmobarColor "black" "orange" . wrap " " " "
      , ppUrgent = xmobarColor "red" "" . xmobarStrip
      , ppLayout = xmobarColor "orange" "" . (\x -> case x of
                "Maximize Tall" -> "[|]"
                "Full" -> "[X]"
                _ -> x
                )
        }

