### Name: TkCommands
### Title: Tk non-widget commands
### Aliases: TkCommands tcl tktitle tktitle<- tkbell tkbind tkbindtags
###   tkfocus tklower tkraise tkclipboard.append tkclipboard.clear
###   tkevent.add tkevent.delete tkevent.generate tkevent.info
###   tkfont.actual tkfont.configure tkfont.create tkfont.delete
###   tkfont.families tkfont.measure tkfont.metrics tkfont.names tkgrab
###   tkgrab.current tkgrab.release tkgrab.set tkgrab.status tkimage.cget
###   tkimage.configure tkimage.create tkimage.names tkXselection.clear
###   tkXselection.get tkXselection.handle tkXselection.own tkwait.variable
###   tkwait.visibility tkwait.window tkwinfo tkwm.aspect tkwm.client
###   tkwm.colormapwindows tkwm.command tkwm.deiconify tkwm.focusmodel
###   tkwm.frame tkwm.geometry tkwm.grid tkwm.group tkwm.iconbitmap
###   tkwm.iconify tkwm.iconmask tkwm.iconname tkwm.iconposition
###   tkwm.iconwindow tkwm.maxsize tkwm.minsize tkwm.overrideredirect
###   tkwm.positionfrom tkwm.protocol tkwm.resizable tkwm.sizefrom
###   tkwm.state tkwm.title tkwm.transient tkwm.withdraw tkgrid tkgrid.bbox
###   tkgrid.columnconfigure tkgrid.configure tkgrid.forget tkgrid.info
###   tkgrid.location tkgrid.propagate tkgrid.rowconfigure tkgrid.remove
###   tkgrid.size tkgrid.slaves tkpack tkpack.configure tkpack.forget
###   tkpack.info tkpack.propagate tkpack.slaves tkplace tkplace.configure
###   tkplace.forget tkplace.info tkplace.slaves tkgetOpenFile
###   tkgetSaveFile tkchooseDirectory tkmessageBox tkdialog tkpopup
###   tclfile.tail tclfile.dir tclopen tclclose tclputs tclread
### Keywords: misc

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D tt <- tktoplevel()
##D tkpack(l1<-tklabel(tt,text="Heave"), l2<-tklabel(tt,text="Ho"))
##D tkpack.configure(l1, side="left")
##D 
##D ## Try stretching the window and then
##D 
##D tkdestroy(tt)
## End(Not run)




