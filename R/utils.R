#' @importFrom DT datatable
#' @export
print.help_pages <- function(x,...){

  args <- list(data = x, escape = FALSE, filter = 'top')

  DT_args <- attr(x,'DT_args')

  args <- append(args,DT_args)

  print(do.call(DT::datatable,args))

}

#' @importFrom utils help.search
find.function <- function(pattern){

  ret <- utils::help.search(pattern)$matches

  unique(ret$Package[ret$Field=='Title'&ret$Type=='help'])

}

#' @importFrom utils installed.packages getFromNamespace
fetch_installed <- function(paths = .libPaths(),
                            env = utils::getFromNamespace('helpenv',ns = 'helpdesk')
                            ){

  env$full_stack <- unique(rownames(utils::installed.packages(lib.loc = paths)))

}


#' @title Return names of installed packages
#' @description Returns the names of installed.packages found within the
#' location of R library trees that installed.packages searches through.
#' @return character
#' @examples
#' x <- get_installed()
#' nrow(x)
#' head(x)
#' @rdname get_installed
#' @export
get_installed <- function(){

  helpenv$full_stack

}
