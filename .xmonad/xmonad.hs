import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Actions.WindowBringer

main = do
  xmonad $ ewmh def
    { terminal = "xterm"
    , modMask = mod4Mask
    , layoutHook = smartBorders $ layoutHook def
    }

     `additionalKeysP` -- Add some extra key bindings:
      [ 
        ("M-S-g",   gotoMenu)
      , ("M-S-b",   bringMenu)
      , ("M-w", spawn "/home/mindaugas/.scripts/screeny")
      , ("M-r", spawn "/home/mindaugas/.scripts/shutdown.sh")
      , ("M-x", spawn "xclock -d")
      ]



