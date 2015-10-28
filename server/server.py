import sys
import Algorithmia
import tornado.web
import tornado.ioloop
import tornado.httpserver

class TextInputHandler(tornado.web.RequestHandler):
    def post(self):
        intext = self.get_argument('speech')
        isaddress = False
        if 'http' in intext[:4]:
            isaddress = True
        self.response = {
                'input' : intext,
                'extracted' : "INFO_STATUS:not an address",
                'summarized' : None,
                'detected' : None,
                'analyzed' : None
                }
        self.client = Algorithmia.client('')
        if not isaddress:
            self.summarizeText(intext)
            self.detectSentences(self.response['summarized'])
            self.analyze(self.response['detected'])
        else:
            self.extractText(intext)
            self.summarizeText(self.response['extracted'])
            self.detectSentences(self.response['summarized'])
            self.analyze(self.response['detected'])
        self.write(self.response)

    def extractText(self, intext):
        algo = self.client.algo('util/ExtractText/0.1.0')
        resp = algo.pipe(intext)
        self.response['extracted'] = resp
        return resp

    def summarizeText(self, intext):
        # 1.2 Summarizer
        # summarizes info from 1.1
        # Str -> Str
        algo = self.client.algo('nlp/Summarizer/0.1.2')
        resp = algo.pipe(intext)
        self.response['summarized'] = resp
        return resp

    def detectSentences(self, intext):
        # 1.3 Sentence detection
        # breaks down contents from 1.2
        # Str -> listof Str
        algo = self.client.algo('ApacheOpenNLP/SentenceDetection/0.1.0')
        resp = algo.pipe(intext)
        self.response['detected'] = resp
        return resp

    def analyze(self, intext):
        # 1.4 Sentiment Analysis
        # takes a string and gives a sentiment score
        # 0-4: very negative, negative, neutral, positive, very positive
        wholething = []
        for phrase in intext:
            algo = self.client.algo('nlp/SentimentAnalysis/0.1.1')
            sentiment = algo.pipe(phrase)
            wholething = wholething + [sentiment]
        average = float(sum(wholething))/len(wholething)
        self.response['analyzed'] = average
        return average

class BSOmeter(tornado.web.Application):
    def __init__(self, **overrides):
        handlers = [
                    (r'/textinput', TextInputHandler)
                ]
        settings = {
                    'debug' : True,
                }
        tornado.web.Application.__init__(self, handlers, **settings)

if __name__ == '__main__':
    s = tornado.httpserver.HTTPServer(BSOmeter())
    s.listen(8080, 'localhost')
    try:
        print "Starting"
        tornado.ioloop.IOLoop.instance().start()
    except KeyboardInterrupt:
        sys.exit(0)


