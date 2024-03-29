% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generic_list.R, R/compartment_properties.R,
%   R/parameters.R
\name{getByIndex}
\alias{getByIndex}
\alias{getByIndex,pmx_list,integer-method}
\alias{getByIndex,pmx_list,numeric-method}
\alias{getByIndex,compartment_properties,compartment_property-method}
\alias{getByIndex,parameters,parameter-method}
\title{Get element by index.}
\usage{
getByIndex(object, x)

\S4method{getByIndex}{pmx_list,integer}(object, x)

\S4method{getByIndex}{pmx_list,numeric}(object, x)

\S4method{getByIndex}{compartment_properties,compartment_property}(object, x)

\S4method{getByIndex}{parameters,parameter}(object, x)
}
\arguments{
\item{object}{list object}

\item{x}{element index}
}
\value{
element from the list whose index matches with provided index
}
\description{
Get element by index.
}
