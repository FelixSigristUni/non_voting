# models_load.R
# Dieses Skript lädt die Modelle für den Einsatz in Quarto
model1 <- readRDS("models/model1.rds")
model2_clean <- readRDS("models/model2_clean.rds")
model3_better <- readRDS("models/model3_better.rds")

z1 <- summary(model1)$coefficients / summary(model1)$standard.errors
p1 <- 2 * (1 - pnorm(abs(z1)))

z2_clean <- summary(model2_clean)$coefficients / summary(model2_clean)$standard.errors
p2_clean <- 2 * (1 - pnorm(abs(z2_clean)))

z3_better <- summary(model3_better)$coefficients / summary(model3_better)$standard.errors
p3_better <- 2 * (1 - pnorm(abs(z3_better)))
