## ---- echo=FALSE, warning=FALSE, message=FALSE, results='hide'----------------
EXPORT_PNG <- FALSE

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
library(campsismod)

## ----echo=FALSE---------------------------------------------------------------
xfun::embed_file('resources/campsis_npp_plugin.xml', text="download Notepad++ plugin for CAMPSIS")

## ---- eval=TRUE---------------------------------------------------------------
model <- read.campsis("resources/minimalist_model/")

## ---- eval=EXPORT_PNG---------------------------------------------------------
#  library(campsis)
#  dataset <- Dataset(25) %>% add(Observations(seq(0,24,by=0.5)))
#  results <- model %>% simulate(dataset=dataset, seed=1)
#  spaghettiPlot(results, "A_CENTRAL")

## ---- eval=EXPORT_PNG, echo=FALSE, results='hide'-----------------------------
#  ggplot2::ggsave(filename="resources/minimalist_example_sim1.png", width=7, height=3, dpi=100)

## -----------------------------------------------------------------------------
model <- CampsisModel()

## -----------------------------------------------------------------------------
model <- model %>% add(Equation("K", "THETA_K*exp(ETA_K)"))

## -----------------------------------------------------------------------------
model <- model %>% add(Ode("A_CENTRAL", "-K*A_CENTRAL"))

## -----------------------------------------------------------------------------
model <- model %>% add(InitialCondition(compartment=1, "1000"))

## -----------------------------------------------------------------------------
model <- model %>% add(Theta("K", value=0.06))
model <- model %>% add(Omega("K", value=15, type="cv%"))

## ---- eval=EXPORT_PNG---------------------------------------------------------
#  library(campsis)
#  dataset <- Dataset(25) %>% add(Observations(seq(0,24,by=0.5)))
#  results <- model %>% simulate(dataset=dataset, seed=2)
#  spaghettiPlot(results, "A_CENTRAL")

## ---- eval=EXPORT_PNG, echo=FALSE, results='hide'-----------------------------
#  ggplot2::ggsave(filename="resources/minimalist_example_sim2.png", width=7, height=3, dpi=100)

