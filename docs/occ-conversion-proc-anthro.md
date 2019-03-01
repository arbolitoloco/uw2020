---
layout: post
title: "Occurrence fields conversion procedures - Anthropology"
author: "Laura"
permalink: /docs/occ-conversion-proc-anthro/
---

At the time of the data import, the Anthropology Department's data was being managed in a customised FileMaker Pro database. A full export was performed by curator Liz Leith, and the preliminary table `specimens.xlsx` was then cleaned and mapped by me, with some data being converted when necessary. Cleaning and conversion were mostly carried out using OpenRefine software. 

Liz Leith has figured out different export layouts in File Maker Pro, to correctly output necessary fields from each of the Anthropology's subcollections to a `.csv` or `.xls` file. That file, then, is going to be the primary source of occurrences imports in Symbiota. Dr. Leith and her students will perform further data cleaning, rearranging and adaptation in the FileMaker Pro database, so the directives described here are on a working state.

The DWC field `basisOfRecord` has to be added to the converted table, to improve data standards, according to each record type:

Record Type              | Value of `basisOfRecord`
-------------------------|-------------------------
biological               | PreservedSpecimen
object                   | MaterialSample
photography or documents | HumanObservation
---------------------------------------------------

The following table describes the field equivalencies for each major "subcollection", with performed adaptations:

Original   | Symbiota             | Procedure
-----------|----------------------|---------------------------------------------------------
Collection | - | use to divide records into subcollections
Specimen Number | dbpk (or catalogNumber) | none, data is already up to standard
UWDC Number | otherCatalogNumbers | none, data is already up to standard
Specimen Description (verbatim) | occurrenceRemarks | concatenate with other remarks into a single column
Materials Specimen (verbatim) | occurrenceRemarks | concatenate with other remarks into a single column
Specimen Total Number Present | individualCount | none, data is already up to standard
Record Created By | recordEnteredBy | none, data is already up to standard
Inventoried By | prepBy | none, data is already up to standard
Inventory Date | eventDate | convert to YYYY-MM-DD
Continent | continent | none, data is already up to standard
Country | country | none, data is already up to standard
State | stateProvince | none, data is already up to standard
County | county | none, data is already up to standard
---------------------------------------------------

These additional fields should be added to complete the data:

Original | Symbiota | Explanation
---------|----------|--------------
Collector | recordedBy | add full names of collectors, separated by a pipe when multiple (example: José E. Crespo OR Oliver P. Pearson | Anita K. Pearson)
Type Name | sciname | scientific name without autors (example: Musca domestica OR the least inclusive taxonomic name available, for instance Insecta).
- | associatedMedia | add server url with full path to image file
- | localitySecurity | 0=don’t hide locality details from general public, 1=hide locality, 2=hide full record
- | localitySecurityReason | if you'd like to add a justification for locality being hidden
- | scientificName | full scientific name, with or without autors (example: Musca domestica OR Musca domestica Linnaeus OR the least inclusive taxonomic name available, for instance Insecta).
- | family | optional, biological familial name
- | kingdom | optional, biological kingdom name
---------------------------------------------------

All other fields in the original database were ignored.

For a full list of available fields in Symbiota/DWC standards, please refer to: [https://arbolitoloco.github.io/uw2020/docs/occurrence-import/](https://arbolitoloco.github.io/uw2020/docs/occurrence-import/).