# prepare_data.R
library(tidyverse)
library(haven)
library(janitor)
library(naniar)

# Load and clean dataset
df <- read_sav("Daten/2626_Selects2023_Panel_Data_v2.0.sav") %>%
  zap_labels() %>%           
  clean_names()

# Identify persistent non-voters
df_nv <- df %>%
  filter(w1_f10200rec == 0, w3_f11100 %in% c(1, 2, 3)) %>%
  mutate(
    vote_group = case_when(
      w3_f11301 == 1 | w3_f11302 == 1 | w3_f11303 == 1 ~ "apathetic",
      w3_f11306 == 1 | w3_f11307 == 1 ~ "protest",
      w3_f11309 == 1 | w3_f11310 == 1 ~ "satisfied",
      TRUE ~ NA_character_
    )
  )

# Add consistent voters
df <- df %>%
  mutate(
    vote_group = case_when(
      w1_f10200rec == 1 & w3_f11100 == 1 ~ "voter",
      TRUE ~ NA_character_
    )
  )

df$vote_group[df$id %in% df_nv$id] <- df_nv$vote_group

# Create variables BEFORE filtering
df <- df %>%
  mutate(
    interest_z = scale(w3_f10100)[,1],
    trust_council_z = scale(w3_f12800a)[,1],
    trust_parliament_z = scale(w3_f12800b)[,1],
    discussion_z = scale(w2_f13310)[,1],
    media_index = rowMeans(select(., w3_f12610a, w3_f12610b, w3_f12610d, w3_f12610g, w3_f12610i), na.rm = TRUE),
    media_index_z = scale(media_index)[,1],
    membership_dummy = if_else(w3_f14081rec == 1, 1, 0),
    vote_group = relevel(factor(vote_group), ref = "voter"),
    education = factor(w1_f21310rec),
    income = factor(w1_f28910),
    employment = factor(w1_f21400)
  )

# Final filtered dataset for modelling
df_model <- df %>% filter(!is.na(vote_group))

# Save for modeling
saveRDS(df_model, "Daten/df_model.rds")


