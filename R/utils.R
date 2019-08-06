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

