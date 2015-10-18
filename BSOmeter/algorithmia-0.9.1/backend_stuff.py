import Algorithmia

# 1.1 URL to text
# retrieves text file from URL
# Str -> Str
input = "your-URL-here"
client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
algo = client.algo('util/ExtractText/0.1.0')
doc = algo.pipe(input)


# 1.2 Sentence detection
# breaks down contents from 1.2
# Str -> listof Str
input = doc
client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
algo = client.algo('ApacheOpenNLP/SentenceDetection/0.1.0')
sentences = algo.pipe(input)


# 1.3 LDA - Tags and keywords
# input: a list of string observations, and number of topics to generate
# (listof Str) Num -> listof Str
#input = [sentences,5]
#client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
#algo = client.algo('mallet/LDA/0.1.2')
#keywords = algo.pipe(input)[0].keys()


# 1.4 Sentiment Analysis
# takes a string and gives a sentiment score
# 0-4: very negative, negative, neutral, positive, very positive
wholething = []
for phrase in sentences:
    input = phrase
    client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
    algo = client.algo('nlp/SentimentAnalysis/0.1.1')
    sentiment = algo.pipe(input)
    wholething = wholething + [sentiment]
average = sum(wholething)/len(wholething)