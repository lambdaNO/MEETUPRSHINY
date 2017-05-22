# MEETUP - WORKSHOP 2 : DPLYR & TIDYR
setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/R_Workshop/WorkShop_2_DPLYR")
library(dplyr)
library(tidyr)
### Permet de gérer le bordel de la lecture du fichier csv.
library(readr)
voyages <- read.csv("DATA/2017_tastdb_meetup/tastdb_105var_utf8.csv")
View(voyages)

voyage2 <- voyages %>% 
  select(1,yearam,ptdepimp,shipname)
head(voyage2)

## Rendu de voyage 3 degueu -- 
voyage3 <- voyages %>%
  select(1,2, ownera:ownerp ,captaina:captainc)
voyage3

str(voyage2)
## > head(voyage2)
## voyageid (1) yearam (2)                ptdepimp (3)       shipname (4)
voyage4 <- voyage2 %>%
  select(1,4,3,2)
head(voyage2)
head(voyage4)

###########################################################################
###########################################################################
###########################################################################

sm <- voyages %>%
  filter (ptdepimp == "Saint-Malo")
paste(sm$voyageid,"-",sm$shipname,"-",sm$ptdepimp)

cies_sml <- sm %>%
  filter(grepl("Compagnie", ownera)) %>%
  select(voyageid,shipname,ownera,ptdepimp)
cies_sml

##N'afficher que les noms de compagnie
cies_sml_bis <- sm %>%
  filter(grepl("Compagnie", ownera)) %>%
  select(voyageid,shipname,ownera) %>%
  distinct(ownera)
cies_sml_bis

cies_sml_2 <- sm %>%
  filter(grepl("Compagnie", ownera)|grepl("Compagnie",ownerb)) %>%
  select(voyageid,shipname,ownera,ownerb)
cies_sml_2


### La période postérieure à l’abandon de la traite au Royaume-Uni (var abolition_ru) ;
### La période de la guerre de Trente ans (var trente_ans) ;
### La période de la guerre d’indépendance des États-Unis (var indp_usa) ;
### La période d’activité de la Compagnie française des Indes occidentale (var cie_indes_occ).

abolition_ru = 1807
trente_ans_inf = 1618 
trente_ans_sup = 1648
guerre_indep_inf = 1775 
guerre_indep_sup = 1783
cie_fr_ind_inf = 1664 
cie_fr_ind_sup = 1674.

boat_tmp_1 <- voyages %>%
  filter(yearam >= abolition_ru)
paste(boat_tmp_1$voyageid,"-",boat_tmp_1$shipname,"-",boat_tmp_1$yearam)

boat_tmp_2 <- voyages %>%
  filter (yearam >= trente_ans_inf & yearam <= trente_ans_sup)
paste(boat_tmp_2$voyageid,"-",boat_tmp_2$shipname,"-",boat_tmp_2$yearam)

boat_tmp_3 <- voyages %>% 
  filter(yearam >= guerre_indep_inf & yearam <= guerre_indep_sup)
paste(boat_tmp_3$voyageid,"-",boat_tmp_3$shipname,"-",boat_tmp_3$yearam)

boat_tmp_4 <- voyages %>% 
  filter(yearam >= cie_fr_ind_inf & yearam <= cie_fr_ind_sup)
paste(boat_tmp_4$voyageid,"-",boat_tmp_4$shipname,"-",boat_tmp_4$yearam)

###########################################################################
###########################################################################
###########################################################################

chrono_voyages <- voyages %>%
  arrange(yearam)
paste(chrono_voyages$voyageid,"-",chrono_voyages$shipname,"-",chrono_voyages$yearam)

###########################################################################
###########################################################################
###########################################################################

voyages %>% 
  drop_na(slaximp) %>%
  filter(ptdepimp == "Liverpool") %>%
  
  summarise(total_escl <- sum(slaximp))

voyages %>%
  filter(ptdepimp == "Liverpool") %>%
  count(yearam)

voyages %>%
  filter(ptdepimp == "Nantes") %>%
  mutate(duree = datebuy - datedep)

