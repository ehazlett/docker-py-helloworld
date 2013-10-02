from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return "Hello World from Flask"

if __name__=='__main__':
    app.run()
