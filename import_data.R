library(readr)
account_dim <- read_delim("~/datos/account_dim.txt",
                          "\t", escape_double = FALSE, col_names = TRUE,
                          col_types = cols(id = col_character()),
                          trim_ws = TRUE)

course_dim <- read_delim("~/datos/course_dim.txt",
                         "\t", escape_double = FALSE, col_names = TRUE,
                         col_types = cols(id = col_character(),
                                          root_account_id = col_character(), account_id = col_character(),
                                          enrollment_term_id = col_character()), trim_ws = TRUE)


enrollment_dim <- read_delim("~/datos/enrollment_dim.txt",
                             "\t", escape_double = FALSE, col_names = TRUE,
                             col_types = cols(id = col_character(),
                                              root_account_id = col_character(), course_section_id = col_character(),
                                              role_id = col_character(), user_id = col_character(),
                                              course_id = col_character()), trim_ws = TRUE)


quiz_dim <- read_delim("~/datos/quiz_dim.txt",
                       "\t", escape_double = FALSE, col_names = TRUE,
                       col_types = cols(id = col_character(),
                                        root_account_id = col_character(), course_id = col_character(),
                                        created_at = col_character()), trim_ws = TRUE)


user_dim <- read_delim("~/datos/user_dim.txt",
                       "\t", escape_double = FALSE, col_names = TRUE,
                       col_types = cols(id = col_character()),
                       trim_ws = TRUE)



#base: sections.
course_section_dim <- read_delim("~/datos/course_section_dim.txt",
                                 "\t", escape_double = FALSE, col_names = TRUE,
                                 col_types = cols(id = col_character()),
                                 trim_ws = TRUE)


module_dim <- read_delim("~/datos/module_dim.txt",
                         "\t", escape_double = FALSE, col_names = TRUE,
                         col_types = cols(id = col_character(),
                                          canvas_id = col_character(),
                                          course_id = col_character()),
                         trim_ws = TRUE)


module_item_dim <- read_delim("~/datos/module_item_dim.txt",
                              "\t", escape_double = FALSE, col_names = TRUE,
                              col_types = cols(id = col_character(),
                                               canvas_id = col_character(),
                                               assignment_id= col_character(),
                                               module_id= col_character(),
                                               quiz_id= col_character(),
                                               course_id = col_character()),
                              trim_ws = TRUE)






assignment_dim <- read_delim("~/datos/assignment_dim.txt",
                             "\t", escape_double = FALSE, col_names = TRUE,
                             col_types = cols(id = col_character(),
                                              canvas_id = col_character(),
                                              course_id = col_character()),
                             trim_ws = TRUE)

quiz_submission_fact <- read_delim("~/datos/quiz_submission_fact.txt",
                                   "\t", escape_double = FALSE, col_names = TRUE,
                                   col_types = cols(score = col_number(), kept_score = col_number(),
                                                    date = col_character(), course_id = col_character(),
                                                    enrollment_term_id = col_character(), course_account_id = col_character(),
                                                    quiz_id = col_character(), assignment_id = col_character(),
                                                    user_id = col_character(), submission_id = col_character(),
                                                    enrollment_rollup_id = col_character(), quiz_submission_id = col_character()),
                                   trim_ws = TRUE)
