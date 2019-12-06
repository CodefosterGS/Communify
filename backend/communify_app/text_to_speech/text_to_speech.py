from flask import Flask, redirect, url_for, request 
import pyttsx3 
app = Flask(__name__) 

converter = pyttsx3.init() 
converter.setProperty('rate', 150) 
converter.setProperty('volume', 0.7) 

@app.route('/success/<name>') 
def success(name): 
    converter.say(name)
    converter.runAndWait()
    return "welcome"

@app.route('/login',methods = ['POST', 'GET']) 
def login(): 
    if request.method == 'POST': 
	    user = request.form['nm'] 
	    return redirect(url_for('success',name = user)) 
    else: 
	    user = request.args.get('nm') 
	    return redirect(url_for('success',name = user)) 

if __name__ == '__main__': 
    app.run(debug = True) 
