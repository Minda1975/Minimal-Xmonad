
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import qualified XMonad.StackSet as W
import XMonad.Layout.BoringWindows
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Hooks.ManageHelpers
import XMonad.Util.EZConfig
import System.IO



main = do
  xmproc <- spawnPipe "/home/mindaugas/.cabal/bin/xmobar /home/mindaugas/.xmobarrc"
  xmonad $ ewmh def
    { terminal = "urxvt"
    , modMask = mod4Mask
    , manageHook = manageDocks
    , layoutHook = smartBorders $ avoidStruts $ myLayout
    , handleEventHook = fullscreenEventHook <+> docksEventHook
    , logHook = dynamicLogWithPP $ sjanssenPP
                  { ppOutput = hPutStrLn xmproc
                   , ppTitle = xmobarColor "green" "" . shorten 50
                  }
    }

     `additionalKeysP` -- Add some extra key bindings:
      [
        ("M-C-h", sendMessage $ pullGroup L)
      , ("M-C-l",   sendMessage $ pullGroup R)
      , ("M-C-k",   sendMessage $ pullGroup U)
      , ("M-w", spawn "/home/mindaugas/.scripts/screeny")
      , ("M-r", spawn "/home/mindaugas/.scripts/shutdown.sh")
      , ("M-x", spawn "firefox")
      , ("M-C-j",    sendMessage $ pullGroup D)
      , ("M-C-m",   withFocused (sendMessage . MergeAll))
      , ("M-C-u",      withFocused (sendMessage . UnMerge))
      , ("M-period",    onGroup W.focusUp')
      , ("M-comma",  onGroup W.focusDown')
      , ("M-j", focusDown)
      , ("M-k",    focusUp)
      , ("M-C-x", runOrRaisePrompt def)
      ]
--------------------------------------------------------------------------------
-- | Customize layouts.
--
-- This layout configuration uses two primary layouts, 'ResizableTall'
-- and 'BinarySpacePartition'.  You can also use the 'M-<Esc>' key
-- binding defined above to toggle between the current layout and a
-- full screen layout.

myLayout = windowNavigation $ subTabbed $ boringWindows $
                       Tall 1 (3/100) (1/2) 

