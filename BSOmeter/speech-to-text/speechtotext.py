import pyaudio
import speech_recognition as sr

# obtain audio from the microphone
r = sr.Recognizer()
with sr.Microphone() as source:
    print("Say something!")
    audio = r.listen(source)

# recognize speech using Google Speech Recognition
try:
    # for testing purposes, we're just using the default API key
    # to use another API key, use `r.recognize_google(audio, key="GOOGLE_SPEECH_RECOGNITION_API_KEY")`
    # instead of `r.recognize_google(audio)`
    print("Google Speech Recognition thinks you said " + r.recognize_google(audio))
except sr.UnknownValueError:
    print("Google Speech Recognition could not understand audio")
except sr.RequestError as e:
    print("Could not request results from Google Speech Recognition service; {0}".format(e))

# recognize speech using Wit.ai
WIT_AI_KEY = "EEK5357AA63JBFVUZOISXFKA2UEYJKXY" # Wit.ai keys are 32-character uppercase alphanumeric strings
try:
    print("Wit.ai thinks you said " + r.recognize_wit(audio, key=WIT_AI_KEY))
except sr.UnknownValueError:
    print("Wit.ai could not understand audio")
except sr.RequestError as e:
    print("Could not request results from Wit.ai service; {0}".format(e))

# recognize speech using IBM Speech to Text
#{
    #"speech_to_text": [
        #{
            #"name": "Speech To Text-r5",
            #"label": "speech_to_text",
            #"plan": "standard",
            #"credentials": {
                #"url": "https://stream.watsonplatform.net/speech-to-text/api",
                #"username": "2350af39-12f7-4223-b3d1-54e2ed14fa50",
                #"password": "Kii2IiNEBcx6"
            #}
        #}
    #]
#}
IBM_USERNAME = "2350af39-12f7-4223-b3d1-54e2ed14fa50" # IBM Speech to Text usernames are strings of the form XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
IBM_PASSWORD = "Kii2IiNEBcx6" # IBM Speech to Text passwords are mixed-case alphanumeric strings
try:
    print("IBM Speech to Text thinks you said " + r.recognize_ibm(audio, username=IBM_USERNAME, password=IBM_PASSWORD))
except sr.UnknownValueError:
    print("IBM Speech to Text could not understand audio")
except sr.RequestError as e:
    print("Could not request results from IBM Speech to Text service; {0}".format(e))

# recognize speech using AT&T Speech to Text
#ATT_APP_KEY = "INSERT AT&T SPEECH TO TEXT APP KEY HERE" # AT&T Speech to Text app keys are 32-character lowercase alphanumeric strings
#ATT_APP_SECRET = "INSERT AT&T SPEECH TO TEXT APP SECRET HERE" # AT&T Speech to Text app secrets are 32-character lowercase alphanumeric strings
#try:
    #print("AT&T Speech to Text thinks you said " + r.recognize_att(audio, app_key=ATT_APP_KEY, app_secret=ATT_APP_SECRET))
#except sr.UnknownValueError:
    #print("AT&T Speech to Text could not understand audio")
#except sr.RequestError as e:
    #print("Could not request results from AT&T Speech to Text service; {0}".format(e))