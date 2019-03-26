module XMonad.MyLayouts where

import XMonad
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize (minimize)
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (Rename(..), renamed)

myLayout = avoidStruts $ minimize $ full ||| tiled
    where
        full  = renamed [Replace "FS"] $ smartBorders Full
        tiled = renamed [Replace "TL"] $ maximize (Tall nmaster delta ratio)
        nmaster = 1
        ratio = 1/2
        delta = 3/100

