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
library(plotrix)

### Import des données dans une variable voyage
voyages <- read_csv("DATA/2017_tastdb_meetup/tastdb_105var_utf8.csv")

### Affichage des données : 
View(voyages)

###################### RESUMER DES DONNEES 

### Calculez le nombre total d’esclaves embarqués par les navires ayant pour port de départ Liverpool

voyages %>% 
  ### drop_na() : Drop rows containing missing values
  drop_na(slaximp) %>%
  filter(ptdepimp == "Liverpool") %>%
  summarise(total_escl <- sum(slaximp))

### Concevez le tableau de distribution des expéditions de traite par années au départ du port de Liverpool
### L’opérateur d’exclusion correspond au signe !.

options(max.print=10000)

cpt_lvp <- voyages %>%
  filter(ptdepimp=="Liverpool") %>%
  count(yearam)
cpt_lvp

plot(cpt_lvp)

### Etablissez la liste alphabétique des ports ayant pratiqué la traite atlantique en omettant les désignations imprécises.

X <- voyages %>%
  distinct(ptdepimp) %>%
  filter(grepl("unspecified",ptdepimp)) %>%
  arrange(ptdepimp)
    
paste(X$ptdepimp)

voyages %>%
  filter(ptdepimp == "Liverpool") %>%
  count(yearam)

voyages %>%
  filter(ptdepimp == "Nantes") %>%
  drop_na(datedep) %>%
  drop_na(datebuy) %>%
  count(yearam)

### GROUPER DES VARIABLES 
### Reproduisez le tableau ci-dessous 
##### Source: local data frame [13 x 3]
##### Groups: yearam [12]
##### # A tibble: 13 x 3
##### yearam          natinimp     n
##### <int>             <chr> <int>

flags_years <- voyages %>%
  group_by(yearam, natinimp) %>%
  count (yearam, natinimp) 
flags_years

### Groupage de variables par périodisation 
### Calculer des periodes adéquates 
### Grouper ensuite le nombre d'expédition en fonction des périodes définies 


perio <- voyages %>%
  group_by(intervalles_chrono = cut(yearam, breaks= seq(1500, 1875, by = 25),
                                    include.lowest = TRUE,
                                    right = FALSE,  
                                    dig.lab = 4)) %>% 
  summarise(n_expeditions= n()) 

perio
plot(perio)

