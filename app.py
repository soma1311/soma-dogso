from flask import Flask, render_template, request
import requests

app = Flask(__name__)

# Dog API endpoint
DOG_API_URL = "https://dog.ceo/api/breeds/image/random"

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/get_dog_image", methods=["POST"])
def get_dog_image():
    response = requests.get(DOG_API_URL)
    if response.status_code == 200:
        dog_image_url = response.json()["message"]
        return render_template("index.html", dog_image_url=dog_image_url)
    return "Failed to fetch dog image", 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
