import Algorithmia

apiKey = '***REMOVED***'

print Algorithmia.client(apiKey).algo('util/echo').pipe('echo this string')

## Analysis Template