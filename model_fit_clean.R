# --- Robuste Gruppierung & neue Modelle ---

library(dplyr)
library(nnet)

# Gruppierung: Bildung (3 Gruppen + unknown)
df_model <- df_model %>%
  mutate(
    edu_group = case_when(
      education %in% c("1", "2", "3") ~ "low",
      education %in% c("4", "5", "6") ~ "mid",
      education %in% c("7", "8", "9", "10", "11", "12") ~ "high",
      TRUE ~ "unknown"
    ),
    edu_group = factor(edu_group, levels = c("mid", "low", "high", "unknown"))
  )

# Gruppierung: Einkommen (3 Gruppen + unknown)
df_model <- df_model %>%
  mutate(
    income_cat = case_when(
      income %in% c("1", "2", "3", "4") ~ "low",
      income %in% c("5", "6", "7") ~ "mid",
      income %in% c("8", "9", "10", "11") ~ "high",
      TRUE ~ "unknown"
    ),
    income_cat = factor(income_cat, levels = c("mid", "low", "high", "unknown"))
  )

# Gruppierung: Beschäftigung (3 Gruppen + unknown)
df_model <- df_model %>%
  mutate(
    job_cat = case_when(
      employment %in% c("1") ~ "fulltime",
      employment %in% c("2") ~ "parttime",
      employment %in% c("3", "4", "5", "6", "7", "8") ~ "other",
      TRUE ~ "unknown"
    ),
    job_cat = factor(job_cat, levels = c("fulltime", "parttime", "other", "unknown"))
  )

# Modell 1: Motivation
model1 <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z,
  data = df_model,
  Hess = TRUE
)

# Speichern
saveRDS(model1, "models/model1.rds")



# Modell 2: Motivation + SES (gruppiert)
model2_clean <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z +
    edu_group + income_cat + job_cat,
  data = df_model,
  Hess = TRUE
)

# Modell: Nur stabile Variablen ohne unknowns
model3_better <- df_model %>%
  filter(!edu_group %in% c("unknown"),
         !income_cat %in% c("unknown"),
         !job_cat %in% c("unknown")) %>%
  multinom(
    vote_group ~ interest_z + trust_parliament_z + trust_council_z +
      edu_group + income_cat + job_cat + discussion_z,
    data = .,
    Hess = TRUE
  )

# p-Werte berechnen
z2_clean <- summary(model2_clean)$coefficients / summary(model2_clean)$standard.errors
p2_clean <- 2 * (1 - pnorm(abs(z2_clean)))

z3_better <- summary(model3_better)$coefficients / summary(model3_better)$standard.errors
p3_better <- 2 * (1 - pnorm(abs(z3_better)))

# Modelle speichern
saveRDS(model2_clean, "models/model2_clean.rds")
saveRDS(model3_better, "models/model3_better.rds")
saveRDS(p2_clean, "models/p2_clean.rds")
saveRDS(p3_better, "models/p3_better.rds")