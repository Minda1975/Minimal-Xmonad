import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Maximize
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Util.EZConfig
import System.IO
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import XMonad.Actions.WindowBringer
import XMonad.Prompt.Shell
import System.Exit

main = do
  xmonad $ ewmh def
    { terminal = "xterm"
    , modMask = mod4Mask
    , layoutHook = myLayouts
    }

     `additionalKeysP` -- Add some extra key bindings:
      [ 
        ("M-S-q",   confirmPrompt myXPConfig "exit" (io exitSuccess))
      , ("M-p",     shellPrompt myXPConfig)
      , ("M-<Esc>", sendMessage (Toggle "Full"))
      , ("M-S-g",   gotoMenu)
      , ("M-S-b",   bringMenu)
      , ("M-w", spawn "/home/mindaugas/.scripts/screeny")
      , ("M-r", spawn "/home/mindaugas/.scripts/shutdown.sh")
      , ("M-x", spawn "xclock -d")
      , ("M-M1-<Left>",    sendMessage $ ExpandTowards L)
      , ("M-M1-<Right>",   sendMessage $ ShrinkFrom L)
      , ("M-M1-<Up>",      sendMessage $ ExpandTowards U)
      , ("M-M1-<Down>",    sendMessage $ ShrinkFrom U)
      , ("M-M1-C-<Left>",  sendMessage $ ShrinkFrom R)
      , ("M-M1-C-<Right>", sendMessage $ ExpandTowards R)
      , ("M-M1-C-<Up>",    sendMessage $ ShrinkFrom D)
      , ("M-M1-C-<Down>",  sendMessage $ ExpandTowards D)
      , ("M-s",            sendMessage $ Swap)
      , ("M-M1-s",         sendMessage $ Rotate)
      ]
--------------------------------------------------------------------------------
-- | Customize layouts.
--
-- This layout configuration uses two primary layouts, 'ResizableTall'
-- and 'BinarySpacePartition'.  You can also use the 'M-<Esc>' key
-- binding defined above to toggle between the current layout and a
-- full screen layout.
myLayouts = smartBorders $ toggleLayouts (Full) others
  where
others = ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP

myXPConfig = def
  { position          = Top
  , alwaysHighlight   = True
  ,fgColor            = "#657b83"
  , bgColor           = "#002b36"
  , bgHLight    = "#002b36"
  , fgHLight    = "#dc322f"
  , promptBorderWidth = 0
  , font              = "xft:Liberation Sans:size=10"
  }
