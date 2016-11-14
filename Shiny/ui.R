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