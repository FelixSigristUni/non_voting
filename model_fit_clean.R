# --- Robuste Gruppierung & neue Modelle ---

library(dplyr)
library(nnet)

# Vereinfachte Gruppierungen für robustes Modell 3
df_model <- df_model %>%
  mutate(
    edu_group_simple = case_when(
      education %in% c("7", "8", "9", "10", "11", "12") ~ "tertiary",
      education %in% c("1", "2", "3", "4", "5", "6") ~ "non-tertiary",
      TRUE ~ "unknown"
    ),
    income_simple = case_when(
      income %in% c("8", "9", "10", "11") ~ "high",
      income %in% c("1", "2", "3", "4", "5", "6", "7") ~ "low-mid",
      TRUE ~ "unknown"
    ),
    job_simple = case_when(
      employment %in% c("1") ~ "fulltime",
      employment %in% c("2", "3", "4", "5", "6", "7", "8") ~ "parttime-other",
      TRUE ~ "unknown"
    ),
    edu_group_simple = factor(edu_group_simple, levels = c("non-tertiary", "tertiary", "unknown")),
    income_simple = factor(income_simple, levels = c("low-mid", "high", "unknown")),
    job_simple = factor(job_simple, levels = c("fulltime", "parttime-other", "unknown"))
  )

# Modell 1: Motivation
model1 <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z,
  data = df_model,
  Hess = TRUE
)

# Speichern
saveRDS(model1, "models/model1.rds")

# Modell 2: Motivation + SES (original gruppiert)
model2_clean <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z +
    edu_group + income_cat + job_cat,
  data = df_model,
  Hess = TRUE
)

# Modell 3 (vereinfacht & robust)
model3_better <- df_model %>%
  filter(edu_group_simple != "unknown",
         income_simple != "unknown",
         job_simple != "unknown") %>%
  multinom(
    vote_group ~ interest_z + trust_parliament_z + trust_council_z +
      edu_group_simple + income_simple + job_simple + discussion_z,
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
