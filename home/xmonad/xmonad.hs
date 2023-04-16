import           XMonad
import           XMonad.Actions.UpdatePointer
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.StatusBar
import           XMonad.Hooks.StatusBar.PP
import           XMonad.Layout.Circle
import           XMonad.Layout.Grid
import           XMonad.Layout.IndependentScreens
import           XMonad.Layout.Spacing
import           XMonad.Layout.ThreeColumns
import           XMonad.Util.EZConfig
import           XMonad.Util.Loggers

myBorderWidth :: Dimension
myBorderWidth = 1

myNormalBorderColor :: String
myNormalBorderColor = "#222222"

myFocusedBorderColor :: String
myFocusedBorderColor = "#8087ee"

myKeys :: [(String, X ())]
myKeys =
  [ ("M-f", spawn "firefox")
  , ("M-g", spawn "chromium")
  , ("M-d", spawn "rofi -show run")
  ]

myLayout = tiled ||| Mirror tiled ||| full ||| grid
  where
    tiled    = spacing 5 $ Tall nmaster delta ratio
    full     = spacing 5 Full
    grid     = spacing 5 Grid
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

main :: IO ()
main = do
  spawn "ibus-daemon -drx"
  xmonad
     . ewmhFullscreen
     . ewmh
     $ withEasySB (statusBarProp "xmobar -x 0" (pure myXmobarPP)) defToggleStrutsKey
     $ withEasySB (statusBarProp "xmobar -x 1" (pure myXmobarPP)) defToggleStrutsKey
     $ def
    { modMask  = mod4Mask
    , terminal = "alacritty"
    , layoutHook = myLayout
    , borderWidth = myBorderWidth
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor = myNormalBorderColor
    , logHook = updatePointer (0.5, 0.5) (0, 0)
    , workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    } `additionalKeysP` myKeys

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Bottom" "#8087ee" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
