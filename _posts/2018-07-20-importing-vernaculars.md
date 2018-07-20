---
layout: post
title:  "Importing Vernaculars"
author: "Laura"
tags: sql
---

After importing the taxonomic thesaurus for the Herbarium and testing the searches, I realized there was no documented way of importing vernaculars into Symbiota. There are forms and scripts that automate the importing of data to both the thesaurus and for specimens (found under options "Batch Upload a Taxonomic Data File" and "Import/Update Specimen Recors"), but that option is lacking for vernaculars.
Therefore, only a direct import to the database is possible.
Using the Herbarium's Symbiota installation done by Robert Anglin, I have created a temporary table called `FibVernaculars`, that contained necessary information about the existing vernaculars and their associated taxa.
I then cross-referenced `FibVernaculars` with the taxa already stored in the prototype's database using the field `sciname` from table `taxa` (because Symbiota auto generates id numbers for each imported record), and the field `TID` from table `taxavernaculars`.
Lastly, I inserted the ids, vernaculars, sources and notes into the prototype's database.
I am considering creating a form to allow for that import to be done by portal admins.

A few queries that have been generated are listed:
- [fib_vernaculars.sql](/sql/fib_vernaculars.sql) - generates temporary table `FibVernaculars`
- [cross_fib_uwmuseums_vernaculars.sql](/sql/cross_fib_uwmuseums_vernaculars.sql) - compares `FibVernaculars` with the prototype's taxa and generates the necessary records for importing (creates temporary table `UWVernaculars`)
- [import_vernaculars.sql](/sql/import_vernaculars.sql) - insert statements