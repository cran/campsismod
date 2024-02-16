## ----echo=FALSE, warning=FALSE, message=FALSE, results='hide'-----------------
EXPORT_PNG <- FALSE

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
library(campsismod)

## -----------------------------------------------------------------------------
equation <- Equation("KA", "THETA_KA * exp(ETA_KA)", comment="This is my KA parameter")

## -----------------------------------------------------------------------------
equation

## -----------------------------------------------------------------------------
ode <- Ode("A_DEPOT", "-KA * A_DEPOT", comment="This is my depot compartment")

## -----------------------------------------------------------------------------
ode

## -----------------------------------------------------------------------------
linebreak <- LineBreak()

## -----------------------------------------------------------------------------
comment <- Comment("This is my first comment")

## -----------------------------------------------------------------------------
comment

## -----------------------------------------------------------------------------
ifStatement <- IfStatement("COV==1", Equation("COV_EFFECT", "0.2"), comment="This is an if statement")

## -----------------------------------------------------------------------------
ifStatement

## -----------------------------------------------------------------------------
main <- MainRecord()
main <- main %>%
  add(Equation("COV_EFFECT", "0")) %>% # Initialisation
  add(IfStatement("COV==1", Equation("COV_EFFECT", "0.1"))) %>%  # Covariate value is 1 in dataset
  add(IfStatement("COV==2", Equation("COV_EFFECT", "0.2"))) %>%  # Covariate value is 2 in dataset
  add(IfStatement("COV==3", Equation("COV_EFFECT", "0.3")))      # Covariate value is 3 in dataset

## -----------------------------------------------------------------------------
main

