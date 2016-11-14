library(shiny)
shinyServer(function(input, output) {
    output$mon_resultat_stat <- renderText({
        tweets_bigdata <- searchTwitter("#BigData", n = 50)
        tweets_bigdata_df <- twListToDF(tweets_bigdata)
        ma_valeur <- dim(tweets_bigdata_df)[1]
        paste0("Voici le nombre de tweets récupérés : ", ma_valeur," Pour le Hashtag #BigData, passé en statique")
    })
    output$mon_resultat_dyna <- renderText({
      tweets <- searchTwitter(input$mes_hashtags, n = 20) # valeur sélectionnée
      tweets_df <- twListToDF(tweets)
      ma_valeur_dyna <- dim(tweets_df)[1]
      paste0("Voici le hashtag utilisé : ", input$mes_hashtags, " et voici le nombre de tweets récupérés : ", ma_valeur_dyna," pour le Hashtag passé en dynamique") # valeur sélectionnée 
      
    }
)
}
)
