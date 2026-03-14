#loading libraries
library(janitor)
library(stringr)
library(dplyr)

#Load data
df<-read.csv("data_p2.csv")

#Cleaning col names
df<-df|>
  clean_names()

#Renaming party pref column
df<-df|>
  rename(party_preference=which_party_s_candidate_are_you_likely_to_vote_for_in_bbmp_elections_2015)

#Educational qualification changed to ordered factor data type
df <- df %>%
  mutate(
    educational_qualification = factor(
      educational_qualification,
      ordered = TRUE
    )
  )

#Gender data type fixing to factor
df<-df|>
  mutate(gender=as.factor(gender))

#Party preference data type fixing to factor
clean_data<-df|>
  mutate(party_preference=as.factor(party_preference))


