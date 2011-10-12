### Name: numeric_version
### Title: Numeric Versions
### Aliases: numeric_version as.numeric_version is.numeric_version
###   package_version is.package_version as.package_version
###   R_system_version getRversion [.numeric_version [[.numeric_version
###   [[<-.numeric_version Ops.numeric_version Summary.numeric_version
###   as.character.numeric_version as.data.frame.numeric_version
###   as.list.numeric_version c.numeric_version duplicated.numeric_version
###   print.numeric_version rep.numeric_version unique.numeric_version
###   xtfrm.numeric_version $.package_version .encode_numeric_version
###   .decode_numeric_version .make_numeric_version
### Keywords: utilities

### ** Examples

x <- package_version(c("1.2-4", "1.2-3", "2.1"))
x < "1.4-2.3"
c(min(x), max(x))
x[2, 2]
x$major
x$minor

if(getRversion() <= "2.5.0") { ## work around missing feature
  cat("Your version of R, ", as.character(getRversion()),
      ", is outdated.\n",
      "Now trying to work around that ...\n", sep = "")
}

x[[c(1,3)]]  # '4' as a numeric vector, same as x[1, 3]
x[1, 3]      # 4 as an integer
x[[2, 3]] <- 0   # zero the patchlevel
x[[c(2,3)]] <- 0 # same
x
x[[3]] <- "2.2.3"; x



