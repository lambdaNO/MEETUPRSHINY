setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/RSHINY/Shiny")
library(shiny)
shinyServer(function(input, output) {
  output$mon_resultat <- renderText(
    {
      ma_valeur <- sample(1:9,1)
      paste0("Voici le nombre généré aléatoirement : ", ma_valeur)
    }
  )
})

##Pour executer l'application, Cliquer en haut de la console sur "run App"