from flask import Flask 
app = Flask(__name__) 
  
@app.route('/') 
def hello(): 
    return "welcome to my first API server using Python in Docker-VRIT"

@app.route('/api') 
def api(): 
    return '{"name":"SHYAM"}'
  
if __name__ == "__main__": 
    app.run(host ='0.0.0.0', port = 5001, debug = True)  