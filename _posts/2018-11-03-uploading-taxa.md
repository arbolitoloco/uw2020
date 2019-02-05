
---
layout: post
title:  "Uploading taxa (taxonomic tree)"
author: "Laura"
tags: 
---

When uploading taxa to Symbiota using the "batch upload" tool, the spreadsheet to be uploaded may include the following fields:

FRONT-END (taxaloader.php) | FRONT-END explanation
---------------------------|----------------------------
acceptance | 0 = not accepted, 1 = accepted (default 1)
acceptedstr | accepted name (if 1, it will be equal to sciname)
author | RECOMMENDED, author of sciname
class | 
errorstatus | ?
family | 
genus | 
hybrid | 
infraauthor | author of infraspecific epithet
infraspecificepithet | 
initialtimestamp | 
kingdom | 
notes | 
order | 
organism | ?
parentstr | RECOMMENDED, parent taxon (literal name of taxon, for instance, Mollusca)
phylum | 
rankid | id of rank found in table taxonunits (i. e. Kingdom = 10, Species = 220)
rankname | i. e. species, genus, class, etc.
sciname | only full scientific name (without author)
scinameinput | REQUIRED, full scientific name with or without author
section | 
securitystatus | 
source | 
sourceacceptedid | 
specificepithet | 
subclass | 
subfamily | 
subgenus | 
subkingdom | 
suborder | 
subphylum | 
subsection | 
subtribe | 
superclass | 
taxonrank | 
tribe | 
unacceptabilityreason | 
vernacular | 
vernlang | 

A great number of taxonomic fields can be uploaded for a single record. Taxonomic fields, ordered by level of inclusion (greater to lower):

1. organism
2. kingdom
3. subkingdom
4. phylum
5. subphylum
6. superclass
7. class
8. subclass
9. order
10. suborder
11. tribe
12. subtribe
13. family
14. subfamily
15. section
16. subsection
17. genus
18. subgenus
19. sciname/scinameinput
20. specificepithet
21. infraspecificepithet

The uploaded taxa are then processed into different tables, to generate/rearrange the taxonomic tree:

- Table `taxa`: information about one particular taxon, with their `SciName`, `KingdomName`, `RankID`, `SecurityStatus`, etc.
- Table `taxaenumtree`: relationships between taxa, established pair-to-pair, by their `TID`s (`taxaauthid` and `parenttid`).

Therefore, the minimum taxonomic levels required for Symbiota to generate a taxonomic tree are the full species name (least inclusive name, could be Genus + Specific epithet or even any taxonomic level), and Kingdom, and preferrably their parent taxon name (field `parentstr`).

For some groups, records can be uploaded with the full taxonomic information (when available), and then cleaned up using the Data Cleaning Tools. For other groups (namely those without a robust electronic Taxonomic Authority such as ITIS/EOL), it's better if the taxonomic trees are uploaded first, with the more inclusive levels being added also first.