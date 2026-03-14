# BBMP-Voter-Behavior-Analyis
Analysis of BBMP voter survey data using R to examine how perceived councilor performance, trust ,and corruption influence re-voting intentions. 

Overview:

This project analyzes voter perceptions and voting intentions in the BBMP municipal elections (Bangalore) using survey data. The goal is to examine how citizens’ perceptions of councillor performance and trust influence their likelihood of voting for the same candidate again.
The analysis focuses on transforming raw survey responses into structured variables and applying a logistic regression model to explore relationships between perceived performance and re-voting intentions.


Research Question:

How do voter perceptions of councillor performance, trust, and corruption influence the probability of voting for the same corporator again?


Dataset:

The dataset comes from a voter perception survey conducted before the BBMP municipal elections.
Key information collected includes:
Voter demographics (age, gender, education)
Perceptions of councillor performance across public services
Trust and corruption ratings
Voting intentions for the upcoming election
After cleaning and feature engineering, the final dataset used in analysis contains 261 observations.


Key Variables:

Dependent Variable-
revote
Binary variable indicating whether a respondent would vote for the same corporator again.
Independent Variables-
performance_index
Composite index measuring perceived councillor performance across multiple public service areas.
trust_num
Numeric representation of perceived trustworthiness of the councillor.
corrupt_num
Numeric representation of perceived corruption level.
party_preference
Party the respondent is most likely to vote for.
Control Variables-
age
gender
education_qualification

Methodology:

The analysis follows these steps:
Data Cleaning
Standardizing column names
Handling missing values
Converting categorical variables into factors
Feature Engineering
Constructing performance_index
Converting trust and corruption ratings into numeric variables


Modeling:

Logistic regression to estimate probability of re-voting
The logistic regression model estimates:
Copy code

revote ~ performance_index + trust_num + corrupt_num + age + gender + education
Results
The model estimates the relationship between perceived councillor performance and the likelihood of re-voting.

Key insights include:

Voter perceptions of governance performance influence re-election support.
Trust and corruption perceptions also play a role in voter decisions.
Demographic factors such as age and education can affect voting intentions.
These findings illustrate how subjective perceptions of governance translate into electoral behaviour.
Outputs:

The repository includes:
Logistic regression model summary
Predicted probability plot for re-voting behaviour
See the outputs/ folder.


Tools Used:

R
tidyverse
dplyr
ggplot2
Repository Structure
Copy code

data/       -> raw and cleaned datasets
scripts/    -> data cleaning, feature engineering, modeling
outputs/    -> model results and visualizations

Author:

Data analysis project developed as part of a portfolio focused on applied policy and governance data analysis.

Author
Data analysis project developed as part of a portfolio focused on applied policy and governance data analysis.
