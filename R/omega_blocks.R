
#_______________________________________________________________________________
#----                           omega_blocks class                          ----
#_______________________________________________________________________________

setClass(
  "omega_blocks",
  representation(
  ),
  contains="pmx_list",
  prototype=prototype(type="omega_block")
)

#' Create a list of OMEGA blocks.
#'
#' @export
OmegaBlocks <- function() {
  return(new("omega_blocks"))
}

#_______________________________________________________________________________
#----                                add                                    ----
#_______________________________________________________________________________

addOmega <- function(object, x) {
  block <- object %>% getOmegaBlock(x)
  newBlock <- FALSE
  if (is.null(block)) {
    block <- OmegaBlock()
    newBlock <- TRUE
  }
  block <- block %>% add(x)
  if (newBlock) {
    object <- object %>% add(block)
  } else {
    object <- object %>% campsismod::replace(block)
  }
  return(object)
}

#' @rdname add
setMethod("add", signature=c("omega_blocks", "omega_block"), definition=function(object, x) {
  x@block_index <- object %>% length() + 1L
  return(methods::callNextMethod(object, x))
})

#' @rdname add
setMethod("add", signature=c("omega_blocks", "parameters"), definition=function(object, x) {
  retValue <- OmegaBlocks()

  # Keeping only the OMEGA's and SIGMA's
  x@list <- x@list %>%
    purrr::keep(~is(.x, "double_array_parameter"))
  x <- x %>% sort() # Sort
  
  off_diag_omegas <- x # Init
  on_diag_omegas <- x # Init
  off_diag_omegas@list <- off_diag_omegas@list %>% purrr::keep(~!isDiag(.x))
  on_diag_omegas@list <- on_diag_omegas@list %>% purrr::keep(~isDiag(.x))

  for (omega in off_diag_omegas@list) {
    retValue <- retValue %>% addOmega(omega)
  }
  for (omega in on_diag_omegas@list) {
    retValue <- retValue %>% addOmega(omega)
  }
  
  # Sort all blocks (see method below)
  retValue <- retValue %>% sort()
  
  # Set up the start index
  cumulatedIndex <- 0L
  for (block in retValue@list) {
      block@start_index <- cumulatedIndex
      cumulatedIndex <- cumulatedIndex + block %>% length()
      block <- block %>% shiftOmegaIndexes()
      retValue <- retValue %>% replace(block)
  }
  return(retValue)
})

#_______________________________________________________________________________
#----                            getOmegaBlock                              ----
#_______________________________________________________________________________

#' Get the right block of OMEGA's.
#' 
#' @param object list of OMEGA blocks
#' @param x omega param
#' @return the corresponding OMEGA block or NULL if not found
#' @export
#' @rdname getOmegaBlock
getOmegaBlock <- function(object, x) {
  stop("No default function is provided")
}

setGeneric("getOmegaBlock", function(object, x) {
  standardGeneric("getOmegaBlock")
})

#' @rdname getOmegaBlock
setMethod("getOmegaBlock", signature=c("omega_blocks", "double_array_parameter"), definition=function(object, x) {
  for (block in object@list) {
    indexes <- block %>% getOmegaIndexes()
    if (x@index %in% indexes || x@index2 %in% indexes) {
      return(block)
    }
  }
  return(NULL)
})

#_______________________________________________________________________________
#----                               sort                                    ----
#_______________________________________________________________________________

#' @rdname sort
setMethod("sort", signature=c("omega_blocks"), definition=function(x, decreasing=FALSE, ...) {
  temp <- x@list %>% purrr::map_int(.f=~.x %>% getOmegaIndexes() %>% min())
  x@list <- x@list[order(temp)]
  return(x)
})
