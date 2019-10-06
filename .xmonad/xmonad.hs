import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import XMonad.Actions.WindowBringer
import XMonad.Prompt.Shell
import System.Exit

main = do
  xmonad $ ewmh def
    { terminal = "xterm"
    , modMask = mod4Mask
    , layoutHook = smartBorders $ layoutHook def
    }

     `additionalKeysP` -- Add some extra key bindings:
      [ 
        ("M-S-q",   confirmPrompt myXPConfig "exit" (io exitSuccess))
      , ("M-p",     shellPrompt myXPConfig)
      , ("M-S-g",   gotoMenu)
      , ("M-S-b",   bringMenu)
      , ("M-w", spawn "/home/mindaugas/.scripts/screeny")
      , ("M-r", spawn "/home/mindaugas/.scripts/shutdown.sh")
      , ("M-x", spawn "xclock -d")
      ]
--------------------------------------------------------------------------------

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
