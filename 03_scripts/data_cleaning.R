# ---- data_cleaning.R ----
# Clean and save all raw input data

# Load packages and file paths
source("03_scripts/user_profile.R")
library(readxl)
library(stringr)

# ---- Load & Clean ANC4 ----
anc4 <- read_csv(anc4_file) %>%
  clean_names() %>%
  rename(
    country = ref_area_geographic_area,
    indicator = indicator_indicator,
    year = time_period_time_period,
    value = obs_value_observation_value
  ) %>%
  mutate(country = tolower(str_replace_all(str_trim(country), "[^a-z ]", "")))

# ---- Load & Clean SBA ----
sba <- read_csv(sba_file) %>%
  clean_names() %>%
  rename(
    country = ref_area_geographic_area,
    indicator = indicator_indicator,
    year = time_period_time_period,
    value = obs_value_observation_value
  ) %>%
  mutate(country = tolower(str_replace_all(str_trim(country), "[^a-z ]", "")))

# ---- Load & Clean U5MR On/Off Track Status ----
u5mr_status <- read_excel(u5mr_file) %>%
  clean_names() %>%
  rename(
    country = official_name,
    status = status_u5mr
  ) %>%
  mutate(country = tolower(str_replace_all(str_trim(country), "[^a-z ]", "")))

# ---- Load and Clean WPP Projections Sheet ----
wpp_raw <- read_excel(wpp_file, sheet = "Projections", skip = 16)

wpp_clean <- wpp_raw %>%
  clean_names() %>%
  rename(
    country = region_subregion_country_or_area
  ) %>%
  filter(
    variant == "Medium",                     # Use Medium variant (standard projections)
    year == 2022,                            # Only keep data for 2022
    !is.na(births_thousands),
    births_thousands > 0,
    !str_detect(country, "WORLD|REGION|More developed|Less developed|Least developed|income|SDG")
  ) %>%
  select(
    country,
    year,
    births_thousands,
    female_mortality_15_60 = female_mortality_between_age_15_and_60_deaths_under_age_60_per_1_000_females_alive_at_age_15,
    male_mortality_15_60 = male_mortality_between_age_15_and_60_deaths_under_age_60_per_1_000_males_alive_at_age_15,
    net_migration_rate = net_migration_rate_per_1_000_population
  ) %>%
  mutate(
    country = tolower(str_replace_all(str_trim(country), "[^a-z ]", "")),
    births = as.numeric(births_thousands) * 1000,
    female_mortality_15_60 = as.numeric(female_mortality_15_60),
    male_mortality_15_60 = as.numeric(male_mortality_15_60),
    net_migration_rate = as.numeric(net_migration_rate)
  )


# ---- Save Cleaned Outputs ----
write_csv(anc4, clean_anc4)
write_csv(sba, clean_sba)
write_csv(u5mr_status, clean_u5mr)
write_csv(wpp_clean, here("02_cleaneddata", "wpp_clean.csv"))
write_csv(wpp_raw, clean_wpp)
