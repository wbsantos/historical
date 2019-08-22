import scrapy
import mysql.connector
from scrapy.contrib.pipeline.images import ImagesPipeline
from scrapy.exceptions import DropItem

class Image(ImagesPipeline):

    def get_media_requests(self, item, info):
		if(item.get('imgUrl', '')):
			yield scrapy.Request(item['imgUrl'])

    def item_completed(self, results, item, info):
        image_paths = [x['path'] for ok, x in results if ok]
        if not image_paths:
			item['error'] = item.get('error', '') + ' // Error Downloading the image'
			return item
        item['imgUrl'] = image_paths[0]
        return item
		
		
class DataBase(object):

    def process_item(self, item, spider):
		cnx = mysql.connector.connect(host = 'localhost', user='root', passwd='root', database='spider')
		cursor = cnx.cursor()

		add_anbient = ("INSERT INTO AnbientAnime "
								"(title, url, episodes, year, imgUrl, synopsis, myAnimeListUrl, error, category) "  				
								"VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);")

		data_anime = [item.get('title', ''),
							  item.get('url', ''),
							  item.get('episodes', None),
							  item.get('year', None),
							  item.get('imgUrl', ''),
							  item.get('synopsis', ''),
							  item.get('myAnimeListUrl', ''),
							  item.get('error', None),
							  item.get('category', '') ]               		
		cursor.execute(add_anbient, data_anime)
		
		id = cursor.lastrowid
		
		for gen in item.get('genres', []):
			add_genrer = ("Insert into AnbientGenre "
								  "(idAnime, name) "
								  "Values (%s, %s)")
			data_genrer = [id, gen]
			cursor.execute(add_genrer, data_genrer)
			
		for rel in item.get('relatedItems', []):
			add_related = ("Insert into AnbientRelatedItems "
								  "(idAnime, urlRelated) "
								  "Values (%s, %s)")
			data_related = [id, rel]
			cursor.execute(add_related, data_related)
		
		cnx.commit()

		cursor.close()
		cnx.close()	