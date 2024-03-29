% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_ode.R
\name{Ode}
\alias{Ode}
\title{Create a new ordinary differential equation (ODE).}
\usage{
Ode(lhs, rhs = "", comment = as.character(NA))
}
\arguments{
\item{lhs}{left-hand side variable corresponding to derivative name, must start with 'A_'}

\item{rhs}{right-hand side expression corresponding to derivative value}

\item{comment}{comment if any, single character string}
}
\value{
an ODE
}
\description{
Create a new ordinary differential equation (ODE).
}
