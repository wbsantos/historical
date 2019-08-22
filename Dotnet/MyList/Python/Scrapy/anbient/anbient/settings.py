# -*- coding: utf-8 -*-

# Scrapy settings for anbient project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'anbient'

ITEM_PIPELINES = {'anbient.pipelines.Image': 1, 
						     'anbient.pipelines.DataBase': 2}
							 
IMAGES_STORE = 'C:\\Users\\William.wbs\\SkyDrive\\Projetos\\Python\\Scrapy\\anbient\\img'
SPIDER_MODULES = ['anbient.spiders']
NEWSPIDER_MODULE = 'anbient.spiders'

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'anbient (+http://www.yourdomain.com)'
