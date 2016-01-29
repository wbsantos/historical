# coding=utf-8
import sys
import scrapy
import mysql.connector
import unicodedata
from anbient.items import AnbientItem
from scrapy.http import Request

class AnbientSpider(scrapy.Spider):
	name = "anbientList"
	allowed_domains = ["anbient.net"]
	start_urls = [ "http://www.anbient.net/lista" ]
	domain = 'http://www.anbient.net'
	
	def parse(self, response):
		x = 0
		for sel in response.xpath('//td[@class="views-field views-field-title active"]'):
			x += 1
	
			title = sel.xpath('a/text()').extract()[0]
			url = 'http://www.anbient.net' + sel.xpath('a/@href').extract()[0]
			
			#cnx = mysql.connector.connect(host = 'localhost', user='root', passwd='root', database='spider')
			#cursor = cnx.cursor()
			#cursor.execute("SELECT COUNT(1) FROM anbientanime WHERE url = %s", [url])
			
			#if cursor.fetchone()[0]:
			#	cursor.close()
			#	cnx.close()
			#	continue
			
			#add_anbient = ("INSERT INTO AnbientUrls (title, url) VALUES (%s, %s);")
			#data_anime = [title, url ]               		
			#cursor.execute(add_anbient, data_anime)
			#cnx.commit()				
			#cursor.close()
			#cnx.close()	
			yield Request(url, callback=self.parseItem)			
		
	def parseItem(self, response):
			item = AnbientItem()
			
			try:
				title = response.xpath('//h2[@class="title"]/a/text()').extract()
				if(len(title) == 0):
					item['error'] = response.xpath('//div[@id="content-area"]/text()').extract()[0]
					return
				item['title'] = title[0]
				item['url'] = self.domain + response.xpath('//h2[@class="title"]/a/@href').extract()[0]
				
				cnx = mysql.connector.connect(host = 'localhost', user='root', passwd='root', database='spider')
				cursor = cnx.cursor()
				
				#nota = float(response.xpath('//span[@class="bignota"]/text()').extract()[0].strip('\t\n'))
				#cursor.execute("Update anbientanime set nota = %s WHERE url = %s", [ nota, item.get('url', '') ])
				#cnx.commit()
				
				cursor.execute("SELECT COUNT(1) FROM anbientanime WHERE url = %s", [item['url']])
				
				if cursor.fetchone()[0]:
					cursor.close()
					cnx.close()
					return
				
				cursor.close()
				cnx.close()

				for sel in response.xpath('//div[@class="content"]/div[@id="left"]/div[@id="dentroleft"]/ul/li'):
					itemLi = sel.xpath('span[@class="label"]/text()').extract()
					if(len(itemLi) == 0):	
						continue
					itemLi = sel.xpath('span[@class="label"]/text()').extract()[0].strip('\t\n')
					if(itemLi ==  u'Episódios:'):
						item['episodes'] = sel.xpath('text()').extract()[1].strip('\t\n')
					elif(itemLi == u'Ano:'):
						item['year'] = sel.xpath('text()').extract()[1].strip('\t\n')
					elif(itemLi == u'Gêneros:'):
						item['genres'] = sel.xpath('span[@id="generos"]/text()').extract()[0].strip('\t\n').split(", ")

				item['relatedItems'] = response.xpath('//span[@id="relacionado"]/span/a/@href').extract()
				for i in range(0, len(item['relatedItems'])):
					item['relatedItems'][i] = self.domain + item['relatedItems'][i]
				item['myAnimeListUrl'] = sel.xpath('//a[@class="mal"]/@href').extract()[0]
				item['category'] = response.xpath('//span[@class="tipoconteudo"]/a/text()').extract()[0].strip('\t\n')
				item['synopsis'] = response.xpath('//span[@id="sinopse"]/text()').extract()[0].strip('\t\n')
				item['imgUrl'] = response.xpath('//img[@class="imagecache imagecache-242x0 imagecache-default imagecache-242x0_default"]/@src').extract()[0]
			except:
				item['error'] = str(sys.exc_info()[0]) + '/Line:' + str(sys.exc_info()[2].tb_lineno)
			return item