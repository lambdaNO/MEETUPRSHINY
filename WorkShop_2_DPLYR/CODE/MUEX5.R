# MEETUP - WORKSHOP 2 : DPLYR & TIDYR
# SERIE EXO 5 
setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/R_Workshop/WorkShop_2_DPLYR/CODE")
library(dplyr)
library(tidyr)
## Package readr : The goal of 'readr' is to provide a fast and friendly 
## way to read rectangular data (like 'csv', 'tsv', and 'fwf'). It is designed 
## to flexibly parse many types of data found in the wild, while still cleanly 
## failing when data unexpectedly changes.
## = > En gros, dans notre cas, ça permet de gérer le bordel des données CSV
library(readr)
library(plotrix)

### Import des données dans une variable voyage
voyages <- read_csv("DATA/2017_tastdb_meetup/tastdb_105var_utf8.csv")

### Affichage des données : 
View(voyages)

###################### CONSTRUIRE DE NOUVELLES VARIABLES  

### Lorque cela est possible, calculez la durée de navigation des navires nantais jusqu’au principal lieu d’achat d’esclaves.
### Votre tableau de données devra reproduire le tableau ci-dessous.

options(max.print=10000)

fil <- voyages %>%
  filter(ptdepimp == "Nantes") %>%
  drop_na(datedep) %>%
  drop_na(datebuy) %>%
  select(voyageid,shipname,datedep,datebuy,ptdepimp) %>%
  mutate(duree_navigation = datebuy - datedep) %>%
  arrange(duree_navigation) %>%
  fil

### Calculez la durée moyenne de navigation des navires nantais jusqu’aux principaux lieux d’achat d’esclaves.

voyages %>%
  filter(ptdepimp=="Nantes") %>%
  drop_na(datedep, datebuy) %>%
  select(1, shipname, mjbyptimp, datedep, datebuy) %>%
  mutate(duree_navigation = datebuy - datedep) %>%
  group_by(mjbyptimp) %>%
  summarise(mean(round(duree_navigation), 1)) 

### Calculez la durée moyenne de navigation des navires nantais jusqu’aux principaux lieux d’achat d’esclaves.
### Complétez votre tableau par des colonnes, indiquant pour chaque principal lieu d’achat, les durée min et max de navigation depuis Nantes.


