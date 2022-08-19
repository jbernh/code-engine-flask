from flask import Flask, send_file
import glob
import random

app = Flask(__name__)

@app.route('/')
def show_random():
    files = glob.glob('./static/img/*')
    choice = random.choice(files)
    return send_file(choice, mimetype="image/jpeg")

if __name__ == '__main__':
    app.run()
