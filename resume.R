library(dplyr)

quizzes<-quiz_submission_fact%>%
  mutate(date_ymd=as.Date(str_sub(quiz_submission_fact$date, 1, 10),format = "%Y-%m-%d"),
         score=as.numeric(score))%>%
  select(quiz_id,
         score,
         quiz_points_possible,
         enrollment_rollup_id,
         course_account_id,
         course_id,
         user_id,
         date_ymd)%>%
  rename(points_possible = quiz_points_possible,
         account_id = course_account_id)

#rm(quiz_submission_fact)
#gc()

mq<-module_item_dim%>%
  filter(!(quiz_id == "\\N"))%>%
  select(module_id,quiz_id)


quizzes<-module_dim%>%
  select(id,unlock_at)%>%
  rename(module_id = id)%>%
  right_join(mq,by = "module_id")%>%
  mutate(unlock_at=as.Date(substr(unlock_at, 1, 10),format = "%Y-%m-%d"))%>%
  select(-c(module_id))%>%
  right_join(quizzes,mq,by = "quiz_id")%>%
  distinct()

rm(mq)

gc()

quiz_order<-quizzes %>%
  select(course_id,quiz_id,unlock_at,date_ymd)%>%
  mutate(pub_date = as.character(case_when(is.na(unlock_at) == FALSE ~ unlock_at,
                          is.na(unlock_at) == TRUE ~ date_ymd)))%>%
  filter(!(is.na(pub_date)))%>%
  distinct()%>%
  group_by(quiz_id)%>%
  slice_min(pub_date)%>%
  group_by(course_id,quiz_id)%>%
  arrange(pub_date)%>%
  summarise(pub_date=min(pub_date),quiz_number=1)%>%
  mutate(quiz_number=cumsum(quiz_number))


quizzes<-left_join(quizzes,quiz_order[,-1],by = "quiz_id")


data_est<-quiz_order%>%
  group_by(course_id)%>%
  summarise(`quizzes Publicados`= max(quiz_number))%>%
  right_join(data_est,by="course_id")




data_est<-quizzes%>%
  group_by(enrollment_rollup_id)%>%
  summarise(`quizzes contestados` = n())%>%
  right_join(data_est,by="enrollment_rollup_id")



rm(quiz_order)
gc()

message("Your quizzes are all ready processed!")
