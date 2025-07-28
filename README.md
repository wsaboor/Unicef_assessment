## Positions Applied For

This assessment is submitted in support of the following consultancy positions at UNICEF:

- Learning and Skills Data Analyst Consultant – Req. #581598  
- Household Survey Data Analyst Consultant – Req. #581656  
- Administrative Data Analyst – Req. #581696  
- Microdata Harmonization Consultant – Req. #581699  

# UNICEF Consultancy Assessment Report

This repository contains the UNICEF consultancy assessment deliverables focused on analyzing population-weighted health coverage (ANC4 and SBA) by under-five mortality (U5MR) track status.

## Project Structure

<pre>
  
├── 01_rawdata/          # Raw datasets
    ├── ANC4.csv          
    ├── SBA.csv
    ├── On-track and off-track countries.xlsx
    └── WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx

├── 02_cleaneddata/       # Cleaned and merged datasets
    ├──  anc4_clean.csv
    ├──  sba_clean.csv
    ├──  u5mr_status.csv
    └── WPP_clean.csv

├── 03_scripts/            # R scripts for data cleaning and processing
    ├── data_cleaning.R
    ├── run_project.R      # Master script to run all steps
    ├── user_profile.R
    └── analysis.R

├── 04_output/              # Outputs: ANC4 and SBA summary
    ├── anc_summary.csv     # Weighted ANC4 by year and U5MR status
    └── sba_summary.csv     # Weighted SBA by year and U5MR status

├── 05_report/              # Final report
    ├── summary_report.Rmd  # Full visualization report
    ├── summary_report.html
    └── summary_report.pdf
</pre>


## Summary

The assessment analyzes maternal health coverage:
- **ANC4**: 4+ antenatal care visits
- **SBA**: Skilled birth attendance

The analysis assesses antenatal care (ANC4) and skilled birth attendance (SBA) coverage. Countries were grouped by their U5MR progress status ("Achieved", "On Track", "Acceleration Needed"). Coverage values were *weighted by births* using UN demographic data (WPP 2022), offering a more equitable view of service access.


## Key Findings

- **On-track countries** show consistently higher weighted ANC4 and SBA coverage.
- **Acceleration needed countries** show persistent disparities in access.
- **Policy insight**: Greater investment and health system strengthening are needed in lagging countries.

## Reproducibility

All code is located in `03_scripts/`. You can regenerate the entire workflow by running:

source("03_scripts/run_project.R")


## References

- UNICEF Data. (2024). Skilled Attendance at Birth and Antenatal Care Data. https://data.unicef.org/topic/maternal-health/antenatal-care/
- UNICEF. (2024). Tracking Progress Towards Under-Five Mortality Targets. UNICEF Data Portal. https://data.unicef.org/topic/child-survival/under-five-mortality/
- UNICEF. (2024). Global Databases on Child Health Coverage and Mortality Classifications.
- United Nations. (2022). World Population Prospects 2022. Department of Economic and Social Affairs, Population Division. https://population.un.org/wpp/
