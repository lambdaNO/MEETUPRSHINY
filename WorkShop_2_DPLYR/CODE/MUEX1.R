# MEETUP - WORKSHOP 2 : DPLYR & TIDYR
# SERIE EXO 1 
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

###################### SELECTION DE DONNEES 
######################################################################

### Création d'un tableau à partir de voyage contenant les colonnes :
### voyageid,yearam,ptdepimp,shipname
voy2 <- voyages %>%
  select(voyageid,yearam,ptdepimp,shipname)
head(voy2, n = 5L)
tail(voy2, n = 5L)

colnames(voyages)
which(colnames(voyages) == "voyageid")
which(colnames(voyages) == "ptdepimp")
which(colnames(voyages) == "yearam")
which(colnames(voyages) == "shipname")


voy2b <- voyages %>%
  select(1,yearam,33,shipname)
head(voy2b, n = 5L)
tail(voy2b, n = 5L)
### C'est bon ca fonctionne 
head(voy2)==head(voy2b)
tail(voy2)==tail(voy2b)



######################################################################
### Créez un tableau de données comportant les colonnes suivantes : id d’expédition, nom du navire , armateurs et capitaines
## Cette fois ci, il y a plusieurs armateurs et plusieurs capitaines possibles
which(colnames(voyages)=="voyageid")
which(colnames(voyages)=="shipname")
## Quelles sont les colonnes qui commencent par "owner" ?
V <- grep("^owner",colnames(voyages));V
## Quels sont les noms des colonnes qui commencent par owner
colnames(voyages[V]);V
X <- grep("^captain",colnames(voyages));X
colnames(voyages[X])

voy3 <- voyages %>%
  select(1,2, ownera:ownerp ,captaina:captainc)
head(voy3, n = 10L)

######################################################################
### Réagencez les colonnes de votre tableau voyages2 selon l’ordre de colonnes suivant : 
### 1. id d’expédition ; 2. nom du navire ; 3. port de départ ; 4. année d’arrivée au port de débarquement des esclaves.
colnames(voy2)
which(colnames(voy2)=="voyageid")
which(colnames(voy2)=="shipname")
which(colnames(voy2)=="ptdepimp")
which(colnames(voy2)=="yearam")

voy4 <- voy2 %>%
  select(1,4,3,2)

voy4b <- voy2 %>%
  select(voyageid,shipname,ptdepimp,yearam)

colnames(voy2)
colnames(voy4)
colnames(voy4b)

head(voy4, n = 10L)
head(voy4b, n = 10L)

remove(voy2,voy2b,voy3,voy4,voy4b,voyages,V,vec,X)
