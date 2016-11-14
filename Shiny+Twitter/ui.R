setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/RSHINY/Shiny")
library(shiny)
shinyUI(
  fluidPage(
    titlePanel("Hello Shiny !"),
    
    sidebarLayout(
      sidebarPanel("Passage d'un #tag dynamique",
          selectInput(inputId = "mes_hashtags",
                  label = "Sélectionner un hashtag",
                      choices = list("#BigData" = "#BigData",
                                     "#DataScience" = "#DataScience",
                                      "#MachineLearning" = "#MachineLearning"),
                      selected = 1)
      ),
      mainPanel(
        h2("Passage d'un #tag statique"),
        textOutput("mon_resultat_stat"),
        textOutput("mon_resultat_dyna")
      )
    )
  )
)

##runApp("ui.R", display.mode = "showcase")

