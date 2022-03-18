-- Data
import Data.Char (isSpace, toUpper)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

import System.Exit (exitSuccess)
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (nextScreen, prevScreen)
import XMonad.Actions.MouseResize
import XMonad.Actions.WithAll (sinkAll)
import XMonad.Actions.UpdatePointer

-- Hooks
import XMonad.Hooks.DynamicLog (PP (..), dynamicLogWithPP, shorten, wrap, xmobarColor, xmobarPP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (ToggleStruts (..), avoidStruts, docksEventHook, manageDocks)
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.InsertPosition

-- Layouts
import XMonad.Layout.GridVariants (Grid (Grid))
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.MultiToggle ((??), EOT (EOT), mkToggle, single)
import qualified XMonad.Layout.MultiToggle as MT (Toggle (..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (MIRROR, NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (Rename (Replace), renamed)
import XMonad.Layout.ResizableTile
import XMonad.Layout.ShowWName
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import qualified XMonad.Layout.ToggleLayouts as T (ToggleLayout (Toggle), toggleLayouts)
import XMonad.Layout.WindowArranger (WindowArrangerMsg (..), windowArrange)
import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce

--------------- |  Variables | -------------
-- Terminal
myTerminal = "alacritty" :: String
-- Super
myModMask = mod4Mask :: KeyMask
-- Border Width
myBorderWidth = 3 :: Dimension 
-- Font
myFont = "xft:UbuntuMono Nerd Font Mono:regular:size=12:antialias=true:hinting=true" :: String 
-- Colors
-- Normal
myNormColor = "#232323" :: String
-- Focus
myFocusColor = "#008df8" :: String
-- Browser
myBrowser = "firefox" :: String

windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset :: X(Maybe String)

myStartupHook :: X ()
myStartupHook = do 
        spawnOnce "~/.xmonad/autostart.sh &"
        setWMName "LG3D"


mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True


-- Layouts definition
myLayout = renamed [Replace "tall"]
    $ limitWindows 12
    $ mySpacing 4
    $ ResizableTall 1 (3 / 100) (1 / 2) []

mirrorTall = renamed [Replace "tall"]
    $ limitWindows 12
    $ mySpacing 4
    $ Mirror (Tall 1 (3/100) (3/5))

monocle = renamed  [Replace "monocle"] $ limitWindows 20 Full

grid = renamed [Replace "grid"] 
    $ limitWindows  12 
    $ mySpacing 4
    $ mkToggle (single MIRROR)
    $ Grid (16 / 10)

floats = renamed [Replace "floats"] $ limitWindows 20 simplestFloat 

myLayoutHook = avoidStruts 
    $ smartBorders
    $ mouseResize 
    $ windowArrange 
    $ T.toggleLayouts floats
    $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefalutLayout
        where
            myDefalutLayout = 
                noBorders monocle
                ||| grid
                ||| mirrorTall

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
    where
        doubleLts '<' = "<<"
        doubleLts x = [x]

myWorspaces :: [String]
myWorspaces = clickable . map xmobarEscape
                --  www         dev        term        code    folder       config    image    chat        music
                $ ["\xf268 ", "\58911 " , "\61728 ", "\xf269 ", "\58879 ", "\58901 ", "\62150 ", "\61884 ", "\xf198 " ]
            where
                clickable l = ["<action=xdotool key super+" ++ show i ++ "> " ++ ws ++ "</action>" | (i, ws) <- zip [1 .. 9] l]

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
    [ 
    -- 1
      (className =? "Brave-browser" <||> title =? "Firefox Developer Edition" ) --> doShift (head myWorspaces )
    -- 2
    
    -- 3

    -- 4
    , className =? "firefox" --> doShift ( myWorspaces !! 4 )
    -- 5
    , className =? "Thunar" --> doShift ( myWorspaces !! 5 )
    -- 6
    
    -- 7
    , className =? "TelegramDesktop" --> doShift ( myWorspaces !! 7 )
    , className =? "WhatsappDesktop" --> doShift ( myWorspaces !! 7)
    , className =? "Thunderbird" --> doShift ( myWorspaces !! 7 )
    -- 8
    , (className =? "Spotify" <||> title =? "spotify") --> doShift ( myWorspaces !! 8 )
    , className =? "Slack"  --> doShift ( myWorspaces !! 8 )
   
    -- Float
    , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
    , (className =? "Brave-browser" <&&> resource =? "Dialog") --> doFloat
    , (title =? "Firefox Developer Edition" <&&> resource =? "Dialog") --> doFloat
    , (className =? "Thunar" <&&> resource =? "Dialog") --> doFloat 
    , className =? "lxappearance" --> doFloat
    , className =? "SpeedCrunch" --> doFloat
    , className =? "Zathura" --> doFloat
    , className =? "Piper" --> doFloat
    ] 

myKeys :: [(String, X ())]
myKeys = -- Xmonad
        [ 
         -- ("M-C-r", spawn "xmonad --recompile") -- Recompile xmonad
          ("M-S-r", spawn "xmonad --recompile && xmonad --restart") -- Restart xmonad
        , ("M-S-q", io exitSuccess ) -- Quits xmonad

        -- Kill windows  
        , ("M-w", kill1) -- Kill the currently focused client
        -- Move focus to the next window
        , ("M-j", windows W.focusDown)
        -- Move focus to the provious window
        , ("M-k", windows W.focusUp)
        -- Swap focused window with next window
        , ("M-S-j", windows W.swapDown)
        -- Swap focused window with prev window
        , ("M-S-k", windows W.swapUp)
        
        ------------------ Layouts --------------------- 
        
        -- Switch focus to next monitor
        , ("M-.", nextScreen)
        -- Switch focus to prev monitor
        , ("M-,", prevScreen)
        -- Switch to next layout
        , ("M-<Tab>", sendMessage NextLayout)
        -- Switch to first layout
        , ("M-S-<Tab>", sendMessage FirstLayout) 
        -- Toggles noborder/full
        , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts)
        -- Toggles noborder
        , ("M-S-n", sendMessage  $ MT.Toggle NOBORDERS)
        -- Shrink horizontal wondow width
        , ("M-S-h", sendMessage Shrink)
        -- Expand horizontal window width
        , ("M-S-l", sendMessage Expand)
        -- Shrink vertical window width 
        , ("M-C-j", sendMessage MirrorShrink)
        -- Expand vertical window width 
        , ("M-C-k", sendMessage MirrorExpand)

        , ("M-z", decWindowSpacing 4)
        , ("M-S-z", incWindowSpacing 4)
        
        ----------------- Float windows -----------------
         -- Toggles 'floats' layout
        , ("M-f", sendMessage (T.Toggle "floats"))
        -- Push floating window back to tile
        , ("M-S-f", withFocused $ windows . W.sink)
        -- Push all floating windows to tile
        , ("M-C-f", sinkAll)
    
        ----------------- App ------------------------
        -- Menu
        , ("M-m", spawn "rofi -show drun")   
        -- Window Nav
        , ("M-S-m", spawn "rofi -show")
        -- Browser
        , ("M-b", spawn myBrowser)
        -- Browser
        , ("M-S-b", spawn "brave")
        -- Explore
        , ("M-e", spawn "thunar")
        -- Redshift
        , ("M-r", spawn "redshift -O 5000")
        , ("M-C-r", spawn "redshift -x")
        -- Terminal
        , ("M-<Return>", spawn myTerminal)
        -- Calculator
        , ("M-s", spawn "speedcrunch")
        -- ScreenShot
        , ("M-p", spawn "flameshot gui")
        , ("M-S-p", spawn "scrot -s")


        --------------------- Hardware ---------------------

        -- Volume
        , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
        , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
        , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" )
        , ("<XF86AudioPlay>", spawn "playerctl play-pause" )
        , ("<XF86AudioNext>", spawn "playerctl next" )
        , ("<XF86AudioPrev>", spawn "playerctl previous" )

        -- Brightness
        , ("<XF86MonBrightnessUp>", spawn "brightnessctl set +10%")
        , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 10%-")
        ]

-- Main
main :: IO ()
main = do 
    -- Xmobar
    xmobarLaptop <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarPrimary.hs"
    xmobarMonitor <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobarPrimary.hs"
    -- Xmonad
    xmonad $ ewmh def {
         manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageDocks 
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , startupHook = myStartupHook
        , layoutHook = myLayoutHook
        , workspaces = myWorspaces
        , terminal = myTerminal
        , modMask = myModMask
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormColor
        , focusedBorderColor = myFocusColor
        , logHook = workspaceHistoryHook <+> dynamicLogWithPP xmobarPP {
              ppOutput = \x -> hPutStrLn xmobarLaptop x >> hPutStrLn xmobarMonitor x
            -- Current workspace in xmonbar
            , ppCurrent  = xmobarColor "#8ce10b" "" . wrap "[" " ]"
            -- Visible but not current workspaces
            ,  ppVisible = xmobarColor "#8ce10b" ""
            -- Hidden workspaces in xmobar
            , ppHidden = xmobarColor "#00d8eb" ""
            -- Hidden workspaces (no windows)
            , ppHiddenNoWindows = xmobarColor "#6d43a6" ""
            -- Title of active window in xmobar
            , ppTitle = xmobarColor "#ffffff" "" . shorten 55
            -- Separators in xmobar
            , ppSep = "<fc=#444444> | </fc>"
            -- Urgent workspace
            , ppUrgent = xmobarColor "#ff000f" "" . wrap "" "!"
            -- Number of windows in current workspace
            , ppExtras = [windowCount]           
            , ppOrder = \(ws : l : t : ex) -> [ws, l] ++ ex ++ [t]
            } >> updatePointer (0.5, 0.5) (0.5, 0.5)
        } `additionalKeysP` myKeys
