#' @title Locate URL links of Installed Packages
#' @description Search for packages and functions for the URL documentation
#'  as listed in the package DESCRIPTION files
#' @param package character, names of pacakges to query, Default: full_stack
#' @param function_pattern character, pattern of functions to query within the
#' packages queried, Default: NULL
#' @param DT_args list, arguments to pass to datatable on print
#' @param regex logical. If TRUE then package pattern is matched against the
#'   list of installed package names, Default: FALSE
#' @return data.frame of class help_pages
#' @details full_stack is created by the package on attachment/loading consists
#'  a vector of the installed packages on the machine.
#' @examples
#' \dontrun{
#' if(interactive()){
#'
#'   # return all packages with URLS
#'   help.pages()
#'
#'   # return a specific subset of installed packages
#'   help.pages(package = c('tidyr','tidytext'))
#'
#'   # search by partial match of pacakge names
#'   help.pages(package = 'tidy',regex = TRUE)
#'
#'   # search by function pattern
#'   help.pages(function_pattern = 'geom')
#'
#'  }
#' }
#' @seealso
#'  \code{\link[desc]{desc_get_urls}}
#' @rdname help.pages
#' @export
#' @importFrom stats setNames
#' @importFrom desc desc_get_urls
help.pages <- function(
  package = get_installed(),
  function_pattern = NULL,
  regex = FALSE,
  DT_args = list(options = list(paging=FALSE,dom='t'))
  ){

  full_stack <- get_installed()

  if(regex&!missing(package)){
    package <- grep(package,full_stack,value=TRUE)
  }

  if(!is.null(function_pattern)){

    fn_pkgs <- find.function(function_pattern)

    if(length(fn_pkgs)>0){
      package <- intersect(fn_pkgs,package)
    }

  }

  if(is.null(names(package)))
    package <- stats::setNames(package,package)

  if(!length(package))
    return(message('No Packages were found'))

  if(!length(intersect(package,full_stack)))
    return(message('No Packages were found'))

  ret <- lapply(package,FUN = function(x) {
    desc::desc_get_urls(file = system.file('DESCRIPTION',package = x))
  })

  ret <- ret[sapply(ret,function(x) length(x)>0)]

  if(!length(ret))
    return(message('No URLS were found'))

  ret <- lapply(ret,FUN=function(URL){
    paste0(
      sprintf('<a href="%s" target="_blank">%s</a>',URL,URL),
      collapse = '<br>')
  })

  ret <- data.frame(
    Package = names(ret),
    URL = unlist(ret,use.names = FALSE),
    stringsAsFactors = FALSE
  )

  structure(ret,
            class = c('help_pages','data.frame'),
            DT_args = DT_args
            )

}
