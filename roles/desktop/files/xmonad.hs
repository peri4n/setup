import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import Data.List (isPrefixOf,isInfixOf)
import System.Exit
import System.IO
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.WindowGo
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Pass
import XMonad.Util.Run

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Config augmented with Ewmh (used by rofi) and urgency hooks
myConfig = ewmh (withUrgencyHook NoUrgencyHook $ def {
    modMask            = mod4Mask
  , borderWidth        = 1
  , terminal           = "st"
  , normalBorderColor  = "darkgrey"
  , focusedBorderColor = "orange"
  , keys               = myKeys
  , focusFollowsMouse  = myFocusFollowsMouse
  , clickJustFocuses   = myClickJustFocuses
  , workspaces         = myWorkspaces
  , handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
  , manageHook         = myManageHook <+> manageHook def
  , layoutHook         = avoidStruts myLayout
  })

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { 
        ppTitle = xmobarColor "orange" "" . shorten 50
      , ppCurrent = xmobarColor "black" "orange" . wrap " " " "
      , ppUrgent = xmobarColor "red" "" . xmobarStrip
      , ppLayout = xmobarColor "orange" "" . (\x -> case x of
                "Maximize Tall" -> "[|]"
                "Full" -> "[X]"
                "Mirror Tall" -> "[-]"
                _ -> x
                )
                }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask .|. shiftMask, xK_b)

-- Click is passed through when clicked on an inactive window
myClickJustFocuses = False

-- It should only be possible to switch focus via keyboard
myFocusFollowsMouse = False

myWorkspaces :: [String]
myWorkspaces = ["Web", "Dev", "Chat", "Mail"]

myManageHook  = composeAll [ 
  isPrefixOf "jetbrains"   <$> className --> doShift "Dev",
  isPrefixOf "qutebrowser" <$> className --> doShift "Web",
  (className =? "Slack")                 --> doF (W.shift "Chat")
                           ]

myLayout = smartBorders Full ||| maximize tiled ||| Mirror tiled
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

-- The xmonad key bindings. Add, modify or remove key bindings here.
-- (The comment formatting character is used when generating the manpage)
--
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf @ XConfig {XMonad.modMask = modMask} = M.fromList $
    -- launching and killing programs
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf) -- %! Launch terminal
      , ((modMask,               xK_p     ), spawn "rofi -show run -modi run")
      , ((modMask,               xK_w     ), spawn "rofi -show window")
      , ((modMask .|. shiftMask, xK_c     ), kill) -- %! Close the focused window

    -- switch layouts
      , ((modMask,               xK_space ), sendMessage NextLayout) -- %! Rotate through the available layout algorithms
      , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) -- %!  Reset the layouts on the current workspace to default

      , ((modMask,               xK_n     ), refresh) -- %! Resize viewed windows to the correct size

    -- move focus up or down the window stack
      , ((modMask,               xK_Tab   ), windows W.focusDown) -- %! Move focus to the next window
      , ((modMask .|. shiftMask, xK_Tab   ), windows W.focusUp  ) -- %! Move focus to the previous window
      , ((modMask,               xK_j     ), windows W.focusDown) -- %! Move focus to the next window
      , ((modMask,               xK_k     ), windows W.focusUp  ) -- %! Move focus to the previous window
      , ((modMask,               xK_m     ), windows W.focusMaster  ) -- %! Move focus to the master window

    -- modifying the window order
      , ((modMask,               xK_Return), windows W.swapMaster) -- %! Swap the focused window and the master window
      , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  ) -- %! Swap the focused window with the next window
      , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    ) -- %! Swap the focused window with the previous window

    -- resizing the master/slave ratio
      , ((modMask,               xK_h     ), sendMessage Shrink) -- %! Shrink the master area
      , ((modMask,               xK_l     ), sendMessage Expand) -- %! Expand the master area

      , ((modMask .|. shiftMask, xK_p), raiseMaybe (runInTerm "-t htop" "htop") (title =? "htop"))
      , ((modMask .|. shiftMask, xK_y), raiseMaybe (runInTerm "-t ranger" "ranger") (title =? "ranger"))
      , ((modMask .|. shiftMask, xK_t), raiseMaybe (runInTerm "-t task" "tasksh") (title =? "task"))
      , ((modMask,               xK_c), spawn "clipmenu")

    -- floating layer support
      , ((modMask,               xK_t     ), withFocused $ windows . W.sink) -- %! Push window back into tiling

    -- increase or decrease number of windows in the master area
      , ((modMask               , xK_comma ), sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
      , ((modMask               , xK_period), sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area

    -- quit, or restart
      , ((modMask .|. shiftMask, xK_q     ), io exitSuccess) -- %! Quit xmonad
      , ((modMask              , xK_q     ), spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi") -- %! Restart xmonad

    -- pass integration
      , ((modMask, xK_y)                              , passPrompt (def { searchPredicate = fuzzyMatch }))

    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
