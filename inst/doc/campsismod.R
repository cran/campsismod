## ----message=FALSE------------------------------------------------------------
library(campsismod)

## -----------------------------------------------------------------------------
model <- model_suite$pk$`2cpt_fo`
show(model)

## -----------------------------------------------------------------------------
model %>% write(file="path_to_model_folder")
list.files("path_to_model_folder")

## -----------------------------------------------------------------------------
model <- read.campsis(file="path_to_model_folder")
show(model)

## -----------------------------------------------------------------------------
rxmod <- model %>% export(dest="rxode2")
rxmod

## -----------------------------------------------------------------------------
mrgmod <- model %>% export(dest="mrgsolve")
mrgmod

