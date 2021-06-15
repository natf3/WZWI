library(tm);
library(memoise);
library(tidyRSS);
library(httr);
library(XML);
library(wordcloud2);
library(stringi);
library(solrium);

shapes<<- list("Kolo" = "circle",
              "Diament"= "diamond",
              "Pieciokat" = "pentagon",
              "Gwiazda"="star",
              "Trójkat" = "triangle");

stop<-as.vector(unlist(read.csv("stopwords_en.txt", header = FALSE, sep = "\n", fileEncoding = "UTF-8")));




