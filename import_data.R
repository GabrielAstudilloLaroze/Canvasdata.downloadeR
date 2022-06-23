library(readr)
account_dim <- read_delim("~/Canvas Data/RCanvas/R/data/account_dim.txt",
                          "\t", escape_double = FALSE, col_names = TRUE,
                          col_types = cols(id = col_character()),
                          trim_ws = TRUE)

course_dim <- read_delim("~/Canvas Data/RCanvas/R/data/course_dim.txt",
                         "\t", escape_double = FALSE, col_names = TRUE,
                         col_types = cols(id = col_character(),
                                          root_account_id = col_character(), account_id = col_character(),
                                          enrollment_term_id = col_character()), trim_ws = TRUE)


enrollment_dim <- read_delim("~/Canvas Data/RCanvas/R/data/enrollment_dim.txt",
                             "\t", escape_double = FALSE, col_names = TRUE,
                             col_types = cols(id = col_character(),
                                              root_account_id = col_character(), course_section_id = col_character(),
                                              role_id = col_character(), user_id = col_character(),
                                              course_id = col_character()), trim_ws = TRUE)


quiz_dim <- read_delim("~/Canvas Data/RCanvas/R/data/quiz_dim.txt",
                       "\t", escape_double = FALSE, col_names = TRUE,
                       col_types = cols(id = col_character(),
                                        root_account_id = col_character(), course_id = col_character(),
                                        created_at = col_character()), trim_ws = TRUE)


user_dim <- read_delim("~/Canvas Data/RCanvas/R/data/user_dim.txt",
                       "\t", escape_double = FALSE, col_names = TRUE,
                       col_types = cols(id = col_character()),
                       trim_ws = TRUE)



#base: sections.
course_section_dim <- read_delim("~/Canvas Data/RCanvas/R/data/course_section_dim.txt",
                                 "\t", escape_double = FALSE, col_names = TRUE,
                                 col_types = cols(id = col_character()),
                                 trim_ws = TRUE)


module_dim <- read_delim("~/Canvas Data/RCanvas/R/data/module_dim.txt",
                         "\t", escape_double = FALSE, col_names = TRUE,
                         col_types = cols(id = col_character(),
                                          canvas_id = col_character(),
                                          course_id = col_character()),
                         trim_ws = TRUE)


module_item_dim <- read_delim("~/Canvas Data/RCanvas/R/data/module_item_dim.txt",
                              "\t", escape_double = FALSE, col_names = TRUE,
                              col_types = cols(id = col_character(),
                                               canvas_id = col_character(),
                                               assignment_id= col_character(),
                                               module_id= col_character(),
                                               quiz_id= col_character(),
                                               course_id = col_character()),
                              trim_ws = TRUE)




~/Canvas Data/RCanvas/R/data

assignment_dim <- read_delim("~/Canvas Data/RCanvas/R/data/assignment_dim.txt",
                             "\t", escape_double = FALSE, col_names = TRUE,
                             col_types = cols(id = col_character(),
                                              canvas_id = col_character(),
                                              course_id = col_character()),
                             trim_ws = TRUE)

quiz_submission_fact <- read_delim("~/Canvas Data/RCanvas/R/data/quiz_submission_fact.txt",
                                   "\t", escape_double = FALSE, col_names = TRUE,
                                   col_types = cols(score = col_number(), kept_score = col_number(),
                                                    date = col_character(), course_id = col_character(),
                                                    enrollment_term_id = col_character(), course_account_id = col_character(),
                                                    quiz_id = col_character(), assignment_id = col_character(),
                                                    user_id = col_character(), submission_id = col_character(),
                                                    enrollment_rollup_id = col_character(), quiz_submission_id = col_character()),
                                   trim_ws = TRUE)


message("Your dataframes are all ready loaded into your environment!")
