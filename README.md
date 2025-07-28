# UNICEF Consultancy Assessment Report

This repository contains the UNICEF consultancy assessment deliverables focused on analyzing population-weighted health coverage (ANC4 and SBA) by under-five mortality (U5MR) track status.

## Project Structure

<pre>
```
  
├── 01_rawdata/           # Raw datasets
    ├── ANC4.csv          
    ├── SBA.csv
    ├── On-track and off-track countries.xlsx
    └── WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx

├── 02_cleaneddata/       # Cleaned and merged datasets
    ├──  anc4_clean.csv
    ├──  sba_clean.csv
    ├──  u5mr_status.csv
    └── WPP_clean.csv

├── 03_scripts/           # R scripts for data cleaning and processing
    ├── data_cleaning.R
    ├── run_project.R
    ├──  user_profile.R
    └── analysis.R

├── 04_output/            # Outputs: ANC4 and SBA summary
    ├── anc_summary.csv
    └── sba_summary.csv

├── 05_report/            # Final report and source
    ├── summary_report.Rmd
    ├── summary_report.html
    └── summary_report.pdf
```
</pre>


## Summary

The analysis assesses antenatal care (ANC4) and skilled birth attendance (SBA) coverage by grouping countries into “on-track” and “off-track” categories based on U5MR status. Population-weighted averages were computed using country-specific birth counts from UN demographic data (WPP 2022). 

## Key Findings

- On-track countries exhibit higher weighted averages for both ANC4 and SBA.
- Clear disparities exist, highlighting the need for targeted investment in off-track countries.

## Reproducibility

All code is included in the `03_scripts/` folder. You can regenerate the results by running `report.Rmd`.

## References

- UNICEF Health Coverage Indicators
- UN World Population Prospects 2022
- U5MR Tracking from UNICEF Global Databases
