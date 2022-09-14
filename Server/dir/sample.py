import requests

url = "http://192.168.1.25:5000/g_code"
files = {'media': open('th.jpg', 'rb')}
value  = requests.post(url, files=files)
print(value.content)