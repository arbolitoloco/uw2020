---
layout: post
title: "Importing Occurrences - Data standards and methods"
author: "Laura"
permalink: /docs/occurrence-import/
---

Symbiota provides several builtin methods for importing occurrence (specimens) data from different formats and using different methods.
One of the most commonly used methods is to manually import data using the Symbiota interface's Import Profile (`/collections/admin/specupload.php`) in the Collection Management tools.


## Importing a DwCA file or a fulltext file (csv)

Once the desired file (usually a DwCA file or a csv file) is selected, the user has to click the "Analyze file" button. This is where a complex proccess is triggered, where Symbiota will (in the backend) try to match the data in the file with their import options, do some data cleaning, and finally importing everything to their core in the adequate tables. So, after uploading the input file, the user can check that the field mapping is being correctly setup. Below is a table comparing the fields used by the Import Profile (field that can be processed by Symbiota), their Symbiota explanation and DwC equivalents (when applicable).

## Occurrences Fields Mapping

The list of occurrences (specimens or observations) fields that can be uploaded to Symbiota have been updated to include their full and partial Darwin Core equivalents.

<!-- Place this tag where you want the Awesome Table Widget to render -->
<div data-type="AwesomeTableView" data-viewID="-LSWcJK5mNPL6YJsAeUv"></div>

The searchable `.csv` version of this file can be found [here](https://github.com/arbolitoloco/uw2020/blob/master/docs/symb-dwc-terms-occurrences.csv).

### Conversion Procedures

Non-Symbiota management systems can have their data exported to a Darwin Core format to make the imports easier. The actions that have to be performed in each collection are described in the documents listed below.

- [Anthropology](https://arbolitoloco.github.io/uw2020/docs/occ-conversion-proc-anthro/)
- Botany
- Entomology
- [Geology](https://arbolitoloco.github.io/uw2020/docs/occ-conversion-proc-geology/)
- Zoology


## Importing fields through Direct Database Mapping

Tables and fields that are updated when the import profile method is applied and tables and fields that should be updated if you want to do db to db imports. 





<!-- Place this within the <head> tag or just before the end of your <body> tag. -->
<script src="https://awesome-table.com/AwesomeTableInclude.js"></script>