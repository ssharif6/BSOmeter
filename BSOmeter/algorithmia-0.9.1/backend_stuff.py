import Algorithmia
import urllib
import urllib2
import json


# 1.1 URL to text
# retrieves text file from URL
# Str -> Str
input = "your URL here"
client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
algo = client.algo('util/ExtractText/0.1.0')
doc = algo.pipe(input)


# 1.2 Summarizer
# summarizes info from 1.1
# Str -> Str
input = doc
client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
algo = client.algo('nlp/Summarizer/0.1.2')
summarized = algo.pipe(input)


# 1.3 Sentence detection
# breaks down contents from 1.2
# Str -> listof Str
input = summarized
client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
algo = client.algo('ApacheOpenNLP/SentenceDetection/0.1.0')
sentences = algo.pipe(input)


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
average = float(sum(wholething))/len(wholething)
    

# 1.5 Keyword extraction
# takes a string and gives a list of keywords and their relevance; number of keywords needs to be specified
# (listof (listof String)) Num -> (listof (dictof String float))
input = [sentences,5]
client = Algorithmia.client('sim3tFLM5ifuipLRxUc4Zplr6ne1')
algo = client.algo('nlp/KeywordsForDocumentSet/0.1.7')
keywords = algo.pipe(input)
just_the_words = keywords[0].keys()

    
# 2.1 Google search
#-----THIS SEARCH WILL ONLY RETURN THE TOP FOUR SEARCH RESULTS
all_words = ""
for word in just_the_words:
    all_words = all_words + word

url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&"
query = all_words
query = urllib.urlencode({'q':query})
response = urllib2.urlopen(url+query).read()
data = json.loads(response)
results = data['responseData']['results']
all_titles = []
all_urls = []
for result in results:
    title = result['title']
    url=result['url']
    all_titles = all_titles + [title]
    all_urls = all_urls + [site]
    
# 2.2 Text extraction from search results
for url in all_urls:
    input = url
    client = Algorithmia.client('simfMcTKIsg3/P+fl/1ENYWrnQd1')
    algo = client.algo('util/ExtractText/0.1.0')
    extracted_text = algo.pipe(input)