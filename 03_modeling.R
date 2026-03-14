analysis<-read.csv("analysis.csv")

model1 <- glm(
  revote ~ performance_index + trust_num + corrupt_num, ##Baseline model
  data = analysis_df,
  family = binomial
)


model2 <- glm(
  revote ~ performance_index + trust_num + corrupt_num +
    age + gender + educational_qualification,
  data = analysis_df,                                     ##FINAL
  family = binomial
)



model3 <- glm(
  revote ~ performance_index + trust_num + corrupt_num +
    age + gender + educational_qualification +
    party_preference,                                     ##Tested,rejected
  data = analysis_df,
  family = binomial
)
##Summary of models
summary(model1)
summary(model2)
summary(model3)

#Final model work
exp(coef(model2))
summary(model2)$coefficients

#
analysis_df_model <- model2$model
analysis_df_model$pred <- predict(model2, type="response")

##plot
library(ggplot2)
ggplot(analysis_df_model, aes(trust_num, pred)) +
  geom_point() +
  geom_smooth()


#Saving output
write.csv(summary(model2)$coefficients,
          "C:/Users/pc/Desktop/project2/outputs/model2_coefficients.csv")
ggsave("C:/Users/pc/Desktop/project2/outputs/prediction_plot.png")
saveRDS(model2, "C:/Users/pc/Desktop/project2/outputs/model2.rds")