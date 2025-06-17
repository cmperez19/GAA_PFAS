# GAA_PFAS Analysis
Analysis of the effects of per- and polyfluoroalkyl substances (PFAS) on gestational age acceleration (GAA) and 5 estimated cell type proportions from human placental DNA methylation data. The results of this analysis are published in Environmental Research: [https://doi.org/10.1016/j.envres.2025.120868]. 
## Project Context
PFAS are persistent pollutants that can accumulate in the placenta and contribute to neonatal health outcomes like low birthweight. 
## Data Availability 
This analysis uses publicly available placental DNA methylation data from the Gene Expression Omnibus (GEO):
**GSE288358 – Placental PFAS concentrations are associated with perturbations of placental DNA methylation**  
Available at: [https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE288358]
Please refer to the original study for data processing and sample description details.
If using this dataset, cite the original authors:
> Everson TM, Sehgal N, Campbell K, Barr DB et al. Placental PFAS concentrations are associated with perturbations of placental DNA methylation. Environ Pollut 2025 Mar 1;368:125737. PMID: 39862910

> Perez C, Sehgal N, Eick SM, Barr DB et al. Sex-specific effects of in utero exposure to per- and polyfluoroalkyl substances on placental development. Environ Res 2025 Apr 1;270:120868. PMID: 39884538
## Disclaimer
This repository does not include individual-level chemical exposure data (e.g., PFAS measurements) used in the original study. Only the DNA methylation data from GEO accession [GSE288358](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE288358) is utilized here. 
## Key Steps
1. Load and clean raw data (`data/raw/UCMR5.csv`)
2. Summarize detections by state and water system
3. Map high-risk areas (> MCL, large populations)
4. Generate summary tables & figures




