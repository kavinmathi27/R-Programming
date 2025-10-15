# Install required packages (run only once)
install.packages(c("tm", "wordcloud", "ggplot2", "RColorBrewer"))

# Load libraries
library(tm)
library(wordcloud)
library(ggplot2)
library(RColorBrewer)

# Set working directory
setwd("C:\\Users\\ECE-LAB\\Downloads")
getwd()

# Load data
data <- read.csv("yourfile.csv", stringsAsFactors = TRUE)

# Create corpus
corpus <- Corpus(VectorSource(data$text))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)

# Create Term-Document Matrix
tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)

# Calculate word frequencies
word_freq <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(word_freq), freq = word_freq)

# Plot top 10 frequent words using ggplot2
ggplot(df[1:10, ], aes(x = reorder(word, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 10 Most Frequent Words", x = "Word", y = "Frequency")

# Generate word cloud
set.seed(123)
wordcloud(words = df$word, freq = df$freq, min.freq = 2,
          max.words = 100, random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))