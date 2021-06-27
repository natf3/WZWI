# Wybrane Zagadnienia Współczesnej Informatyki  
  
Aplikacja webowa do akwizycji i analizy danych z artykułów z konferencji Concurrency, Specification and Programming 2018 umieszczonych na portalu ceur-ws.org  
  
1. Zakres projektu  
  
Celem projektu było stworzenie aplikacji webowej z wykorzystaniem pakietu Shiny, która będzie umożliwiała realizację poniższych funkcjonalności:  
    • pobranie i zapisanie dokumentów z konferencji Concurrency, Specification and Programming 2018 z portalu ceur-ws.org w Apache Solr,  
    • wizualizację chmury słów występujących w tych dokumentach z opcją modyfikowania częstości ich występowania.  
  
2. Charakterystyka analizowanych danych  
  
Wykorzystane dane są artykułami zaprezentowanymi na 27 edycji konferencji Concurrency, Specification and Programming w 2018 roku w Berlinie. Wydarzenie organizowane jest na przemian przez Uniwersytet Warszawski i Uniwersytet Humboldta. Omawiane publikacje zajmują się formalną specyfikacją systemów współbieżnych i równoległych, modelami matematycznymi do opisu takich systemów oraz koncepcjami programowania i weryfikacji ich implementacji.  
	Artykuły umieszczone są na stronie w formacie PDF. Za pomocą pętli ze wszystkich podanych plików wyodrębniany jest tekst, a następnie modyfikowany. Uzyskane dane zapisywane są w Solr. i ponownie pobierane. Usuwane są liczby, znaki interpunkcyjne oraz odrzucone słowa, tzw. „stop words”.  
  
3. Wykorzystane narzędzia.  
  
Aplikacja została napisana w języku R z wykorzystaniem RStudio oraz platformy Apache Solr.  
  
R - jest jednocześnie językiem programowania, środowiskiem obliczeniowym oraz graficznym. Służy m.in. do obliczeń statystycznych, prezentowania danych,  tworzenia ciekawych wizualizacji. Znalazł zastosowanie w dziedzinach jak analiza danych, statystyka, data science czy big data.  Język R powstał w oparciu o język S, opracowany w laboratoriach Bell’a. Platforma jest rozwijana jako projekt GNU na licencji GNU GPL. Język jest szeroko i przejrzyście udokumentowany. 
Aplikacja powstała przy użyciu dostępnego w R pakietu Shiny. Pozwala na tworzenie interaktywnych aplikacji internetowych. Użytkownicy aplikacji mogą poprzez stronę HTML wybierać parametry przetwarzania. Przetwarzanie danych i parametrów ma miejsce na serwerze, a jego wynik jest przedstawiany ponownie na stronie internetowej. 
  
RStudio – to zintegrowane środowisko programistyczne (IDE) ułatwiające pracę z językiem R. Jest to edytor, manager wersji, narzędzie wspierające debugowanie, tworzenie pakietów, aplikacji czy raportów. 
  
Apache Solr -  jest to platforma do wyszukiwania pełnotekstowego, rozwijana na bazie licencji open source. Pozwala np. po zaindeksowaniu zestawu danych, przy użyciu zapytania, przeszukać całą bazę i dobrać odpowiednie dla wyszukiwanej frazy informacje. Posiada bardzo wiele możliwych do przeszukania plików.
  
4. Architektura i implementacja aplikacji.  
  
Na aplikację składają się trzy główne pliki: ui.R, server.R oraz global.R. W pliku ui.R określony jest interfejs użytkownika, zawarte są takie elementy widoczne jak: widok chmury,  pole wyboru, określające jej kształt, suwak do wyboru jej rozmiaru oraz suwak do wyboru częstości występowania słów. W pliku server.R umieszczone jest pobieranie artykułów ze stron, połączenie z Apache Solr oraz funkcje wyznaczające wartości elementów wyjściowych. Ostatni wymieniony plik zawiera listę dostępnych kształtów chmury oraz zdefiniowane stop words.  
  
5. Interfejs użytkownika.  
  
Użytkownik ma możliwość ustawiania parametrów takich jak: kształt, rozmiar chmury oraz minimalną częstotliwość występowania słowa. 
