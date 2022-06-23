library(tidyverse)

data_est <- enrollment_dim %>%
  filter(type == 'StudentEnrollment' |
           type == 'StudentViewEnrollment',
         workflow_state == 'active' )%>%
  summarise(enrollment_rollup_id = id,
            user_id = user_id,
            course_id = course_id,
            section_id = course_section_id)


data_est <- course_dim%>%
  select(id, account_id)%>%
  rename(course_id=id)%>%
  right_join(data_est,by="course_id")


data_est<-account_dim%>%
  select(id,name)%>% rename(account_id=id,account_name=name)%>%
  right_join(data_est, by = "account_id")


data_est<-course_section_dim%>%
  select(id,name)%>%rename(section_id=id,section_name=name)%>%
  right_join(data_est, by = "section_id")

data_est<-user_dim%>%
  select(id, sortable_name)%>%
  rename(user_id=id,student_name=sortable_name)%>%
  right_join(data_est, by = "user_id")

data_est<-course_dim%>%
  select(id,name)%>%
  rename(course_id=id,course_name=name)%>%
  right_join(data_est, by = "course_id")


message("Your students are all ready enrolled in their courses!")
