## ---- echo=FALSE, warning=FALSE, message=FALSE, results='hide'----------------
EXPORT_PNG <- FALSE

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
library(campsismod)

## -----------------------------------------------------------------------------
pk_model <- model_library$advan4_trans4

## ----echo=TRUE, warning=FALSE, message=FALSE----------------------------------
pd_model <- model_library$effect_cmt_model
pd_model

## -----------------------------------------------------------------------------
pd_model <- pd_model %>% replace(Equation("PK_CONC", "A_CENTRAL/S2"))

## -----------------------------------------------------------------------------
pkpd_model <- pk_model %>% add(pd_model)
pkpd_model

## ---- eval=EXPORT_PNG---------------------------------------------------------
#  library(campsis)
#  dataset <- Dataset(25) %>%
#    add(Bolus(time=0, amount=1000, compartment=1, ii=12, addl=2)) %>%
#    add(Observations(times=0:36))
#  results <- pkpd_model %>% simulate(dataset=dataset, seed=1)
#  shadedPlot(results, "CP")

## ---- eval=EXPORT_PNG---------------------------------------------------------
#  shadedPlot(results, "CP")

## ---- eval=EXPORT_PNG, echo=FALSE, results='hide'-----------------------------
#  ggplot2::ggsave(filename="resources/pkpd_model_concentration.png", width=7, height=3, dpi=100)

## ---- eval=EXPORT_PNG---------------------------------------------------------
#  shadedPlot(results, "A_EFFECT")

## ---- eval=EXPORT_PNG, echo=FALSE, results='hide'-----------------------------
#  ggplot2::ggsave(filename="resources/pkpd_model_effect.png", width=7, height=3, dpi=100)
