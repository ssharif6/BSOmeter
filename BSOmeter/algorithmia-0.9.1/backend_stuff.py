import Algorithmia

# 1.1 URL to text
# retrieves text file from URL
# Str -> Str
input = "http://www.cnn.com/2015/10/18/politics/donald-trump-jeb-bush-foreign-policy/index.html"
client = Algorithmia.client('***REMOVED***')
algo = client.algo('util/ExtractText/0.1.0')
doc = algo.pipe(input)


# 1.2 Summarizer
# summarizes info from 1.1
# Str -> Str
input = doc
client = Algorithmia.client('***REMOVED***')
algo = client.algo('nlp/Summarizer/0.1.2')
summarized = algo.pipe(input)


# 1.3 Sentence detection
# breaks down contents from 1.2
# Str -> listof Str
input = summarized
client = Algorithmia.client('***REMOVED***')
algo = client.algo('ApacheOpenNLP/SentenceDetection/0.1.0')
sentences = algo.pipe(input)


# 1.4 Sentiment Analysis
# takes a string and gives a sentiment score
# 0-4: very negative, negative, neutral, positive, very positive
wholething = []
for phrase in sentences:
    input = phrase
    client = Algorithmia.client('***REMOVED***')
    algo = client.algo('nlp/SentimentAnalysis/0.1.1')
    sentiment = algo.pipe(input)
    wholething = wholething + [sentiment]
average = float(sum(wholething))/len(wholething)