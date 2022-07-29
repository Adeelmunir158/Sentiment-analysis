install.packages("stringr")
library(stringr)
require(readtext)
require(rJava)





s=readLines("speech.txt")
s
tolower(s)
s=paste(s, collapse = " ")
s

require(tm)

stopwords()
sort(stopwords())

s=removeWords(s, stopwords())
s

library(qdapDictionaries)
t=Top200Words
t
s=removeWords(s, "ji")
s

l=c("also","ji","like")


s=removeWords(s, "l")
s
s=removeWords(t)

s=removeWords(s,"t")
s
s=gsub(pattern = "\\W", replacement = " ", s)
s

s=gsub(pattern = "\\d", replacement = " ", s)
s

s=gsub(pattern = "\\b[a-z]\\b{1}", replacement = " ", s)
s

s=stripWhitespace(s)
s

library(stringr)
s=str_split(s, pattern = " ")
s
xx=unlist(s)
xx
# List of positive words

pos=readLines("List of positive words.txt")
pos
pos=tolower(pos)
pos

p=str_split(pos, pattern = " ")
pp=unlist(p)
pp


# Match function
m=match(xx,pp)
m

sum(!is.na(m))
#Packages for handling Individual files



remotes::install_github("wrathematics/meanr")
require(meanr)

install.packages("RSentiment")
require(RSentiment)
install.packages("sentimentr")
require(sentimentr)



#Package for handling Multiple files
install.packages("syuzhet")
require(syuzhet)

#Package for handling Corpus
install.packages("SentimentAnalysis")
require(SentimentAnalysis)

#Package for handling Twitter data
#require(saotd)




#===================================================
#-------------Importing & Cleaning Data------------
#===================================================
x=readLines(file.choose())
x

xx=paste(x, collapse = "")
xx=tolower(xx)
xx

#x is original file
#xx is combined file


#===================================================
#-----------Working on Individual Files-------------
#----------------Package:meanr----------------------
#===================================================
meanr::score(x)
meanr::score(xx)

m=score(x)
sum(m$positive)
sum(m$negative)
sum(m$score)
#===================================================
#-------------Package:RSentiment--------------------
#===================================================

#0 indicates neutral sentiment. 
#Positive value indicates positive sentiment. 
#Negative value indicates negative sentiment.
#99 indicates sarcasm. 

#Calculate score in every sentence
calculate_score(x)

#Get summary of sentiments for
calculate_sentiment(x)
b1=calculate_sentiment(x)
summary(b1$sentiment)

b2=calculate_total_presence_sentiment(x)
b2


#===================================================
#--------------Package:sentimentr--------------------
#===================================================
x=readLines(file.choose())
x

xx=paste(x, collapse = "")
xx=tolower(xx)
xx

sentiment(x)
n=sentiment(x)
round(n[n$sentiment>0],2)
nn=round(n[n$sentiment>0],3)
nn[61:100]

sentiment_by(x)
b3=sentiment_by(x)
b3[b3$ave_sentiment>0]
round(b3[b3$ave_sentiment>0],3)

extract_sentiment_terms(x)
b4=extract_sentiment_terms(x)
b4[1:100]













#===================================================
#-----------Working on Multiple Files----------------
#------------------Package:syuzhet--------------------
#===================================================

#Dictionary
install.packages("syuzhet")
require(syuzhet)

get_sentiment_dictionary()

#Check Sentiment of Individual words
get_sent_values("wow")
get_sent_values("bully")
get_sent_values("drunk")
get_sent_values("awesome")
get_sent_values("damn")

#Check Sentiment of Individual words for 9 emotions
words=c('love','hate', 'agree','damn')

get_nrc_sentiment(words)


#-------------------------------------------------
#Import Text file
x=readLines(file.choose())
x
#Sentiment without text cleaning
get_sentiment(x)
get_nrc_sentiment(x)

#-------------------------------------------------
#Convert text to Individual words i.e. tokens
xx=get_tokens(x)
xx

#Sentiment for individual words

get_nrc_sentiment(xx)
sum(get_sentiment(xx))

#-------------------------------------------------
#Import Multiple Files

folder='MankiBaat'
list.files(folder)
files=list.files(folder)
all=paste(folder, "\\", files, sep="")
all
text=lapply(all, FUN=readLines)
t=lapply(text,FUN=paste, collapse="")
t

get_sentiment(unlist(t))
get_nrc_sentiment(unlist(t))


#===================================================
#-----------Sentiment Analysis on Corpus------------
#-----------Package:SentimentAnalysis---------------
#===================================================

#Harvard-IV dictionary 
#as used in the General Inquirer software
data(DictionaryGI)
summary(DictionaryGI)

# Henry's Financial dictionary
#This dictionary was first presented 
#in the Journal of Business Communication
data(DictionaryHE)
summary(DictionaryHE)

#Loughran-McDonald Financial dictionary
#first presented in the Journal of Finance
data(DictionaryLM)
summary(DictionaryLM)


#-------------------------------------------------
#Working on Individual File
x=readLines(file.choose())
analyzeSentiment(x)

b=analyzeSentiment(x)
bb=subset(b, b$WordCount>0)
bb
round(bb,2)

#Just counting the words
countWords(x, removeStopwords = F)


#-------------------------------------------------
#Working on Multiple Files

folder='MankiBaat'
list.files(folder)
files=list.files(folder)
all=paste(folder, "\\", files, sep="")
text=lapply(all, FUN=readLines)
t=lapply(text,FUN=paste, collapse="")


analyzeSentiment(unlist(t))


c=VCorpus(VectorSource(t))
analyzeSentiment(c)



#===================================================
#-----------------Counting the words----------------
#===================================================
qdap::word_count(x, digit.remove = T)

b=countWords(x, removeStopwords = T)
b$WordCount[b$WordCount > 0]
