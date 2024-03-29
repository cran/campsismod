
setClass(
  "mrgsolve_model",
  representation(
    param = "character",
    cmt = "character",
    main = "character",
    ode = "character",
    omega = "character",
    sigma = "character",
    table = "character",
    capture = "character"
  )
)

#_______________________________________________________________________________
#----                                export                                 ----
#_______________________________________________________________________________

#' @param outvars additional variables to capture
#' @param extra_params extra parameter names to be added. By default, they will be assigned a zero value.
#' @rdname export
setMethod("export", signature=c("campsis_model", "mrgsolve_type"), definition=function(object, dest, outvars=NULL, extra_params=character(0)) {
  return(
    new(
      "mrgsolve_model",
      param = mrgsolveParam(object, extra_params=extra_params),
      cmt = mrgsolveCompartment(object),
      main = mrgsolveMain(object),
      ode = mrgsolveOde(object),
      omega = mrgsolveMatrix(object, type="omega"),
      sigma = mrgsolveMatrix(object, type="sigma"),
      table = mrgsolveTable(object),
      capture = mrgsolveCapture(outvars, model=object)
    )
  )
})

#_______________________________________________________________________________
#----                             toString                                  ----
#_______________________________________________________________________________

#' @rdname toString
setMethod("toString", signature=c("mrgsolve_model"), definition=function(object, ...) {
  cpp <- NULL
  if (!is.null(object@param)) {
    cpp <- cpp %>% append(object@param)
    cpp <- cpp %>% append("")
  }
  cpp <- cpp %>% append(object@cmt)
  cpp <- cpp %>% append("")
  if (!is.null(object@omega)) {
    cpp <- cpp %>% append(object@omega)
    cpp <- cpp %>% append("")
  }
  if (!is.null(object@sigma)) {
    cpp <- cpp %>% append(object@sigma)
    cpp <- cpp %>% append("")
  }
  cpp <- cpp %>% append(object@main)
  cpp <- cpp %>% append("")
  cpp <- cpp %>% append(object@ode)
  cpp <- cpp %>% append("")
  cpp <- cpp %>% append(object@table)
  if (!is.null(object@capture)) {
    cpp <- cpp %>% append("")
    cpp <- cpp %>% append(object@capture)
  }
  cpp <- paste0(cpp, collapse="\n")
  return(cpp)
})

