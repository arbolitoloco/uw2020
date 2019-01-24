---
layout: post
title: "How to Group Collections in the Advanced Search Form"
author: "Laura"
---

Symbiota uses "categories" to generate groups of collections that can be selected as one in the Advanced Search form. To use this feature, the database has to be manually edited (so far I have not been able to find a form anywhere to do it in the graphic interface). 

1. In the database, go to the `omcollcategories` table, and add the rows equivalent to each desired category. The key `ccpk` is automatically generated and has to be noted, because it's the key used to link each collection in its category. It's also possible to add acronyms and even icons to each category.
2. Go to the `omcollections` and note the `collid` for each collection that is going to be included in each category.
3. Go to the `omcollcatlink` table and add one row per `collid`, associating the `ccpk` of the category for each collection.