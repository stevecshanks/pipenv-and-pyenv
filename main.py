from flask import Flask


app = Flask(__name__)

@app.route("/hello/<name>")
def hello_world(name):
    return {"message": f"Hello, {name.title()}!"}
