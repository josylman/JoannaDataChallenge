https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/

install.packages('rvest')
#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scrapped

url <- 'https://www.onthesnow.com/united-states/lift-tickets.html'


#Reading the HTML code from the website
webpage <- read_html(url)

#Using CSS selectors to scrap the rankings section
price_data_html <- html_nodes(webpage,'.rLeft:nth-child(3) b')

#Converting the ranking data to text
price_data <- html_text(price_data_html)
price_data <- gsub("US$ ", "",  price_data, fixed = TRUE)
price_data <- as.numeric(price_data)
#Let's have a look at the rankings
head(price_data)

hist(price_data, breaks = 50)


#Using CSS selectors to scrap the title section
title_data_html <- html_nodes(webpage,'.name a')

#Converting the title data to text
title_data <- html_text(title_data_html)
ResortName <- gsub(" ", "-",  title_data, fixed = TRUE)
ResortName <- tolower(ResortName)
ski_df<-data.frame(Price = price_data, ResortName = ResortName)


Ski <- read.csv("skiResort.csv", stringsAsFactors = F)

merge <- inner_join(Ski, )

#Let's have a look at the title
head(title_data)


