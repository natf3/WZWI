library(tm);
library(memoise);
library(tidyRSS);
library(httr);
library(XML);
library(wordcloud2);
library(stringi);
library(solrium);
library(pdftools);
library(stringr);
library(tabulizer);
library(tidyRSS);
library(magick);
library(tesseract);
library(xml2);
library(httr);
library(jsonlite);


function(input, output){
  polaczenie <- SolrClient$new(host="127.0.0.1", port = 8983, path="/solr/rdzen2/select");
  
  dane <- data.frame(matrix(ncol=1, nrow=18));
  colnames(dane)[1]<-"content";
  for(i in 1:18)
  {
    
    tytul<-paste("http://ceur-ws.org/Vol-2240/paper",i,".pdf", sep ="");
    tekst<-pdf_text(pdf=tytul);
    tekst2<-str_replace_all(tekst, pattern="[\r\n]", replacement = " ");
    tekst3<-str_squish(tekst2);
    dane$content<-c(tekst3)[i];
  }
  
  solrium::add(x=dane, conn=polaczenie, name="rdzen2");

  baza<-solr_search(conn=polaczenie, params=list(q="*:*", rows=-1));

  dane<-Corpus(VectorSource(stri_enc_toutf8(baza)));
  dane<-tm_map(dane, removePunctuation);
  dane<-tm_map(dane, removeNumbers);
  dane<-tm_map(dane, removeWords, stop);
  
  usun.znaki<-function(x) gsub("[–”„>]", "", x);
  dane<-tm_map(dane, usun.znaki);
  
  for (i in 1:length(dane)) {
    dane[[i]]$content<-stri_enc_toutf8(dane[[i]]$content);

  }


  tdml<-TermDocumentMatrix(dane);
  m1<-as.matrix(tdml);
  v<-sort(rowSums(m1), decreasing = TRUE);
  d<-data.frame(words=names(v), freq=v);

  output$cloud<- renderWordcloud2({

    wordcloud2(d, size=input$size, shape = input$selection, minSize = input$freq);
  })


}