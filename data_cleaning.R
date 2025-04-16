# Pakete laden
library(tidyverse)
library(haven)
library(janitor)
library(naniar)

# Pfad zur SPSS-Datei
data_path <- "C:/Users/Felix/OneDrive/Dokumente/UNILU/FS25/Schlegel_Arbeit/git_Projektordner/non_voting/Daten/swissubase_2626_2_0/data/2626_Selects2023_Panel_Data_v2.0.sav"

# Daten einlesen und bereinigen
df <- read_sav(data_path) %>% 
  zap_labels() %>% 
  clean_names()

# Selektion: dauerhaft Nichtwählende (2019 und 2023 nicht gewählt)
df_nv <- df %>%
  filter(w1_f10200rec == 0,               # Nichtwahl 2019
         w3_f11100 %in% c(1, 2, 3))       # Nichtwahl 2023 in verschiedenen Formen


# Basisinfo
cat("Anzahl aller Fälle im Datensatz:", nrow(df), "\n")
cat("Anzahl dauerhaft Nichtwählende:", nrow(df_nv), "\n")

# Optional: Übersicht über die Gründe für Nichtwahl 2023
df_nv %>% 
  tabyl(w3_f11301, show_na = TRUE)
