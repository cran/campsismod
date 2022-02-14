## ---- message=FALSE-----------------------------------------------------------
library(campsismod)

## -----------------------------------------------------------------------------
model <- model_library$advan4_trans4
show(model)

## -----------------------------------------------------------------------------
model %>% write(file="path_to_model_folder")
list.files("path_to_model_folder")

## -----------------------------------------------------------------------------
model <- read.campsis(file="path_to_model_folder")
show(model)

## -----------------------------------------------------------------------------
rxmod <- model %>% export(dest="RxODE")
rxmod

## -----------------------------------------------------------------------------
mrgmod <- model %>% export(dest="mrgsolve")
mrgmod

