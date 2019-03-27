module XMonad.MyKeys where

import           Data.Map                 as M

import qualified XMonad.StackSet          as W

import           System.Exit

import           XMonad
import           XMonad.Actions.Minimize
import           XMonad.Actions.WindowGo
import           XMonad.Prompt
import           XMonad.Prompt.FuzzyMatch
import           XMonad.Prompt.Pass
import           XMonad.Util.Run

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig {XMonad.modMask = modMask} =
  M.fromList $
    -- launching and killing programs
  [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf) -- %! Launch terminal
  , ((modMask, xK_n), spawn "rofi -show run -modi run")
  , ((modMask, xK_a), spawn "rofi -show window")
  , ((modMask .|. shiftMask, xK_c), kill) -- %! Close the focused window
    -- switch layouts
  , ((modMask, xK_space), sendMessage NextLayout) -- %! Rotate through the available layout algorithms
  , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf) -- %!  Reset the layouts on the current workspace to default
    -- move focus up or down the window stack
  , ((modMask, xK_Tab), windows W.focusDown)
  , ((modMask .|. shiftMask, xK_Tab), windows W.focusUp)
  , ((modMask, xK_j), windows W.focusDown)
  , ((modMask, xK_k), windows W.focusUp)
  , ((modMask, xK_m), withFocused minimizeWindow)
  , ((modMask .|. shiftMask, xK_m), withLastMinimized maximizeWindowAndFocus)
    -- modifying the window order
  , ((modMask, xK_Return), windows W.swapMaster) -- %! Swap the focused window and the master window
  , ((modMask .|. shiftMask, xK_j), windows W.swapDown) -- %! Swap the focused window with the next window
  , ((modMask .|. shiftMask, xK_k), windows W.swapUp) -- %! Swap the focused window with the previous window
    -- resizing the master/slave ratio
  , ((modMask, xK_h), sendMessage Shrink) -- %! Shrink the master area
  , ((modMask, xK_l), sendMessage Expand) -- %! Expand the master area
  , ( (modMask .|. shiftMask, xK_p)
    , raiseMaybe (runInTerm "-t htop" "htop") (title =? "htop"))
  , ( (modMask .|. shiftMask, xK_y)
    , raiseMaybe (runInTerm "-t ranger" "ranger") (title =? "ranger"))
  , ( (modMask .|. shiftMask, xK_t)
    , raiseMaybe (runInTerm "-t task" "tasksh") (title =? "task"))
  , ((modMask, xK_c), spawn "clipmenu")
  , ((modMask .|. shiftMask, xK_s), spawn "maim -s ~/screenshot.png")
    -- floating layer support
  , ((modMask, xK_t), withFocused $ windows . W.sink) -- %! Push window back into tiling
    -- increase or decrease number of windows in the master area
  , ((modMask, xK_comma), sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
  , ((modMask, xK_period), sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area
    -- quit, or restart
  , ((modMask .|. shiftMask, xK_q), io exitSuccess) -- %! Quit xmonad
  , ( (modMask, xK_q)
    , spawn
        "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi" -- %! Restart xmonad
     )
    -- pass integration
  , ((modMask, xK_y), passPrompt (def {searchPredicate = fuzzyMatch}))
  ] ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
  [ ((m .|. modMask, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
  ] ++
    -- mod-{w,e,r} %! Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r} %! Move client to screen 1, 2, or 3
  [ ((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
  ]
