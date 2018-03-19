---
title: Scrap and save it to mongodb
layout: post_page
---

Scrapy is impressive. I've worked with Selenium HQ around 10 years ago. Selenium IDE which can record user's behaviour on the web site save it as java codes in order to automate testing web pages. On the other hand, Scrapy seems introduce itself more for a framework to  crawl data on the internet. Its command options after main command "scrapy" and parameters are well organized for this feature.

The scrapy would be helpful for me to implement a service re-organizing financial information from a sort of bank union in Korea. As you can imagine, I need a storage to save raw data and mongodb might be suitable for this mini-project.

```
$scrapy startproject collector
New Scrapy project 'collector', using template directory '/prods/biz/sbfinder/venv/lib/python3.6/site-packages/scrapy/templates/project', created in:
    /prods/biz/sbfinder/collector

You can start your first spider with:
    cd collector
    scrapy genspider example example.com
$
$scrapy genspider example example.com
Created spider 'example' using template 'basic' in module:
  collector.spiders.example
	
$scrapy crawl example
....
2018-03-03 18:49:43 [scrapy.core.engine] DEBUG: Crawled (404) <GET http://example.com/robots.txt> (referer: None)
2018-03-03 18:49:43 [scrapy.core.engine] DEBUG: Crawled (200) <GET http://example.com/> (referer: None)
2018-03-03 18:49:44 [scrapy.core.engine] INFO: Closing spider (finished)
2018-03-03 18:49:44 [scrapy.statscollectors] INFO: Dumping Scrapy stats:
{'downloader/request_bytes': 430,
 'downloader/request_count': 2,
 'downloader/request_method_count/GET': 2,
 'downloader/response_bytes': 1836,
 'downloader/response_count': 2,
 'downloader/response_status_count/200': 1,
 'downloader/response_status_count/404': 1,
 'finish_reason': 'finished',
 'finish_time': datetime.datetime(2018, 3, 3, 9, 49, 44, 57626),
 'log_count/DEBUG': 3,
 'log_count/INFO': 7,
 'memusage/max': 49369088,
 'memusage/startup': 49369088,
 'response_received_count': 2,
 'scheduler/dequeued': 1,
 'scheduler/dequeued/memory': 1,
 'scheduler/enqueued': 1,
 'scheduler/enqueued/memory': 1,
 'start_time': datetime.datetime(2018, 3, 3, 9, 49, 43, 469305)}
2018-03-03 18:49:44 [scrapy.core.engine] INFO: Spider closed (finished)
```





```
$tree collector/
collector/
├── __init__.py
├── __pycache__
│   ├── __init__.cpython-36.pyc
│   └── settings.cpython-36.pyc
├── items.py
├── middlewares.py
├── pipelines.py
├── settings.py
└── spiders
    ├── __init__.py
    ├── __pycache__
    │   ├── __init__.cpython-36.pyc
    │   └── example.cpython-36.pyc
    └── example.py

```


According to the tree structure we can append a spider code under spiders folder and run them with the command as below.

```scrapy crawl [spider name]```

We also can notice from the tutorial of scrapy that there is one tip to send request as fewer times as we can so that we can avoid to be blocked by the service operator. What I meant is that our test request might not be able to get response if we made a lot of trials in short time to one public service. The service owner don't want the strange traffic causes heavy load to their server because this affect to victims of goodwill. For this reason this kind of persistent and repeating traffic to scrap service information is filtered by throtling options from the server. 

``` scrapy shell [url | file] ``` 

This command has its own role on this situation. We don't need to make a lot of request to the target service. Once we get the contents on our local environment and we can test our xpath or css selctor to grab data of interest under scrapy shell looking like python shell.

```
$scrapy shell 'file:///prods/biz/sbfinder/collector/save-financepro.html'
2018-03-04 11:30:56 [scrapy.utils.log] INFO: Scrapy 1.5.0 started (bot: collector)
2018-03-04 11:30:56 [scrapy.utils.log] INFO: Versions: lxml 4.1.1.0, libxml2 2.9.7, cssselect 1.0.3, parsel 1.4.0, w3lib 1.19.0, Twisted 17.9.0, Python 3.6.4 (default, Jan  6 2018, 11:51:15) - [GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.39.2)], pyOpenSSL 17.5.0 (OpenSSL 1.1.0g  2 Nov 2017), cryptography 2.1.4, Platform Darwin-16.7.0-x86_64-i386-64bit
2018-03-04 11:30:56 [scrapy.crawler] INFO: Overridden settings: {'BOT_NAME': 'collector', 'DUPEFILTER_CLASS': 'scrapy.dupefilters.BaseDupeFilter', 'FEED_EXPORT_ENCODING': 'utf-8', 'LOGSTATS_INTERVAL': 0, 'NEWSPIDER_MODULE': 'collector.spiders', 'ROBOTSTXT_OBEY': True, 'S

...

s]   settings   <scrapy.settings.Settings object at 0x10cc56710>
[s]   spider     <DefaultSpider 'default' at 0x10cf42860>
[s] Useful shortcuts:
[s]   fetch(url[, redirect=True]) Fetch URL and update local objects (by default, redirects are followed)
[s]   fetch(req)                  Fetch a scrapy.Request and update local objects
[s]   shelp()           Shell help (print this help)
[s]   view(response)    View response in a browser
>>> response.xpath('//*[@id="rowspan_0"]/strong/text()').extract()
['95%']
>>> response.css('#rowspan_0 > strong::text').extract()
['95%']

```


Now, scrapy is ready to use. The scraped data can be extracted by using xpath or css selector and this should be saved to a database. I want to keep them in mongodb. There are a few reason I prefer mongodb rather than RDB like mysql or oracle.
* I just want a cache storage without care of data relation. This data could stay temporally.
* More attribute will be appended in the future service. A lot of job is needed if I change DB schema when I use SQL based RDB. On the other hand the mongodb which is NoSql gives us easier way to handle data when there is schema change. 
* Lastly, as an old engineer, I want to be friendly with new stuff.


Most difficult thing I faced was imitate Join operation on Mongodb.
Insert,delete, and update don't have any issue. They are even more convenient than those of RDB. But when it comes to think of JOIN, I cannot imagine how I can build script or command on Mongodb environemnt.

 When god closes one door, he opens another. Searching suggested me Studio 3T which is GUI tool for Mongodb. It is a good private teacher for me. Through this tool I ,finally, know how to do it. And I found there is aggregation method in a visual way.
I think this tool is worth to use to save our effort.

![studio3t](../../../../img/studio3t.png)

If it is pro or enterprise version the aggregation code can be converted to python or javascript code as follows.

```
 pipeline = [
            {
                u"$lookup": {
                    u"from": u"product",
                    u"localField": u"bank_name",
                    u"foreignField": u"bank_name",
                    u"as": u"tmp"
                }
            }, 
            {
                u"$unwind": {
                    u"path": u"$tmp"
                }
            }, 
            {
                u"$addFields": {
                    u"prod_name": u"$tmp.prod_name",
                    u"d_cint_06": u"$tmp.d_cint_06",
                    u"d_cint_12": u"$tmp.d_cint_12",
                    u"d_cint_24": u"$tmp.d_cint_24",
                    u"d_cint_36": u"$tmp.d_cint_36",
                    u"d_sint_06": u"$tmp.d_sint_06",
                    u"d_sint_12": u"$tmp.d_sint_12",
                    u"d_sint_24": u"$tmp.d_sint_24",
                    u"d_sint_36": u"$tmp.d_sint_36"
                }
            }, 
            {
                u"$project": {
                    u"tmp": 0.0,
                    u"_id": 0.0
                }
            }, 
            {
                u"$out": u"bank_product"
            }
        ]
        
        cursor = self.db.bank.aggregate(
            pipeline, 
            allowDiskUse = True
        )
```


As a beginner of scrapy and mongodb, with help of Studio 3T and a few advices on the internet, I could manage to crawl some data from a site without any traffic block and this makes me start build a new service from now on.