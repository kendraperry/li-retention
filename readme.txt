COPYRIGHT
Code and Data to Accompany "Investigating and Communicating Library Instruction’s Relationship to 
Student Retention: A Study of Two Community Colleges" is copyright 2020 by Angela Creel, Wendy Hoag, 
and Kendra Perry.

LICENSING
The directions in this file are licensed under CC BY-SA 4.0. To view a copy of this license, 
visit https://creativecommons.org/licenses/by-sa/4.0
  
GETTING STARTED
From the GitHub or OSF page, download all the contents of the li-retention directory.
1) Click the green CODE dropdown at the top of the file list
2) Choose Download ZIP
3) After the .ZIP file downloads, extract the files to the directory of your choice on your local computer.
3a) If you are not sure how to extract the file, Google "extract zip file [your operating system]"
4) Open the folder containing your files

FILE LIST AND DESCRIPTIONS
This folder should include all of the following code and dataset files:
  AWC_A14-SP19.xlsx - a pre-formatted Excel file containing LI/retention data for the semesters Fall 2014 to Spring 2019 at Arizona Western College
  CDLA-Permissive-v1.0.pdf - complete text of the CDLA-Permissive v. 1.0 license, under which the dataset contained in the Excel files is released
  HCC_AWC_FA16-SP18.xslx - a pre-formatted Excel file containing combined LI/retention data for the semesters Fall 2016 to Spring 2018 at both HCC and AWC
  HCC_FA16-SP18.xslx - a preformatted Excel file containing LI/retention data for the semesters Fall 206 to Spring 208 at Hagerstown Community College
  LI-RetentionExcelTemplate.xslx - an empty template with only column headings provided as a starting point for your data collection & analysis
  LI-RetentionStudy.R - a file of code for R software enabling you to load your data into R (via RStudio) and analyze it the same way we did ours
  copying.txt - complete text of the GNU Affero General Public License (GNU AGPL) v. 3.0, under which the R code is licensed
  license.txt - summarizes the license terms of all components included
  readme.txt - (this file) describes how to duplicate our statistical anaysis as well as interpret the results
  
DATA PREPARATION
Summarize your data in an Excel spreadsheet with the following column headings. A template Excel file is provided. Use a separate Excel file for each institution or combination of institutions being studied. 

If you do not have your own data, you may use one or more of our datasets, contained in the HCC and AWC .xlsx files

  term = name of the term being studied (fa16, sp17, etc)
  li_ret_term = total number of eligible students who DID receive library instruction and WERE retained the following term
  li_notret_term = total number of eligible students who DID receive library instruction but were NOT retained the following term
  noli_ret_term = total number of eligible students who did NOT receive library instruction and WERE retained the following term
  noli_notret_term = total number of eligible students who did NOT receive library instruction and were NOT retained the following term
  li_ret_year = total number of eligible students who DID receive library instruction and WERE retained the following year
  li_notret_year = total number of eligible students who DID receive library instruction but were NOT retained the following year
  noli_ret_year = total number of eligible students who did NOT receive library instruction and WERE retained the following year
  noli_notret_year = total number of eligible students who did NOT receive library instruction and were NOT retained the following year

DEFINITIONS AND ASSUMPTIONS
  Eligible students: Students enrolled in either 1) a section of a course that received library instruction OR 2) a similar section/course that did NOT receive library instruction AND who did not graduate or transfer to a 4-year school before the next term or year. NOTE: It is also possible to count graduate/transfer students as retained; however, in our study, we simply excluded them from all calculations.
  Library instruction: (abbreviated as LI) An in-class presentation by a librarian on library resources, evaluating sources, documentation styles, etc. May include one-shots and/or customized presentations for a specific course or section. The key determining factor is that the librarian presents to the whole class (usually at the request of the instructor), so that student motivation is not a confounding factor.
  Retained: Re-enrolled in at least one course in the following term and/or year
  Following term: The next full term immediately following the term in which LI occurred. Summer terms are excluded. For example, if LI occurs in Spring 2017, the following term is Fall 2017. If LI occurs in Fall 2017, the following term is Spring 2018.
  Following year: The same term of the following calendar year. Summer terms are excluded. For example, if LI occurs in Spring 2017, Spring 2018 is the following year. If LI occurs in Fall 2017, Fall 2018 is the following year. 
  p-value: In statistical terminology, this is the percent likelihood that your result could occur by chance. To interpret, compare it to your alpha value. If it is smaller, your result is statistically significant. If it is larger, it is not. More info about p-values: https://www.statisticshowto.com/p-value/ 
  alpha or significance level: In statistical terminology, this is the percent likelihood of rejecting a null hypothesis when it is, in fact, true. Researchers typically identify the alpha level they are willing to accept before beginning an experiment or analysis. Common alpha levels are .05 (5%), .01 (1%), or .10 (10%). For our analysis, we used an alpha level of .05. More info about alpha levels: https://www.statisticshowto.com/what-is-an-alpha-level/
  null hypothesis: In research and statistical terminology, this is the commonly-accepted fact or outcome that we are working to disprove. For this research project, the null hypothesis is that there is NO relationship between library instruction and retention. More about null hypotheses: https://www.statisticshowto.com/probability-and-statistics/null-hypothesis/ 
  critical value (for chi-square): The value that helps you determine whether to accept or reject the null hypothesis in a chi-squared test. For a right-tailed chi-square test with one degree of freedom and an alpha level of .05 (as in our analysis), the critical value is 3.841. Chi-square test results higher than this number are considered to be statistically significant. More about critical values: https://www.statisticshowto.com/how-to-find-a-critical-chi-square-value/ 
  degrees of freedom (for chi-square): Sorry, we don't really understand this statistical concept. All we know is that, for this project, the df=1. More about degrees of freedom, in case you have a better head for stats than we do: https://www.statisticshowto.com/probability-and-statistics/hypothesis-testing/degrees-of-freedom/
  contingency table: ADD DEFINITION

STATISTICAL ANALYSIS USING RSTUDIO
  1) Begin by installing R, then RStudio. Step-by-step directions can be found in Sections 0.1 and 0.2 of https://rpubs.com/acolumbus/how-to-use-r-with-excel
  2) Open RStudio and click "Open an existing file" in the upper left corner
  2a) Click the yellow folder icon with a green arrow OR Click File > Open OR Press CTRL+O in Windows. 
  2b) Open LI-RetentionStudy.R - the file should open in the upper left pane of the RStudio window.
  3) If desired, you may resize the top left pane by dragging the borders. For ease of use, it is recommended to resize the pane so that at least the lines numbered 1-23 are visible all at the same time. 
  4) Read carefully and follow the directions in the R comments (shown in green and preceded by #) to import and analyze the data
  5) The actual directions begin on Line 22 (HOW TO USE), following the licensing information 

DATA INTERPRETATION
  1) Open one of your output files from the folder you selected in RStudio (line 71 - INPUT NEEDED (2)) - it should have a filename such as fa14-output.txt
  2) The top section shows the name of the term and the first few data points imported. This is just transcribed from your Excel file. No interpretation of these lines is necessary.

    SUMMARIES
      3) The Term-to-Term Summary shows totals of the different categories of students, percentages for LI students and non-LI students retained in the following term, and the difference in the percentages. A positive number for the difference indicates that more LI students were retained; a negative number indicates that a higher percentage of non-LI students were retained.
      4) Year-to-Year Summary shows the same information for students retained in the following year.
      5) This data can be used to make bar graphs showing comparative retention rates.

    CHI-SQUARE
      6) The top of these sections displays the contingency table on which the calcuation was run ADD LINK.
      7) Below the name of the test (Pearson's Chi-squared test with Yates' continuity correction), the results are displayed. 
      8) X-squared: This is the chi-square value. Compare it to the critical value. If it is higher than the critical value, your result is statistically significant. If it is lower, your result is not ADD LINK.
      9) df: This displays the degrees of freedom. For our scenario, this value should always be 1.
      10) p-value: This is the percent likelihood that your result could occur by chance. To interpret, compare it to your alpha value. If it is smaller, your result is statistically significant. If it is larger, it is not. More info about p-values: https://www.statisticshowto.com/p-value/ - EXPLAIN SCIENTIFIC NOTATION
      11) For more information about the chi-square test of independence and how to interpret it, see https://www.statisticshowto.com/probability-and-statistics/chi-square/

    ODDS RATIO
      12) The top of these sections displays the contingency tables on which the calculation was run. Please note that by default, the category "Exposed" corresponds with students who HAVE received LI, and the "Disease" category corresponds with those who WERE retained.
      13) Below the name of the test (Odds ratio estimate and its significance probability), the results are displayed.
      14) p-value: This is the percent likelihood that your result could occur by chance. To interpret, compare it to your alpha value. If it is smaller, your result is statistically significant. If it is larger, it is not. More info about p-values: https://www.statisticshowto.com/p-value/ - EXPLAIN SCIENTIFIC NOTATION
      15) 95 percent confidence interval: These numbers express the range (low to high) of where the odds ratio would fall 95% of the time if we repeated this test over and over with different samples. More info about 95% CIs: https://www.statisticshowto.com/probability-and-statistics/confidence-interval/#CI95
      16) sample estimates: This is the odds ratio for this particular sample. A ratio of 1 indicates that both outcomes are equally likely. A ratio higher than 1 indicates that the odds of retention are higher WITH LI. A ratio lower than 1 indicates that retention is LESS likely with LI.
      17) For more information on the odds ratio test and its interpretation, see https://www.statisticshowto.com/odds-ratio/
    
    RELATIVE PROBABILITY
      18) It is important to note that the terms "risk ratio," "relative  risk," and "relative probability" are all synonymous and interchangable. In most medical studies, the outcome under investigation is negative, such as development of a disease, and so the ratio is commonly referred to as the “risk ratio.” Since the outcome in our study is positive (retention in the following term or year), we have referred to this as the “relative probability” for the purposes of our project.
      19) The top of this section summarizes the variables used by R for the calculation, accompanied by a description of what each variable represents in our scenario. It also shows the contingency table. Note that "Exposed" is the same as "LI," and "Disease" is the same as "Retained." - ADD INFO ABOUT CONTINGENCY TABLE
      20) Below the name of the test (Risk ratio estimate and its significance probability), the results are displayed.
      21) p-value: This is the percent likelihood that your result could occur by chance. To interpret, compare it to your alpha value. If it is smaller, your result is statistically significant. If it is larger, it is not. More info about p-values: https://www.statisticshowto.com/p-value/ - ADD SCIENTIFIC NOTATION INFO
      22) 95 percent confidence interval: These numbers express the range (low to high) of where the risk ratio would fall 95% of the time if we repeated this test over and over with different samples. More info about 95% CIs: https://www.statisticshowto.com/probability-and-statistics/confidence-interval/#CI95
      23) sample estimates: This is the risk ratio for this particular sample. A ratio of 1 indicates that both outcomes are equally likely. A ratio higher than 1 indicates that the relative probability of retention is higher WITH LI and also indicates by how much. For example, a risk ratio of 1.2 means that it is 20% more likely for a student to be retained with LI. A ratio lower than 1 indicates that retention is LESS likely with LI and by how much. For example, a risk ratio of 0.8 indicates that retention is 20% less likely with LI.
      24) For more information on the odds ratio test and its interpretation, see https://www.statisticshowto.com/calculate-relative-risk/#RR
      
Code and Data to Accompany "Investigating and Communicating Library Instruction’s Relationship to Student Retention: A Study of Two Community Colleges" by Angela Creel, Wendy Hoag, and Kendra Perry is licensed under CC BY-SA 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by-sa/4.0

You may contact the authors via https://osf.io/qarzw/ 
