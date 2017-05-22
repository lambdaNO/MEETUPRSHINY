setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/RSHINY/Shiny")
library(shiny)
shinyUI(
    fluidPage(
      titlePanel("Hello Shiny !"),
      
      sidebarLayout(
        sidebarPanel("Barre latérale"),
        mainPanel(
          h2("Zone principale"),
          textOutput("mon_resultat")
        )
      )
    )
)

##runApp("ui.R", display.mode = "showcase")

