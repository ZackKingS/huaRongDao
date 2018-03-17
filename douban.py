import requests
from lxml import html
url='https://movie.douban.com/' 
page=requests.Session().get(url) 
tree=html.fromstring(page.text) 
result=tree.xpath('//td[@class="title"]//a/text()') 

