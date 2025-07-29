# ---- run_project.R ----
# Master script to execute the entire UNICEF assessment workflow
# This script loads libraries, cleans data, performs analysis, and renders the report.

# Step 1: Load environment setup and define all file paths
source("03_scripts/user_profile.R")

# Step 2: Clean all raw datasets and save standardized outputs
source("03_scripts/data_cleaning.R")

# Step 3: Perform analysis with birth-weighted coverage estimates
source("03_scripts/analysis.R")

# Step 4: Render the final report from RMarkdown to HTML
rmarkdown::render("05_report/summary_report.Rmd", output_format = "html_document")
rmarkdown::render("05_report/summary_report.Rmd", output_format = "pdf_document")