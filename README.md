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
    ├── summary_report.pdf
    └── summary_report.docx
</pre>


## Summary

This assessment analyzes maternal health coverage using:
- **ANC4**: Percentage of women (aged 15–49) receiving at least four antenatal care visits.
- **SBA**: Percentage of births attended by skilled health personnel.

Countries were grouped by their under-five mortality (U5MR) status: **Achieved**, **On Track**, and **Acceleration Needed**. Coverage values were *weighted by projected births in 2022* (sourced from the UN World Population Prospects), providing a population-sensitive comparison of maternal health service access.


## Key Findings

- **On-track countries** have consistently higher ANC4 and SBA coverage when adjusted for 2022 projected births.
- **Acceleration needed countries** show significantly lower weighted coverage, reflecting persistent service delivery gaps.
- **Equity insight**: Population-weighted results emphasize disparities in maternal care access not visible in unweighted averages.
- **Policy implication**: Targeted investments are needed to scale up maternal health systems in countries falling behind U5MR targets.


## Reproducibility

All code is located in `03_scripts/`. You can regenerate the entire workflow by running:

source("03_scripts/run_project.R")


## References

- UNICEF Data. (2024). Skilled Attendance at Birth and Antenatal Care Data. https://data.unicef.org/topic/maternal-health/antenatal-care/
- UNICEF. (2024). Tracking Progress Towards Under-Five Mortality Targets. UNICEF Data Portal. https://data.unicef.org/topic/child-survival/under-five-mortality/
- UNICEF. (2024). Global Databases on Child Health Coverage and Mortality Classifications.
- United Nations. (2022). World Population Prospects 2022. Department of Economic and Social Affairs, Population Division. https://population.un.org/wpp/
