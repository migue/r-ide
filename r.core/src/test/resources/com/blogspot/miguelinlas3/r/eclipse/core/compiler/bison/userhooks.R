### Name: UserHooks
### Title: Functions to Get and Set Hooks for Load, Attach, Detach and
###   Unload
### Aliases: getHook setHook packageEvent .userHooksEnv
### Keywords: utilities

### ** Examples

setHook(packageEvent("grDevices", "onLoad"),
        function(...) grDevices::ps.options(horizontal=FALSE)) 



