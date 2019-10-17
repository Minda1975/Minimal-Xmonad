
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Maximize
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Hooks.ManageHelpers
import XMonad.Util.EZConfig
import System.IO
import XMonad.Actions.WindowBringer


main = do
  xmproc <- spawnPipe "/home/mindaugas/.cabal/bin/xmobar /home/mindaugas/.xmobarrc"
  xmonad $ ewmh def
    { terminal = "urxvt"
    , modMask = mod4Mask
    , manageHook = manageDocks
    , layoutHook = smartBorders $ avoidStruts $ myLayouts
    , handleEventHook = fullscreenEventHook <+> docksEventHook
    , logHook = dynamicLogWithPP $ xmobarPP
                  { ppOutput = hPutStrLn xmproc
                   , ppTitle = xmobarColor "green" "" . shorten 50
                  }
    }

     `additionalKeysP` -- Add some extra key bindings:
      [
        ("M-<Esc>", sendMessage (Toggle "Full"))
      , ("M-S-g",   gotoMenu)
      , ("M-S-b",   bringMenu)
      , ("M-w", spawn "/home/mindaugas/.scripts/screeny")
      , ("M-r", spawn "/home/mindaugas/.scripts/shutdown.sh")
      , ("M-x", spawn "firefox")
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
myLayouts = toggleLayouts (Full) others
  where
others = ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP


