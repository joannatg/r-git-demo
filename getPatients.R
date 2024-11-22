library(RODBC)
library(tidyverse)
library(dplyr)
library(readxl)
library(openxlsx)
library(ggplot2)
library(gridSVG)
library(viridis)
library(gridExtra)
library(svglite)
library(scales)


install.packages("devtools")
library(devtools)
#install_github('arilamstein/choroplethrZip@v1.5.0')


#pats, their addresses and encs

dbHandleA <- odbcDriverConnect("driver={SQL Server}; server=EsyRsrchSQL01; database=research_dev; uid=georgescuj; pwd=NewPasswordHere")
#pats <- sqlQuery(dbHandleA, "SELECT * from [research_dev].[dbo].[jg_catalyst_ptAddrEnc]")
close(dbHandleA)
#patsDF <- data.frame(pats)

