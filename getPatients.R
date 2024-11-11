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


##------------------------------------------------------------------------------------------------------------------------------------------

#pats and encs
dbHandleA <- odbcDriverConnect("driver={SQL Server}; server=EsyRsrchSQL01; database=research_dev; uid=georgescuj; pwd=NewPasswordHere")
pats <- sqlQuery(dbHandleA, "SELECT DISTINCT d.patid, d.BIRTH_DATE, d.SEX, e.ADMIT_DATE, e.encounterid, 
                             cast(floor(datediff(day,cast(d.BIRTH_DATE  as date),cast('01-01-2023' as date))/365.25) as varchar) AS ageOn01Jan2023
                              FROM ochin.dbo.DEMOGRAPHIC d 
                                LEFT JOIN ochin.dbo.ENCOUNTER e ON d.patid=e.patid
                                LEFT JOIN ochin.dbo.VITAL v ON e.patid=v.patid AND e.ENCOUNTERID=v.ENCOUNTERID
                                WHERE  e.ADMIT_DATE BETWEEN '01-01-2013' AND '12-31-2023'
                                AND d.BIRTH_DATE < '01-01-2020' 
                                AND v.SYSTOLIC is not NULL
                                AND v.DIASTOLIC is not NULL ")
close(dbHandleA)
patsDF <- data.frame(pats)


