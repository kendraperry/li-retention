# Code for working with R and performing a chi-square test of independence,
# odds ratio, and relative probability ratio to evaluate the relationship 
# between library instruction and student retention

# COPYRIGHT
# Code and Data to Accompany Investigating and Communicating Library 
# Instruction's Relationship to Student Retention: A Study of Two Community Colleges 
# is copyright 2020 by Angela Creel, Wendy Hoag, and Kendra Perry

# LICENSING
# This code is free: you can redistribute it and/or modify it under 
# the terms of the GNU Affero General Public License as published by 
# the Free Software Foundation, either version 3 of the License, or 
# any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
# See the GNU Affero General Public License for more details.
# You should have received a copy of the GNU Affero General Public 
# License along with this program.  If not, see https://www.gnu.org/licenses/

# HOW TO USE
# To run, highlight the desired code and click "Run" at the top of this window.
# Run Shortcut on Windows = Alt + Enter
# Run Shortcut on Mac = Option + Return
# For example, highlight the next 4 lines of code below (shown in black), then run.
# After this process completes, highlight and run the section after the next
# comment (shown in green)

#update all existing packages
  update.packages(c("Rtools"))
  update.packages(c("utils"))
  update.packages(c("fmsb"))
  update.packages(c("readxl"))
  update.packages(c("svDialogs"))

#install any needed packages - fmsb, readxl, & svDialogs
  install.packages(c("Rtools"))
  install.packages(c("fmsb"))
  install.packages(c("readxl"))
  install.packages(c("svDialogs"))

#load needed libraries
  library(fmsb)
  library(readxl)
  library(svDialogs)

# enter values in an Excel file with the following column headings: 
# term = name of the term being studied (fa16, sp17, etc)
# li_ret_term = total number of eligible students who DID receive library instruction and WERE retained the following term
# li_notret_term = total number of eligible students who DID receive library instruction but were NOT retained the following term
# noli_ret_term = total number of eligible students who did NOT receive library instruction and WERE retained the following term
# noli_notret_term = total number of eligible students who did NOT receive library instruction and were NOT retained the following term
# li_ret_year = total number of eligible students who DID receive library instruction and WERE retained the following year
# li_notret_year <- total number of eligible students who DID receive library instruction but were NOT retained the following year
# noli_ret_year <- total number of eligible students who did NOT receive library instruction and WERE retained the following year
# noli_notret_year <- total number of eligible students who did NOT receive library instruction and were NOT retained the following year
# use a separate Excel file for each institution or combination of institutions being studied

# ---------------------> INPUT NEEDED (1) <--------------------------
# Import the Excel file into RStudio -
# Select your Excel file

  excel <- dlgOpen(title = "Select your Excel file", multiple = FALSE)$res
  data <- read_excel(excel, 
                   col_types = c("text", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric"))

# ---------------------> INPUT NEEDED (2) <--------------------------
# set the directory where you want your results to be saved

  setwd(dlgDir(default = getwd(), title = "Set the directory where you want your results saved")$res)

# ---------------------> INPUT NEEDED (3) <--------------------------
# extract and name the row of data for each term to be analyzed
# place the term name before the <- and change the number to reflect the
# row number in which that term appears. 
# NOTE: The header row with labels does NOT count as row 1. The first row of 
# data is row 1.
# Add lines as needed to capture all terms in the dataset. 
# NOTE: Be sure to put a comma AFTER the row number
# After all terms are entered, highlight the whole block and run

fa16 <- data[1,]
sp17 <- data[2,]
fa17 <- data[3,]
sp18 <- data[4,]

# ---------------------> INPUT NEEDED (4) <--------------------------
# call the term you wish to analyze next 
# Replace the name of the term after the <- 
# AND after sink(file = " 
# OPTIONAL - if analyzing multiple institutions, prepend the institution ID
# to the filename, for example "hcc-fa16-output.txt"
# Select all four lines and Run

  current <- fa16
  sink(file = "fa16-output.txt", type = "output")
  current
  cat("\n")

# Proceed down the page  
# Run each section of code between comment lines one at a time 

#summarize LI and retention to the following term for the current term
  cat("-----------TERM-TO-TERM SUMMARY---------- \n \n")
  total_eligible_term <- sum(current$li_ret_term,current$li_notret_term,
                           current$noli_ret_term,current$noli_notret_term)
  cat("Total eligible students for term-to-term retention = ", total_eligible_term, "\n")
  total_li_term <- sum(current$li_ret_term,current$li_notret_term)
  total_noli_term <- sum(current$noli_ret_term,current$noli_notret_term)
  cat("Total students receiving LI =", total_li_term, "\n")
  cat("Total LI students retained to following term =", current$li_ret_term, "\n")
  cat("Total students not receiving LI = ", total_noli_term, "\n")
  cat("Total non-LI students retained to following term = ", current$noli_ret_term, "\n")
  percent_li_retained_term <- ((current$li_ret_term / total_li_term) * 100)
  percent_noli_retained_term <- ((current$noli_ret_term / total_noli_term) * 100)
  cat("Percent of LI students retained to following term = ", percent_li_retained_term, "\n")
  cat("Percent of non-LI students retained to following term =", percent_noli_retained_term, "\n")
  term_difference <- (percent_li_retained_term - percent_noli_retained_term)
  cat("Difference in term-to-term retention =", term_difference, "\n", "\n")

#summarize LI and retention to the following year for the current term
  cat("-----------YEAR-TO-YEAR SUMMARY---------- \n \n")
  total_eligible_year <- sum(current$li_ret_year,current$li_notret_year,
                           current$noli_ret_year,current$noli_notret_year)
  cat("Total eligible students for year-to-year retention = ", total_eligible_year, "\n")
  total_li_year <- sum(current$li_ret_year,current$li_notret_year)
  total_noli_year <- sum(current$noli_ret_year,current$noli_notret_year)
  cat("Total students receiving LI =", total_li_year, "\n")
  cat("Total LI students retained to following year =", current$li_ret_year, "\n")
  cat("Total students not receiving LI = ", total_noli_year, "\n")
  cat("Total non-LI students retained to following year = ", current$noli_ret_year, "\n")
  percent_li_retained_year <- ((current$li_ret_year / total_li_year) * 100)
  percent_noli_retained_year <- ((current$noli_ret_year / total_noli_year) * 100)
  cat("Percent of LI students retained to following year = ", percent_li_retained_year, "\n")
  cat("Percent of non-LI students retained to following year =", percent_noli_retained_year, "\n")
  year_difference <- (percent_li_retained_year - percent_noli_retained_year)
  cat("Difference in year-to-year retention =", year_difference, "\n" , "\n")

# build a contingency table to use for the term-to-term retention chi-square test
  cat("-----------TERM-TO-TERM CHI-SQUARE---------- \n \n")
  test_table_term <- rbind(c(current$li_ret_term, current$li_notret_term),
                    c(current$noli_ret_term, current$noli_notret_term))
  rownames(test_table_term) <- c("Yes LI", "No LI")
  colnames(test_table_term) <- c("Ret", "Not Ret")
  cat("Table for Term-to-Term Chi-Square Analysis (test_table_term) \n") 
  test_table_term 

# Perform a chi-square test on the generated term-to-term contingency table
  chisq_term <- chisq.test(test_table_term)
  chisq.test(test_table_term)

# build a contingency table for the year-to-year retention chi-square test
  cat("-----------YEAR-TO-YEAR CHI-SQUARE---------- \n \n")
  test_table_year <- rbind(c(current$li_ret_year, current$li_notret_year),
                         c(current$noli_ret_year, current$noli_notret_year))
  rownames(test_table_year) <- c("Yes LI", "No LI")
  colnames(test_table_year) <- c("Ret", "Not Ret")
  cat("Table for Year-to-Year Chi-Square Analysis (test_table_year) \n")
  test_table_year 

# Perform a chi-square test on the generated year-to-year contingency table
  chisq_year <- chisq.test(test_table_year)
  chisq.test(test_table_year)

# Create table for term-to-term odds ratio analysis
  cat("-----------TERM-TO-TERM ODDS RATIO---------- \n \n")
  test_table_odds_term <- as.table( matrix(c(current$li_ret_term, current$li_notret_term,
                                      current$noli_ret_term, current$noli_notret_term), 2) )
  rownames(test_table_odds_term) <- c("Yes LI", "No LI")
  colnames(test_table_odds_term) <- c("Ret", "Not Ret")
  cat("Table for Term-to-Term Odds Ratio (test_table_odds_term) \n") 
  test_table_odds_term
  cat("\n")

# Compute odds ratios on the resulting term-to-term table using fmsb package
  or.term.result <- oddsratio(test_table_odds_term)
  or.term.result

# Create table for year-to-year odds ratio analysis 
  cat("-----------YEAR-TO-YEAR ODDS RATIO---------- \n \n")
  test_table_odds_year <- as.table( matrix(c(current$li_ret_year, current$li_notret_year,
                                           current$noli_ret_year, current$noli_notret_year), 2) )
  rownames(test_table_odds_year) <- c("Yes LI", "No LI")
  colnames(test_table_odds_year) <- c("Ret", "Not Ret")
  cat("Table for Year-to-Year Odds Ratio (test_table_odds_year) \n") 
  test_table_odds_year
  cat("\n")

# Compute odds ratios on the resulting year-to-year table using fmsb package
  or.year.result <- oddsratio(test_table_odds_year)
  or.year.result
  cat("\n")

# Assign variables for term-to-term relative probability (AKA risk ratio or relative risk)
  cat("-----------TERM-TO-TERM RELATIVE PROBABILITY---------- \n \n")
  term_X <- c(current$li_ret_term)
  term_Y <- c(current$noli_ret_term)
  term_m1 <- c(current$li_ret_term + current$li_notret_term)
  term_m2 <- c(current$noli_ret_term + current$noli_notret_term)
  cat("Variables for Term-to-Term Relative Probability Analysis \n")
  cat("LI Students Retained (term_X) =", term_X, "\n")
  cat("Non-LI Students Retained (term_Y) =", term_Y, "\n")
  cat("Total LI Students (term_m1) =", term_m1, "\n")
  cat("Total Non-LI Students (term_m2) =", term_m2, "\n", "\n`")

# Compute term-to-term relative probability (AKA risk ratio or relative risk) using fmsb package
  term_relprob <- riskratio(term_X, term_Y, term_m1, term_m2)
  print(term_relprob)
  cat("\n")

# Assign variables for year-to-year relative probability (AKA risk ratio or relative risk)
  cat("-----------YEAR-TO-YEAR RELATIVE PROBABILITY---------- \n \n")
  year_X <- c(current$li_ret_year)
  year_Y <- c(current$noli_ret_year)
  year_m1 <- c(current$li_ret_year + current$li_notret_year)
  year_m2 <- c(current$noli_ret_year + current$noli_notret_year)
  cat("Variables for Year-to-Year Relative Probability Analysis \n")
  cat("LI Students Retained (year_X) =", year_X, "\n")
  cat("Non-LI Students Retained (year_Y) =", year_Y, "\n")
  cat("Total LI Students (year_m1) =", year_m1, "\n")
  cat("Total Non-LI Students (year_m2) =", year_m2, "\n", "\n")

# Compute year-to-year relative probability (AKA risk ratio or relative risk) using fmsb package
  year_relprob <- riskratio(year_X, year_Y, year_m1, year_m2)
  print(year_relprob)
  sink()

# return to Input Needed (4) and edit lines to change to the term 
# you wish to analyze next, then re-run from that point
# repeat process to this point until all terms are analyzed
# after all items are analyzed, open your output files to review results

