import           XMonad

import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.StatusBar
import           XMonad.Hooks.StatusBar.PP

import           XMonad.Util.EZConfig
import           XMonad.Util.Loggers
import           XMonad.Util.Ungrab

import           XMonad.Layout.Magnifier
import           XMonad.Layout.ThreeColumns

import           XMonad.Hooks.EwmhDesktops
import           XMonad.Layout.Spacing

myBorderWith :: Dimension
myBorderWith = 2

myFocusedBorderColor :: String
myFocusedBorderColor = "#8087ee"

myConfig = def
  { modMask  = mod4Mask
  , terminal = "alacritty"
  , layoutHook = myLayout
  , borderWidth = myBorderWith
  , focusedBorderColor = myFocusedBorderColor
  }

keyBindings :: [(String, X ())]
keyBindings =
  [ ("M-f", spawn "firefox")
  , ("M-g", spawn "chromium")
  , ("M-d", spawn "rofi -show run")
  ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = smartSpacing 5 $ Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

main :: IO ()
main = xmonad $ myConfig `additionalKeysP` keyBindings
