---
layout: post
title:  "Importing Existing Data: Images"
author: "Laura"
tags: done sql
---

Images so far have been included in the prototype by linking their URLs to the appropriate ids or taxa. The import has been done using one of two approaches:

1. Upload DWC-A files containing the specimens, taxa and image associations using the graphic interface (approach used for smaller datasets from the Great Lakes Invasives, for instance).
2. Database manipulation, by copying the records from `images` tables from the previous Symbiota installations into (approach used for large datasets from the Herbarium, for instance, where the DWC-A file size would exceed the server max upload allowance).

The following queries were used for the imports:

- [fib_export_imgs.sql]()
- [import_bryo_imgs.sql]()
- [fib_export_imgs_3.sql]()
- [import_imgs_taxa.sql]()