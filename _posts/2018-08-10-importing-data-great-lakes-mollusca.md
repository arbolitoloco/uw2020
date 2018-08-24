---
layout: post
title:  "Importing Existing Data: Great Lakes Invasives"
author: "Laura"
tags: done open-refine
---

Before full implementation of the Zoological Museum's Specify, I used the UW mollusks dataset found at the [Great Lakes Invasives Network](http://greatlakesinvasives.org) to test our prototype. Since that Symbiota portal has chosen to publish their data as Darwin Core Archive (DwC-A) files via [iDigBio](https://www.idigbio.org/), the import process was much easier.

A taxonomic thesaurus was needed before the specimesn could be imported. Instead of importing the full Animalia tree from ITIS, I have chosen to import only the taxa associated with specimens in the source database. That will happen to most collections imported in the prototype, because sometimes the taxonomy is not fully registered in ITIS or other taxonomic repositories. Because Symbiota does not provide an automated process for taxonomic tree export, I have used the DwC-A files to generate the trees as need.

## Generating taxonomic thesaurus with DwC-A files and OpenRefine

1. Created new project in [OpenRefine](http://openrefine.org/), importing the DwC-A, only with the columns that were pertinent for the taxonomic thesaurs import (`kingdom`, `phylum`, `class`, `order`, `family`, `scientificName`, `taxonID`, `scientificNameAuthorship`, `genus`, `specificEpithet`, `taxonRank`, `infraspecificEpithet`, `taxonRemarks`).
2. Selected row mode by clicking `Show as: rows`.
3. Sorted by `scientificName` or `taxonID` (by clicking the column arrow, then `sort`)4.
4. Selected the `Sort` menu, clicked `Reorder rows permanently`.
5. Selecting either `scientificName` or `taxonID`, clicked the column arrow, then `Edit cells`, then `Blank down`, to remove duplicates.
6. Clicked the `scientificName` or `taxonID` column arrow, then `Facet`, then `Text facet`. On the left panel, clicked the `scientificName` facet panel, then selected the `(blank)` facet to select all records that were cleared.
7. Selected the `All` column arrow, then `Edit rows`, then `Remove all matching rows` to remove duplicates. 
8. Clicked the `(blank)` facet again and excluded it from the dataset.
9. Exported as `.csv` to manually edit the hierarchy in MS Excel.

## Preparing taxonomic thesaurus in MS Excel

The exported `.csv` from DwC-A has to be modified so that the manual import on Symbiota runs smoothly. The thesaurus should be imported in two steps: first, the higher taxonomy should be added (from kingdom to tribe, and this order is important, so the highest ranks should be always imported before their children), then all taxa included in genera and lower ranks.

The following fields can be mapped into Symbiota using the graphic interface:

- `acceptance`
- `acceptedstr`
- `author`: author of taxon
- `class`
- `errorstatus`
- `family`
- `genus`
- `hybrid`
- `infraauthor`
- `infraspecificepithet`
- `initialtimestamp`
- `kingdom`
- `notes`
- `order`
- `organism`
- `parentstr`: strongly recommended for building hierarchy correctly, parent taxon's `sciname`
- `phylum`
- `rankid`: number assigned to rank of taxon in table `taxonunits` (for instance, `kingdom=10` and `species=220`)
- `rankname`
- `sciname`: full scientific name without author
- `scinameinput`: required, full scientific name with or without author
- `section`
- `securitystatus`
- `source`
- `sourceacceptedid`
- `sourceid`
- `sourceparentid`
- `specificepithet`
- `subclass`
- `subfamily`
- `subgenus`
- `subkingdom`
- `suborder`
- `subphylum`
- `subsection`
- `subtribe`
- `superclass`
- `taxonrank`
- `tribe`
- `unacceptabilityreason`
- `vernacular`
- `vernlang`

Whenever importing the taxonomic thesaurus using the graphic interface (that is, through the portal), a script will allocate the information from these fields in the adequate tables and generate identification numbers to the new records.
For my data, these were the fields used in the taxonomic thesaurus import:

- `kingdom`
- `phylum`
- `class`
- `order`
- `family`
- `genus`
- `scinameinput`: required, full scientific name with or without author
- `sciname`: full scientific name without author
- `author`: author of taxon
- `parentstr`: strongly recommended for building hierarchy correctly, parent taxon's `sciname`
- `rankid`: number assigned to rank of taxon in table `taxonunits` (for instance, `kingdom=10` and `species=220`)

*Tip*: Symbiota has a built-in feature for troubleshooting the occasional errors. After uploading the spreadsheet and mapping the fields for the import, a report is going to be generated, showing the number of taxa and their status (uploaded, already in thesaurus, new, etc.). It is possible to verify if the taxa are being correctly uploaded by verifying the "processed" data, by downloading the `.csv` taxa file generated. Just click the link "Download CSV Taxa File", review the information in it.