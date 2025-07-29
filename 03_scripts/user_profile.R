# ---- user_profile.R ----
# Loading libraries and defining file paths

# Libraries
library(tidyverse)
library(readxl)
library(janitor)
library(here)
library(writexl)
library(readr)


# Global options
options(scipen = 999)  # to turn off scientific notation

# --- RAW DATA FILES (located in 01_rawdata/) ---

anc4_file <- here("01_rawdata", "ANC4.csv")  # Percentage of women with at least four antenatal care visits
sba_file <- here("01_rawdata", "SBA.csv")     # Percentage of births attended by skilled health personnel
u5mr_file <- here("01_rawdata", "On-track and off-track countries.xlsx")    # Country classification into "Achieved", "On Track", or "Acceleration Needed"
wpp_file <- here("01_rawdata", "WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx")  # Source of population and birth statistics

# --- CLEANED DATA OUTPUTS (written to 02_cleaneddata/) ---

clean_anc4 <- here("02_cleaneddata", "anc4_clean.csv")
clean_sba <- here("02_cleaneddata", "sba_clean.csv")
clean_u5mr <- here("02_cleaneddata", "u5mr_status.csv")
clean_wpp <- here("02_cleaneddata", "wpp_raw.csv")

# --- FINAL ANALYSIS OUTPUTS (written to 04_outputs/) ---

anc_summary_file <- here("04_outputs", "anc_summary.csv") # Birth-weighted ANC4 coverage summary by year and U5MR status
sba_summary_file <- here("04_outputs", "sba_summary.csv") # Birth-weighted SBA coverage summary by year and U5MR status