module XMonad.MyLayouts where

import XMonad
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize (minimize)
import XMonad.Layout.NoBorders

myLayout = avoidStruts $ minimize $ smartBorders Full ||| maximize tiled
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

