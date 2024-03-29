
#_______________________________________________________________________________
#----                     compartment_lag_time class                        ----
#_______________________________________________________________________________

#' 
#' Compartment lag time class.
#' 
#' @export
setClass(
  "compartment_lag_time",
  representation(
  ),
  contains = "compartment_property",
  validity=function(object) {
    return(TRUE)
  }
)

#'
#' Create a lag time for the specified compartment.
#'
#' @param compartment compartment index
#' @param rhs right-hand side part of the equation
#' @return a lag time property
#' @export
LagTime <- function(compartment, rhs="") {
  return(new("compartment_lag_time", compartment=as.integer(compartment), rhs=rhs))
}

#_______________________________________________________________________________
#----                            getName                                    ----
#_______________________________________________________________________________

#' @rdname getName
setMethod("getName", signature = c("compartment_lag_time"), definition = function(x) {
  return(paste0("LAG_TIME (", "CMT=", x@compartment, ")"))
})

#_______________________________________________________________________________
#----                             getPrefix                                ----
#_______________________________________________________________________________

#' @rdname getPrefix
setMethod("getPrefix", signature = c("compartment_lag_time"), definition = function(object, ...) {
  dest <- processExtraArg(args=list(...), name="dest", default="RxODE")
  if (dest=="mrgsolve") {
    return("ALAG")
  } else {
    return("lag")
  }
})

#_______________________________________________________________________________
#----                           getRecordName                               ----
#_______________________________________________________________________________

#' @rdname getRecordName
setMethod("getRecordName", signature = c("compartment_lag_time"), definition = function(object) {
  return("LAG")
})
