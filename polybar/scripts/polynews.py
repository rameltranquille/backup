#!/usr/bin/python

import requests
import os.path

#path to polynews script

save_path = '/home/ramel/.config/polybar/scripts/'

#get your api key at https://newsapi.org/

api_key = "db21f197c22b4f558876af0d89fc980b"

#find sources & country codes at https://newsapi.org/sources

sources = "reuters, associated-press"
country = ""

try:
    data = requests.get('https://newsapi.org/v2/top-headlines?apiKey='+api_key+'&sources='+sources+'&country='+country).json()

    sourceName = data['articles'][0]['source']['name']
    title = data['articles'][0]['title']
    url = data['articles'][0]['url']

    print(sourceName+': '+title)

    path = os.path.join(save_path,"current_url.txt")         
    f = open(path, "w")
    f.write(url)
    f.close()
    
 
except requests.exceptions.RequestException as e:
    print ('Something went wrong!')

