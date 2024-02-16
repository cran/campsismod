## ----echo=FALSE, warning=FALSE, message=FALSE, results='hide'-----------------
EXPORT_PNG <- FALSE

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
library(campsismod)
model <- read.campsis("resources/minimalist_model/")

## -----------------------------------------------------------------------------
model_ <- model %>% delete(InitialCondition(compartment=1))
model_

## -----------------------------------------------------------------------------
model <- model %>% delete(InitialCondition(compartment= model %>% getCompartmentIndex("CENTRAL")))

## -----------------------------------------------------------------------------
model <- model %>% add(InfusionRate(compartment=1, "100"))

## -----------------------------------------------------------------------------
model <- model %>% add(LagTime(compartment=1, "2"))

## -----------------------------------------------------------------------------
model

## ----eval=EXPORT_PNG----------------------------------------------------------
#  library(campsis)
#  dataset <- Dataset(5) %>%
#    add(Infusion(time=0, amount=1000)) %>%
#    add(Observations(seq(0,36,by=0.5)))

## ----eval=EXPORT_PNG----------------------------------------------------------
#  results <- model %>% simulate(dataset=dataset, seed=1)
#  spaghettiPlot(results, "A_CENTRAL")

## ----eval=EXPORT_PNG, echo=FALSE, results='hide'------------------------------
#  ggplot2::ggsave(filename="resources/minimalist_example_cmt_properties.png", width=7, height=3, dpi=100)

## -----------------------------------------------------------------------------
model %>% contains(Compartment(1)) 
# Or equivalenty:
model %>% contains(Compartment(model %>% getCompartmentIndex("CENTRAL")))

## -----------------------------------------------------------------------------
model %>% contains(InfusionRate(1))
model %>% contains(InfusionDuration(1)) 

## -----------------------------------------------------------------------------
model %>% find(Compartment(1)) 

## -----------------------------------------------------------------------------
model %>% find(InfusionRate(1)) 

## -----------------------------------------------------------------------------
model %>% replace(InfusionRate(1, "200")) # Previous value of 100 is overridden

## -----------------------------------------------------------------------------
model %>% replace(Compartment(1, name="CENT")) %>%
  delete(Ode("A_CENTRAL")) %>%
  add(Ode("A_CENT", "-K*A_CENT"))

