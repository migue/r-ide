### Name: TkWidgetcmds
### Title: Tk widget commands
### Aliases: TkWidgetcmds tkactivate tkadd tkaddtag tkbbox tkcanvasx
###   tkcanvasy tkcget tkcompare tkconfigure tkcoords tkcreate
###   tkcurselection tkdchars tkdebug tkdelete tkdelta tkdeselect
###   tkdlineinfo tkdtag tkdump tkentrycget tkentryconfigure tkfind tkflash
###   tkfraction tkget tkgettags tkicursor tkidentify tkindex tkinsert
###   tkinvoke tkitembind tkitemcget tkitemconfigure tkitemfocus
###   tkitemlower tkitemraise tkitemscale tkmark.gravity tkmark.names
###   tkmark.next tkmark.previous tkmark.set tkmark.unset tkmove tknearest
###   tkpost tkpostcascade tkpostscript tkscan.mark tkscan.dragto tksearch
###   tksee tkselect tkselection.adjust tkselection.anchor
###   tkselection.clear tkselection.from tkselection.includes
###   tkselection.present tkselection.range tkselection.set tkselection.to
###   tkset tksize tktoggle tktag.add tktag.bind tktag.cget tktag.configure
###   tktag.delete tktag.lower tktag.names tktag.nextrange tktag.prevrange
###   tktag.raise tktag.ranges tktag.remove tktype tkunpost tkwindow.cget
###   tkwindow.configure tkwindow.create tkwindow.names tkxview
###   tkxview.moveto tkxview.scroll tkyposition tkyview tkyview.moveto
###   tkyview.scroll
### Keywords: misc

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D tt <- tktoplevel()
##D tkpack(txt.w <- tktext(tt))
##D tkinsert(txt.w, "0.0", "plot(1:10)")
##D 
##D # callback function 
##D eval.txt <- function()
##D    eval(parse(text=tclvalue(tkget(txt.w, "0.0", "end"))))
##D tkpack(but.w <- tkbutton(tt,text="Submit", command=eval.txt))
##D 
##D ## Try pressing the button, edit the text and when finished:
##D 
##D tkdestroy(tt)
## End(Not run)




