module XMonad.MyManageHooks where

import           Data.List (isPrefixOf)
import           XMonad

myManageHook =
  composeAll
    [ isPrefixOf "jetbrains" <$> className --> doShift "Dev"
    , isPrefixOf "qutebrowser" <$> className --> doShift "Web"
    , (className =? "Slack") --> doF (W.shift "Chat")
    ] <+>
  manageHook def
