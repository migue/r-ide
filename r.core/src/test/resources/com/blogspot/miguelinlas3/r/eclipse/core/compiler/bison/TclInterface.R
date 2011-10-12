### Name: TclInterface
### Title: Low-level Tcl/Tk Interface
### Aliases: TclInterface .Tcl .Tcl.objv .Tcl.callback .Tcl.args
###   .Tcl.args.objv tclvar tclVar as.character.tclVar tclArray [[.tclArray
###   [[<-.tclArray $.tclArray $<-.tclArray names.tclArray length.tclArray
###   names<-.tclArray length<-.tclArray tclvalue tclvalue<-
###   tclvalue.default tclvalue<-.default tclvalue.tclVar tclvalue<-.tclVar
###   tclvalue.tclObj as.character.tclObj as.integer.tclObj
###   as.double.tclObj as.tclObj is.tclObj tclObj print.tclObj tclObj<-
###   tclObj.tclVar tclObj<-.tclVar .Tk.ID .Tk.newwin .Tk.subwin is.tkwin
###   tkdestroy .TkRoot addTclPath tclRequire
### Keywords: misc

### ** Examples

## Not run: 
##D ## These cannot be run by example() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D .Tcl("format \"%s\n\" \"Hello, World!\"")
##D f <- function()cat("HI!\n")
##D .Tcl.callback(f)
##D .Tcl.args(text="Push!", command=f) # NB: Different address
##D 
##D xyzzy <- tclVar(7913)
##D tclvalue(xyzzy)
##D tclvalue(xyzzy) <- "foo"
##D as.character(xyzzy)
##D tcl("set", as.character(xyzzy))
##D 
##D top <- tktoplevel() # a Tk widget, see Tk-widgets
##D ls(envir=top$env, all=TRUE)
##D ls(envir=.TkRoot$env, all=TRUE)# .Tcl.args put a callback ref in here
## End(Not run)



