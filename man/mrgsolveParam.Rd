% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mrgsolve_conversion.R
\name{mrgsolveParam}
\alias{mrgsolveParam}
\title{Get the parameters block for mrgsolve.}
\usage{
mrgsolveParam(model, extra_params = character(0))
}
\arguments{
\item{model}{CAMPSIS model}

\item{extra_params}{extra parameter names to be added. By default, they will be assigned a zero value.}
}
\value{
character vector, 1 parameter per line. First one is header [PARAM].
}
\description{
Get the parameters block for mrgsolve.
}
