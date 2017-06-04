# MEETUP - WORKSHOP 2 : DPLYR & TIDYR
# SERIE EXO 2 
setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/R_Workshop/WorkShop_2_DPLYR/CODE")
library(dplyr)
library(tidyr)
## Package readr : The goal of 'readr' is to provide a fast and friendly 
## way to read rectangular data (like 'csv', 'tsv', and 'fwf'). It is designed 
## to flexibly parse many types of data found in the wild, while still cleanly 
## failing when data unexpectedly changes.
## = > En gros, dans notre cas, ça permet de gérer le bordel des données CSV
library(readr)

### Import des données dans une variable voyage
voyages <- read_csv("DATA/2017_tastdb_meetup/tastdb_105var_utf8.csv")

### Affichage des données : 
View(voyages)

###################### FILTRER LES LIGNES
######################################################################
### Créez le tableau de données sm contenant la liste des expéditions au départ de Saint-Malo.

sm <- voyages %>%
  filter(ptdepimp == "Saint-Malo")
paste(sm$voyageid,"-",sm$shipname,"-",sm$ptdepimp)
nrow(sm)

### Créez le tableau de données cies_sm1 listant les compagnies armant depuis le port de Saint-Malo
### (ownera). La variable *ownera* figurera en seconde position de votre tableau.

colnames(sm)

cie_sm1 <- sm %>%
  filter(grepl("Compagnie",ownera)) %>%
  select(voyageid,ownera,shipname,natinimp,ptdepimp)
cie_sm1

### Créez le tableau de données cies_sm2 listant les compagnies armant depuis le port de Saint-Malo (ownera *et* ownerb).
### Les variables ownera *et* ownerb seront situées en seconde et troisième positions de votre tableau.
colnames(sm[12])
colnames(sm[13])
cie_sm2 <- sm %>%
  filter(grepl("Compagnie",ownera)|grepl("Compagnie",ownerb)) %>%
  select(voyageid,12,13,shipname,natinimp,ptdepimp)
cie_sm2

### Pour chaque période ci-dessous, créez un tableau de données :
  ### La période postérieure à l’abandon de la traite au Royaume-Uni (var abolition_ru) -- (boat_1)
abolition_ru = 1807
  ### La période de la guerre de Trente ans (var trente_ans) -- (boat_2)
trente_ans_inf = 1618 
trente_ans_sup = 1648
  ### La période de la guerre d’indépendance des États-Unis (var indp_usa) -- (boat_3)
guerre_indep_inf = 1775 
guerre_indep_sup = 1783
  ### La période d’activité de la Compagnie française des Indes occidentale (var cie_indes_occ) -- (boat_4)
cie_fr_ind_inf = 1664 
cie_fr_ind_sup = 1674.

## Option pour augmenter le nombre de données transmises
options(max.print=70000)

boat_1 <- voyages %>%
  filter(yearam >= abolition_ru)
paste(boat_1$voyageid,"-",boat_1$shipname,"-",boat_1$yearam, "-", boat_1$natinimp,"-",boat_1$ptdepimp)

boat_2 <- voyages %>%
  filter (yearam >= trente_ans_inf & yearam <= trente_ans_sup)
paste(boat_2$voyageid,"-",boat_2$shipname,"-",boat_2$yearam, "-", boat_2$natinimp,"-",boat_2$ptdepimp)

boat_3 <- voyages %>%
  filter (yearam >= guerre_indep_inf & yearam <= guerre_indep_sup)
paste(boat_3$voyageid,"-",boat_3$shipname,"-",boat_3$yearam, "-", boat_3$natinimp,"-",boat_3$ptdepimp)

boat_4 <- voyages %>%
  filter(yearam >= cie_fr_ind_inf & yearam <= cie_fr_ind_sup)
paste(boat_4$voyageid,"-",boat_4$shipname,"-",boat_4$yearam, "-", boat_4$natinimp,"-",boat_4$ptdepimp)

remove(boat_1,boat_2,boat_3,boat_4,cie_sm1,cie_sm2,sm,voyages)
remove(abolition_ru,cie_fr_ind_inf,cie_fr_ind_sup,guerre_indep_inf,guerre_indep_sup,trente_ans_inf,trente_ans_sup)
