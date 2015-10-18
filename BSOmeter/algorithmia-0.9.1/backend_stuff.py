import Algorithmia

apiKey = 'simfMcTKIsg3/P+fl/1ENYWrnQd1'

print Algorithmia.client(apiKey).algo('util/echo').pipe('echo this string')

## Analysis Template