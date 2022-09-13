import requests

url = "http://127.0.0.1:5000/g_code"
files = {'media': open('th.jpg', 'rb')}
value  = requests.post(url, files=files)
print(value.content)