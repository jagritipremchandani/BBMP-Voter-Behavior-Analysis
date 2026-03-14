#Crearting revotev variable
clean_data<-clean_data|>
  mutate(
    revote=case_when(
      
      str_detect(tolower(would_you_vote_for_your_current_corporator_if_she_he_contests_elections_once_again),"\\byes\\b|confident")~1,
      str_detect(tolower(would_you_vote_for_your_current_corporator_if_she_he_contests_elections_once_again),"\\bno\\b|never ever|he should never even contest again|i'm not interested in voting in this election.")~0,
      TRUE~NA_real_
    )
  )
#Grouping performance variables
perf_cols=names(clean_data)%>%
  .[str_detect(.,
               "how_did_she_he_perform")]

#Mapping 
perf_map <- c(
  "5 - Very Good"= 5,
  "4 - Good" = 4,
  "3 - Average" = 3,
  "2 - Poor"  = 2,
  "1- Very Poor" = 1,
  "Not applicable"= NA
)

#mapped
clean_data <- clean_data %>%
  mutate(across(all_of(perf_cols),
                ~ perf_map[.x]))

#creating performance index
clean_data <- clean_data|>
  rowwise() |>
  mutate(
    performance_index = mean(c_across(all_of(perf_cols)), na.rm = TRUE)
  ) |>
  ungroup()

#creating trust_num
clean_data <- clean_data %>%
  mutate(
    trust_num = case_when(
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "very high") ~ 5,
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "high") ~ 4,
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "medium") ~ 3,
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "low") ~ 2,
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "very low") ~ 1,
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "zero") ~ 0,
      str_detect(tolower(rate_your_corporator_how_trustworthy_is_your_corporator), "can't|cant") ~ NA_real_,
      TRUE ~ NA_real_
    )
  )
#creating crrupt_num
clean_data <- clean_data %>%
  mutate(
    corrupt_num = case_when(
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "very high") ~ 5,
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "high") ~ 4,
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "medium") ~ 3,
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "low") ~ 2,
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "very low") ~ 1,
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "zero") ~ 0,
      str_detect(tolower(rate_your_corporator_how_corrupt_is_your_corporator), "can't|cant") ~ NA_real_,
      TRUE ~ NA_real_
    )
  )
#age to factor levels
clean_data<- clean_data %>%
  mutate(
    age = factor(age,
                 levels = c(
                   "Less than 20",
                   "21-25",
                   "25-30",
                   "31-40",
                   "41-50",
                   "51-60",
                   "60+"
                 )
    )
  )

#choosing variables for analysis
analysis_df <- clean_data%>%
  select(
    revote,
    performance_index,
    trust_num,
    corrupt_num,
    party_preference,
    age,
    gender,
    educational_qualification
  )
