module XMonad.MyEventHooks where

import XMonad
import XMonad.Hooks.Minimize
import XMonad.Hooks.ManageDocks

myEventHooks = handleEventHook def <+> docksEventHook <+> minimizeEventHook
