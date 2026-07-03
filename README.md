# BBMP Voter Behaviour Analysis

Logistic regression analysis of 262 Bangalore voters, testing whether perceived corporator performance, trust, or corruption best predicts re-voting intention.

## Key Finding

Across three nested logistic regression models, **perceived corporator trustworthiness is the only robust, statistically significant predictor** of re-voting intention. Neither perceived service delivery performance nor corruption perception reaches significance once trust is in the model — and trust's effect holds even after adding demographic controls (age, gender, education) and party preference.

This suggests that in BBMP ward-level politics, voters are re-electing based on a relational judgment about the corporator's trustworthiness, not a scorecard evaluation of what got delivered.

## Why This Matters

Most models of local accountability assume voters reward performance or punish corruption. This dataset doesn't support that — trust in the individual corporator dominates both. That has implications for how urban governance research frames voter accountability at the ward level.

## Data

Pre-election voter perception survey, Bangalore BBMP wards. After cleaning, **n = 262**.

Collected: demographics (age, gender, education), perceived corporator performance across public services, trust and corruption ratings, and stated voting intention.

## Variables

**Dependent variable**
- `revote` — binary, would the respondent vote for the same corporator again

**Independent variables**
- `performance_index` — composite index of perceived corporator performance across public service areas
- `trust_num` — perceived trustworthiness of the specific ward corporator (single survey item)
- `corrupt_num` — perceived corruption level
- `party_preference` — party respondent is most likely to vote for

**Controls**
- `age`, `gender`, `education_qualification`

## Results

**Model 1 (baseline: performance, trust, corruption)**
Trust is the strongest predictor. Performance shows a weak positive association. Corruption is not significant.

**Model 2 (+ demographic controls)**
Trust's effect remains strong and significant, indicating robustness. Demographic variables show no significant influence.

**Model 3 (+ party preference)**
Model fit improves, but party preference introduces complete/quasi-complete separation due to sparse categories — coefficients for several party categories are unstable and not interpretable. Trust remains significant throughout.

## Limitations

- Party preference categories are sparse enough to destabilize Model 3's coefficients; those estimates should not be read as reliable.
- Cross-sectional survey data — the relationship is associational, not causal.
- Single-item trust measure (`trust_num`) captures perceived trustworthiness of the specific corporator, not institutional trust in local government more broadly.

## Repository Structure

```
data/     raw and cleaned datasets
scripts/  data cleaning, feature engineering, modeling
output/   model summaries and visualizations
```

## Tools

R — tidyverse, dplyr, ggplot2

## Author

Jagriti Premchandani — part of a research portfolio in applied political economy and governance data analysis.
