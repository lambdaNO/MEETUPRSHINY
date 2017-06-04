# MEETUP - WORKSHOP 2 : DPLYR & TIDYR
# SERIE EXO 3
setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/R_Workshop/WorkShop_2_DPLYR/CODE")
library(dplyr)
library(tidyr)
## Package readr : The goal of 'readr' is to provide a fast and friendly 
## way to read rectangular data (like 'csv', 'tsv', and 'fwf'). It is designed 
## to flexibly parse many types of data found in the wild, while still cleanly 
## failing when data unexpectedly changes.
## = > En gros, dans notre cas, ça permet de gérer le bordel des données CSV
library(readr)
library(plotrix) ## Pour s'amuser

### Import des données dans une variable voyage
voyages <- read_csv("DATA/2017_tastdb_meetup/tastdb_105var_utf8.csv")

### Affichage des données : 
View(voyages)

###################### TRIER & REPRESENTER
######################################################################

### Triez chronologiquement les expéditions de traite dans un tableau de données appelé chrono_voyages
### Vous utiliserez la variable yearam que vous positionnerez en seconde position de votre tableau.
options(max.print=35000)

chrono_voyages <- voyages %>% 
  arrange(yearam)
paste(chrono_voyages$voyageid,"-",chrono_voyages$yearam, "-",chrono_voyages$shipname,"-", chrono_voyages$natinimp,"-",chrono_voyages$ptdepimp)

table(chrono_voyages$natinimp)
barplot(table(chrono_voyages$yearam))
pie3D(table(chrono_voyages$natinimp),explode=0.1)

chrono_voyages <- voyages %>% 
  arrange(desc(yearam))
paste(chrono_voyages$voyageid,"-",chrono_voyages$yearam, "-",chrono_voyages$shipname,"-", chrono_voyages$natinimp,"-",chrono_voyages$ptdepimp)
barplot(table(chrono_voyages$yearam))

natio_voyages <- voyages %>%
  arrange(natinimp)
paste(chrono_voyages$voyageid,"-",chrono_voyages$yearam, "-",chrono_voyages$shipname,"-", chrono_voyages$natinimp,"-",chrono_voyages$ptdepimp)

pie(table(chrono_voyages$natinimp),explode=0.1)
pie3D(table(chrono_voyages$natinimp),explode=0.1)

fr_natio_voyages <- natio_voyages %>%
  filter(natinimp =="France")
paste(fr_natio_voyages$voyageid,"-",fr_natio_voyages$yearam, "-",fr_natio_voyages$shipname,"-", fr_natio_voyages$natinimp,"-",fr_natio_voyages$ptdepimp)
