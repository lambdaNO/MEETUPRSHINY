setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/RSHINY/Shiny")
library(shiny)
shinyUI(fluidPage(
  # Titre général de l'application Shiny
  titlePanel("Hello Shiny !"),
  sidebarLayout(
    # Barre latérale : va contenir les éléments de contrôle / gestion des paramètres
    sidebarPanel("Barre latérale"),
    # Zone principale : va contenir les résultats / sorties, générés via la partie "server"
    mainPanel(h2("Zone principale"))
    
  )
))
##Pour executer l'application, Cliquer en haut de la console sur "run App"




###Un ensemble d’applications Shiny de démo sont chargées par défaut avec le package. Elles contiennent 
##également le code permettant de les recréer.
##runExample("01_hello")
##runExample("02_text")
##runExample("03_reactivity")
##[]
##->11

runApp("ui.R", display.mode = "showcase")


