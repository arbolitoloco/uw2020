---
layout: post
title:  "Fixing taxonomic thesaurus and tree"
author: "Laura"
tags: sql done
---
Closes issue [#16](https://github.com/arbolitoloco/uw2020/issues/16)

As described in issue [#16](https://github.com/arbolitoloco/uw2020/issues/16), after importing the taxonomic thesaurus and specimens from the Herbarium database, there were problems with the searches and hierarchies shown in the prototype.
I realised the issue was related to taxonomic trees not being formed at all. This happened, because the data was manually updated into the portal's database, and Symbiota only generates taxonomic relationships and hierarchies when importing names and specimens through their graphic interface.
Thus, the hierarchies had to be manually updated to reflect their accurate relationship. To do so, the following tables had to be manipulated:
- taxa
- taxstatus: another instance of the taxonomic hierarchy (additional to taxaenumtree)

Because Symbiota automatically generates id numbers for each new taxon, the taxa ids did not match between the Herbarium and the prototype's databases. Therefore, the taxa status and parent taxon were matched according to the (unique) `sciname` field, with corresponding ids being populated and table `taxstatus` thus correctly updated.
This solved search, tree and taxon profile issues that had been registered.
A few queries that have been generated are listed:
- [fib_taxstatus.sql](/sql/fib_taxstatus.sql)
- [cross_fib_uwmuseums_taxstatus.sql](/sql/cross_fib_uwmuseums_taxstatus.sql)
- [import_taxstatus.sql](/sql/import_taxstatus.sql)