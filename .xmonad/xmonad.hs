import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.Spacing
import qualified Data.Map as M
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = xmonad $ docks def
    {
        modMask = mod4Mask,
        terminal = "st",
        logHook = updatePointer (0.5, 0.5) (0, 0),
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ layoutHook defaultConfig,
        startupHook = setWMName "LG3D",
        focusedBorderColor = "#FF00B3"
    } `additionalKeys` [
    ((mod4Mask.|.shiftMask, xK_l), spawn "sh ~/dev/lockscreen/lock.sh")
    ]
