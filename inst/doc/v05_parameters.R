## ---- echo=FALSE, warning=FALSE, message=FALSE, results='hide'----------------
EXPORT_PNG <- FALSE

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
library(campsismod)

## -----------------------------------------------------------------------------
model <- model_library$advan4_trans4
model

## -----------------------------------------------------------------------------
model %>% find(Theta("CL"))
model %>% find(Omega("KA"))
model %>% find(Sigma("PROP"))

## -----------------------------------------------------------------------------
model@parameters %>% getByIndex(Theta(index=2))
model@parameters %>% getByIndex(Omega(index=1, index2=1))
model@parameters %>% getByIndex(Sigma(index=1, index2=1))

## -----------------------------------------------------------------------------
thetaCL <- model %>% find(Theta("CL"))
thetaCL@value

## -----------------------------------------------------------------------------
theta <- Omega(name="TEST", index=1, index2=1, value=15, type="cv%")
theta@value # 15 is returned

theta_standardised <- theta %>% standardise() # Conversion to variance
theta_standardised 
theta_standardised@value

## -----------------------------------------------------------------------------
model <- model %>% replace(Theta("KA", value=2)) # Previous value for KA was 1
model <- model %>% replace(Omega("CL", value=20, type="cv%")) # Previous value was a variance of 0.025
model

## -----------------------------------------------------------------------------
model <- model %>% delete(Theta("KA"))
model <- model %>% delete(Omega("CL"))
model

## -----------------------------------------------------------------------------
tryCatch({validObject(model, complete=TRUE)}, error=function(msg) {
  print(msg)
})

