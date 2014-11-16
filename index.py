from flask import Flask
from flask import render_template, url_for, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
  return render_template('index.html')

@app.route('/url', methods=['POST'])
def getUrl():
  url = request.form['url']


  facebookCount = getFacebookShareCount(url)
  twitterCount  = getTwitterShareCount(url)
  redditCount   = getRedditShareCount(url)
  return render_template('index.html', facebookCount=facebookCount, twitterCount=twitterCount, redditCount=redditCount)

def getFacebookShareCount(url):
  r = requests.get('https://api.facebook.com/method/links.getStats?urls=' + url + '&format=json')
  if len(r.json()) == 0:
    return "Not Support!"
  else:
    return r.json()[0]["share_count"]

def getTwitterShareCount(url):
  r = requests.get('http://urls.api.twitter.com/1/urls/count.json?url=' + url + '')
  return r.json()["count"]

def getRedditShareCount(url):
  r = requests.get('http://buttons.reddit.com/button_info.json?url=' + url)


  if len(r.json()["data"]["children"]) == 0:
    return "Not Support!"
  else:
    return r.json()["data"]["children"][0]["data"]["score"]


if __name__ == '__main__':
    app.run(debug=True)