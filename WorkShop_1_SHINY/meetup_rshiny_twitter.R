print("CODELAB Shiny")
setwd("~/Desktop/DIVERS_TEMPLATES/MEETUP/R/RSHINY")
library(shiny)
library(twitteR)
setup_twitter_oauth(consumer_key = "1kWUtAN0bpa5LMSvhomN4mh3w",consumer_secret = "2bMP8x4EQ5Oqo8duOTEAExOxYyMk4ym7GETgglqFB9L0da857z",access_token = "735089363026083840-Rf8bSQq0WJV3T9SzwIZtaRIaSM0eiKi",access_secret = "VguK4fpTlOfhnLI726FrW7sB3H1ccnGLqB02Hh95Hl17K")
##Définition d'une liste tweets permettant de stocker 20 éléments contenant le hashtag "#DataScience"
tweets <- searchTwitter("#DataScience", n = 20)
##Transtypage de la liste en Dataframe
tweets_df <- twListToDF(tweets)
dim(tweets_df)[1]
View(tweets_df)
##Ma version BigData: 
###Recherche de 50 Tweets contenant le #BigData, de langue française, écris entre le 01/01/16 
tweets_BD <- searchTwitter("#BigData", n = 50, lang = "fr",since ="2016-11-01",until = "2016-11-14",resultType = "mixed")
tweets_BD_df <- twListToDF(tweets_BD)
dim(tweets_BD_df)[1]
View(tweets_BD_df)
##Ma version Machine Learning 
tweets_ML <- searchTwitter("#BigData", n = 35, lang = "en",since ="2016-11-01",until = "2016-11-14",resultType = "popular")
tweets_ML_df <- twListToDF(tweets_ML)
dim(tweets_ML_df)[1]
View(tweets_ML_df)
##Ma version PVeckevent.
tweets_PV <- searchTwitter("#hello", n = 10, lang = "fr",since ="2016-01-01",until = "2016-11-14",resultType = "recent")
### ?searchTwitter ### Décommenter si besoin 
###----------------------
##Pour récupérer les tweets d'un compte en particulier (Cas pour @PVeckevent): 
tweets_PV <- userTimeline("PVeckevent", n = 20)
tweets_PV_df <- twListToDF(tweets_PV)
dim(tweets_PV_df)
View(tweets_PV_df)
##Pour récupérer les tweets d'un compte en particulier (Cas pour @TechCrunch): 
tweets_TC <- userTimeline("TechCrunch", n = 30)
tweets_TC_df <- twListToDF(tweets_TC)
dim(tweets_TC_df)
View(tweets_TC_df)
##Récupérer les tendances de Twitter 
a_trends = availableTrendLocations()
head(a_trends)
a_trends[which(a_trends$country == "France"), ]
trends_nantes <- getTrends(woeid = 613858)
View(trends_nantes)
###ANALYSER LA LIBRAIRIE DES FONCTIONS DE TWITTER

