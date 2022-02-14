## ---- echo=FALSE, warning=FALSE, message=FALSE, results='hide'----------------
EXPORT_PNG <- FALSE

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
library(campsismod)
model <- read.campsis("resources/minimalist_model/")

## -----------------------------------------------------------------------------
model <- model %>% add(Equation("V", "100"))
model

## -----------------------------------------------------------------------------
model <- model %>% add(Equation("CP", "A_CENTRAL/V"), pos=Position(Ode("A_CENTRAL")))
model

## -----------------------------------------------------------------------------
model <- model %>% add(Sigma("PROP", value=20, type="cv%"))

## -----------------------------------------------------------------------------
error <- ErrorRecord()
error <- error %>% add(Equation("OBS_CP", "CP*(1 + EPS_PROP)"))
model <- model %>% add(error)
model

## ---- eval=EXPORT_PNG---------------------------------------------------------
#  library(campsis)
#  dataset <- Dataset(3) %>% add(Observations(seq(0,24,by=3)))
#  results <- model %>% simulate(dataset=dataset, seed=0)
#  spaghettiPlot(results, "OBS_CP")

## ---- eval=EXPORT_PNG, echo=FALSE, results='hide'-----------------------------
#  ggplot2::ggsave(filename="resources/minimalist_example_obs_cp.png", width=7, height=3, dpi=100)

## -----------------------------------------------------------------------------
model %>% contains(Equation("CP"))

model %>% contains(Ode("A_CENTRAL"))

## -----------------------------------------------------------------------------
model %>% find(Equation("CP"))

model %>% find(Ode("A_CENTRAL"))

## -----------------------------------------------------------------------------
(model %>% find(Equation("CP")))@rhs

## -----------------------------------------------------------------------------
model %>% replace(Equation("V", "50")) # Previous value of 100 is overridden

## -----------------------------------------------------------------------------
model %>% delete(Equation("V"))

