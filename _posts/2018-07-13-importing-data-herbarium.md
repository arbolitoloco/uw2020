---
layout: post
title:  "Importing Existing Data: Herbarium"
author: "Laura"
tags: in-progress sql
---

After deciding that we should start building the portal using the data from an existing Symbiota installation, I concentrated my efforts into importing the databases from the Herbarium into the prototype.
It turned out to be a task more complicated than I had anticipated, but it is finally done.
The prototype uses the current Symbiota core, which is newer than the one used by the Herbarium. A few compatibility issues arose, but everything is working again now.
The most important component of this import was to make sure that the taxonomic thesaurus was updated and contained all taxa represented in the collection.
Figuring out the table strcuture in the two Symbiota installations (the source and the target) was essential to maintain data quality. Since Symbiota's documentation does not explicit the structure of tables or relationship between them, I will describe them here, in hope that this information can be useful again someday.

While accessing the database for a given Symbiota installation, if one wants to gather, in a single view, the taxonomic names and ranks, and also their parent ranks and names, three tables should be queried:

- taxa: stores information relative to a taxon (does not include parent taxon or any other hierarchy)
- taxonunits: stores information relative to taxonomic hierarchy (rank names and ids)
- taxaenumtree: stores taxonomic hierarchy between taxa (taxa with their parent ids)

A few queries that have been generated on the source database are listed:
- [fib_genera.sql](/sql/fib_genera.sql )
- [fib_genera_with_parentid.sql](/sql/fib_genera_with_parentid.sql )
- [fib_genera_ranks.sql](/sql/fib_genera_ranks.sql)
- [fib_export_thesaurus_genera_parents.sql](/sql/fib_export_thesaurus_genera_parents.sql)
- [fib_species_or_lower.sql](/sql/fib_species_or_lower.sql)
- [fib_species_with_parentid.sql](/sql/fib_species_with_parentid.sql)
- [fib_export_thesaurus_species_parents.sql](/sql/fib_export_thesaurus_species_parents.sql)

The queries were then exported to .csv files, zipped, and imported into the prototype using the Batch Upload a Taxonomic Data File option in the Sitemap (which points to the ../taxa/admin/taxaloader.php page).

