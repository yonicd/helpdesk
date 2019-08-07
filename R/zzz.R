helpenv <- new.env()

.onLoad <- function(libname, pkgname) {

  fetch_installed()

}

.onAttach <- function(libname, pkgname) {

  fetch_installed()

}
