
<!-- README.md is generated from README.Rmd. Please edit that file -->

# helpdesk

<!-- badges: start -->

[![stability-experimental](https://img.shields.io/badge/stability-experimental-orange.svg)]()
<!-- badges: end -->

The goal of `helpdesk` is to create a quick api to query URL links
embedded in DESCRPITION files of the `installed.packages`.

## Installation

``` r
remotes::install_github("yonicd/helpdesk")
```

## Example

``` r
library(helpdesk)
```

### Interactive

In RStudio IDE an interactive [datatable](https://rstudio.github.io/DT/)
will be returned in which search fields at the top of the columns is
enabled by default to further query the output.

After locating the relevant link you need, the links are enabled to open
directly into a new browser tab.

Here is an example

Running in the console the default call

``` r
help.pages()
```

The resulting `datatable` is returned

![](docs/helpdesk.gif)

That’s it\!

### Static

Below shows some additional functionality, where the returned objects
are converted to html tables. Like before the links are active so you
can test them out from the outputs.

#### Default

returns a table of all the packages with URLs in the DESCRIPTION file

``` r
x <- help.pages()
nrow(x)
#> [1] 232
knitr::kable(head(x))
```

| Package     | URL                                                                                                                                                                                          |
| :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| helpdesk    | <a href="https://github.com/yonicd/helpdesk" target="_blank">https://github.com/yonicd/helpdesk</a>                                                                                          |
| BayesFactor | <a href="https://richarddmorey.github.io/BayesFactor/" target="_blank">https://richarddmorey.github.io/BayesFactor/</a>                                                                      |
| Brobdingnag | <a href="https://github.com/RobinHankin/Brobdingnag.git" target="_blank">https://github.com/RobinHankin/Brobdingnag.git</a>                                                                  |
| DT          | <a href="https://rstudio.github.io/DT" target="_blank">https://rstudio.github.io/DT</a>                                                                                                      |
| GGally      | <a href="https://ggobi.github.io/ggally" target="_blank">https://ggobi.github.io/ggally</a><br><a href="https://github.com/ggobi/ggally" target="_blank">https://github.com/ggobi/ggally</a> |
| MASS        | <a href="http://www.stats.ox.ac.uk/pub/MASS4/" target="_blank">http://www.stats.ox.ac.uk/pub/MASS4/</a>                                                                                      |

#### Subset of packages

``` r
knitr::kable(help.pages(c('dplyr','ggplot2')))
```

| Package | URL                                                                                                                                                                                                |
| :------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dplyr   | <a href="http://dplyr.tidyverse.org" target="_blank">http://dplyr.tidyverse.org</a><br><a href="https://github.com/tidyverse/dplyr" target="_blank">https://github.com/tidyverse/dplyr</a>         |
| ggplot2 | <a href="http://ggplot2.tidyverse.org" target="_blank">http://ggplot2.tidyverse.org</a><br><a href="https://github.com/tidyverse/ggplot2" target="_blank">https://github.com/tidyverse/ggplot2</a> |

#### Using partial matches of package names

``` r
knitr::kable(help.pages('tidy',regex = TRUE))
```

| Package    | URL                                                                                                                                                                                        |
| :--------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| tidyr      | <a href="http://tidyr.tidyverse.org" target="_blank">http://tidyr.tidyverse.org</a><br><a href="https://github.com/tidyverse/tidyr" target="_blank">https://github.com/tidyverse/tidyr</a> |
| tidytext   | <a href="http://github.com/juliasilge/tidytext" target="_blank">http://github.com/juliasilge/tidytext</a>                                                                                  |
| tidytrials | <a href="https://ghe.metrumrg.com/external-projects/SAN1701F" target="_blank">https://ghe.metrumrg.com/external-projects/SAN1701F</a>                                                      |

#### Using partial matches of function names in the help title field

``` r
knitr::kable(help.pages(function_pattern = 'geom'))
```

| Package | URL                                                                                                                                                                                                                                                                |
| :------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GGally  | <a href="https://ggobi.github.io/ggally" target="_blank">https://ggobi.github.io/ggally</a><br><a href="https://github.com/ggobi/ggally" target="_blank">https://github.com/ggobi/ggally</a>                                                                       |
| ggplot2 | <a href="http://ggplot2.tidyverse.org" target="_blank">http://ggplot2.tidyverse.org</a><br><a href="https://github.com/tidyverse/ggplot2" target="_blank">https://github.com/tidyverse/ggplot2</a>                                                                 |
| ggpubr  | <a href="https://rpkgs.datanovia.com/ggpubr/" target="_blank">https://rpkgs.datanovia.com/ggpubr/</a>                                                                                                                                                              |
| ggrepel | <a href="http://github.com/slowkow/ggrepel" target="_blank">http://github.com/slowkow/ggrepel</a>                                                                                                                                                                  |
| igraph  | <a href="http://igraph.org" target="_blank">http://igraph.org</a>                                                                                                                                                                                                  |
| magick  | <a href="https://github.com/ropensci/magick#readme" target="_blank">https://github.com/ropensci/magick\#readme</a>                                                                                                                                                 |
| MASS    | <a href="http://www.stats.ox.ac.uk/pub/MASS4/" target="_blank">http://www.stats.ox.ac.uk/pub/MASS4/</a>                                                                                                                                                            |
| plotly  | <a href="https://plotly-r.com" target="_blank">https://plotly-r.com</a><br><a href="https://github.com/ropensci/plotly#readme" target="_blank">https://github.com/ropensci/plotly\#readme</a><br><a href="https://plot.ly/r" target="_blank">https://plot.ly/r</a> |
| psych   | <a href="https://personality-project.org/r/psych" target="_blank">https://personality-project.org/r/psych</a><br><a href="https://personality-project.org/r/psych-manual.pdf" target="_blank">https://personality-project.org/r/psych-manual.pdf</a>               |
| raster  | <a href="https://CRAN.R-project.org/package=raster" target="_blank">https://CRAN.R-project.org/package=raster</a>                                                                                                                                                  |
| see     | <a href="https://easystats.github.io/see/" target="_blank">https://easystats.github.io/see/</a>                                                                                                                                                                    |
| sp      | <a href="https://github.com/edzer/sp/" target="_blank">https://github.com/edzer/sp/</a><br><a href="https://edzer.github.io/sp/" target="_blank">https://edzer.github.io/sp/</a>                                                                                   |
