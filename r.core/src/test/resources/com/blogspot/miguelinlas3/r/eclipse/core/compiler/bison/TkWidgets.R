### Name: TkWidgets
### Title: Tk widgets
### Aliases: TkWidgets tkwidget tkbutton tkcanvas tkcheckbutton tkentry
###   tkframe tklabel tklistbox tkmenu tkmenubutton tkmessage tkradiobutton
###   tkscale tkscrollbar tktext tktoplevel ttkbutton ttkcheckbutton
###   ttkcombobox ttkentry ttkframe ttkimage ttklabel ttklabelframe
###   ttkmenubutton ttknotebook ttkpanedwindow ttkprogressbar
###   ttkradiobutton ttkscrollbar ttkseparator ttksizegrip ttktreeview
### Keywords: misc

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D tt <- tktoplevel()
##D label.widget <- tklabel(tt, text="Hello, World!")
##D button.widget <- tkbutton(tt, text="Push",
##D                           command=function()cat("OW!\n"))
##D tkpack(label.widget, button.widget) # geometry manager
##D                                     # see Tk-commands
##D 
##D ## Push the button and then...
##D 
##D tkdestroy(tt)
##D 
##D ## test for themed widgets
##D if(as.character(tcl("info", "tclversion")) >= "8.5") {
##D   # make use of themed widgets
##D   # list themes
##D   as.character(tcl("ttk::style", "theme", "names"))
##D   # select a theme -- here pre-XP windows
##D   tcl("ttk::style", "theme use", "winnative")
##D } else {
##D   # use Tk 8.0 widgets
##D }
## End(Not run)


