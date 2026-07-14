# Sri Lanka Dengue Dashboard
[![DOI](https://zenodo.org/badge/1268880115.svg)](https://doi.org/10.5281/zenodo.21351718)

This dashboard provides an interactive overview of the dengue situation in Sri Lanka using
the latest available surveillance data. Built with R using the Quarto Dashboard framework, it
presents recent dengue trends, district-level analyses, historical patterns, comparisons with the
global dengue situation, and explores the relationship between dengue transmission and key
climate variables. The dashboard offers valuable insights for monitoring, understanding, and
supporting evidence-based decision-making on dengue dynamics in Sri Lanka.

## Dashboard Link

https://amalirajapaksha.github.io/denguedashboard_SriLanka/

## Created by

-   [Y.M. Amali P. Rajapaksha](https://amalipriyanwada.netlify.app/), Department of Statistics, Faculty of Applied Sciences, University of Sri Jayewardenepura.

## Data
-   All local data up to December 2025 used in this dashboard are obtained from the weekly epidemiological reports published by the Epidemiology Unit, Ministry of Health, Sri Lanka, through the `denguedatahub` R package, available at [https://github.com/thiyangt/denguedatahub](https://github.com/thiyangt/denguedatahub).

-   Data for 2026 are obtained from the weekly epidemiological reports published by the Epidemiology Unit, Ministry of Health, Sri Lanka, and the Weekly Dengue Updates published by the National Dengue Control Unit, Ministry of Health, Sri Lanka. These data are extracted through web scraping using the `convert_slwer_to_tidy()` function available in the `denguedatahub` package.

-   Sri Lanka maps are created using the `ceylon` package in R available [here](https://github.com/thiyangt/ceylon).

-   The global data used in this dashboard are obtained from the World Health Organization's [Global Dengue Surveillance Dashboard](https://worldhealthorg.shinyapps.io/dengue_global/).

-   The climate data used in this study were downloaded from the [NASA POWER Data Access Viewer](https://power.larc.nasa.gov/data-access-viewer/), provided by the National Aeronautics and Space Administration (NASA).

 ## Remarks

-   Although the Ampara district has been divided into two Regional Directorates of Health Services (RDHS) areas, Ampara and Kalmunai, both Kalmunai and Ampara RDHS counts are combined and represented under Ampara district in the Sri Lanka country map.

-   Countries with the highest number of confirmed cases were selected as top 10 countries in Global Comparison tab.

 ## References

-   **Visualization techniques:** Referenced the [Sri Lanka COVID-19 Dashboard](https://thiyangt.github.io/coviddashboard/) to explore and adapt visualization techniques that can be applied for disease surveillance and epidemiological analysis, including interactive summaries and temporal trend visualization.

-   **Climate–dengue correlation analysis methods:** Reviewed statistical approaches from the papers *"Analysis of the correlation between climatic variables and Dengue cases in the city of Alagoinhas/BA"* by Marcos Batista Figueredo et al. and *"Correlation between incidence of dengue and climatic factors in the Philippines: An ecological study"* by Ann Kashmer D. Yu et al. to identify suitable methods for analysing relationships between climatic variables and dengue incidence.
