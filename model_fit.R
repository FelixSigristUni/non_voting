# model_fit.R
library(nnet)

# Model 1
model1 <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z,
  data = df_model
)

# Model 2
model2 <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z +
    education + income + employment,
  data = df_model
)

# Model 3
model3 <- multinom(
  vote_group ~ interest_z + trust_parliament_z + trust_council_z +
    education + income + employment +
    media_index_z + membership_dummy + discussion_z,
  data = df_model
)

# Save the models as .rds files
saveRDS(model1, "models/model1.rds")
saveRDS(model2, "models/model2.rds")
saveRDS(model3, "models/model3.rds")
