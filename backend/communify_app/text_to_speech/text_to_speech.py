import pyttsx3 

converter = pyttsx3.init() 

def adjustSpeed():
    converter.setProperty('rate', 150) 

def adjustVolume():
    converter.setProperty('volume', 0.7) 

def say():
    converter.say(input) 
 
converter.runAndWait()


