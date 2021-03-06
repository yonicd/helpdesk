% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{get_installed}
\alias{get_installed}
\title{Return names of installed packages}
\usage{
get_installed()
}
\value{
character
}
\description{
Returns the names of installed.packages found within the
location of R library trees that installed.packages searches through.
}
\examples{
x <- get_installed()
nrow(x)
head(x)
}
