library(conmat)

set.seed(2021-09-24)
polymod_contact_data <- get_polymod_setting_data()
polymod_survey_data <- get_polymod_population()

setting_models <- fit_setting_contacts(
  contact_data_list = polymod_contact_data,
  population = polymod_survey_data
)

alice_age_pop <- abs_age_lga("Alice Springs (T)")
alice_age_pop
synthetic_settings_5y_alice <- predict_setting_contacts(
  population = alice_age_pop,
  contact_model = setting_models,
  age_breaks = c(seq(0, 85, by = 5), Inf)
)

hobart_age_pop <- abs_age_lga("Hobart (C)")
hobart_age_pop
synthetic_settings_5y_hobart <- predict_setting_contacts(
  population = hobart_age_pop,
  contact_model = setting_models,
  age_breaks = c(seq(0, 85, by = 5), Inf)
)

# this code is erroring for the moment - something to do with rendering a large plot I think.
plot_matrix(synthetic_settings_5y_alice$home)
plot_matrix(synthetic_settings_5y_hobart$home)

plot_matrix(synthetic_settings_5y_alice$work)
plot_matrix(synthetic_settings_5y_hobart$work)


plot_setting_matrices(
  synthetic_settings_5y_alice,
  title = "Setting-specific synthetic contact matrices (Alice springs 2020 projected)"
)

plot_setting_matrices(
  synthetic_settings_5y_hobart,
  title = "Setting-specific synthetic contact matrices (Hobart 2020 projected)"
)
