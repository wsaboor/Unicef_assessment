
# ---- analysis.R ----
# Merge ANC4/SBA with U5MR status and WPP births data
# Calculate birth-weighted coverage summaries

source("03_scripts/user_profile.R")

# Load cleaned datasets
anc4 <- read_csv(clean_anc4)
sba <- read_csv(clean_sba)
u5mr_status <- read_csv(clean_u5mr)
wpp <- read_csv(here("02_cleaneddata", "wpp_clean.csv"))

# Clean country names to lower case for consistent joins
anc4 <- anc4 %>% mutate(country = str_trim(tolower(country)))
sba <- sba %>% mutate(country = str_trim(tolower(country)))
u5mr_status <- u5mr_status %>% mutate(country = str_trim(tolower(country)))
wpp <- wpp %>% mutate(country = str_trim(tolower(country)))

# Merge ANC4 and SBA with U5MR status
anc4_joined <- anc4 %>% left_join(u5mr_status, by = "country")
sba_joined <- sba %>% left_join(u5mr_status, by = "country")

# Merge with WPP (births)
anc4_final <- anc4_joined %>% left_join(wpp, by = c("country", "year"))
sba_final <- sba_joined %>% left_join(wpp, by = c("country", "year"))

# Calculate birth-weighted mean coverage by status and year
anc_summary <- anc4_final %>%
  filter(!is.na(status) & !is.na(value) & !is.na(births)) %>%
  group_by(year, status) %>%
  summarise(
    weighted_anc4 = sum(value * births, na.rm = TRUE) / sum(births, na.rm = TRUE),
    n_countries = n(),
    .groups = "drop"
  )

sba_summary <- sba_final %>%
  filter(!is.na(status) & !is.na(value) & !is.na(births)) %>%
  group_by(year, status) %>%
  summarise(
    weighted_sba = sum(value * births, na.rm = TRUE) / sum(births, na.rm = TRUE),
    n_countries = n(),
    .groups = "drop"
  )

# Save summary outputs
write_csv(anc_summary, anc_summary_file)
write_csv(sba_summary, sba_summary_file)
