
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def display():
    message = "Hello, this is your display page!"
    return render_template('display.html', message=message)

if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)
