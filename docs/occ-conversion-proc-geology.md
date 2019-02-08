---
layout: post
title: "Occurrence fields conversion procedures - Geology"
author: "Laura"
permalink: /docs/occ-conversion-proc-geology/
---

As mentioned before, at the time of the data import, the UWGM's data was being entered in a PastPerfect database. A full export was performed by curator Carrie Eaton, and the tables were then cleaned and mapped by me, with some data being converted when necessary. Cleaning and conversion were mostly carried out using OpenRefine software.

The following tables describe the field equivalencies for each major "subcollection", with performed adaptations:

## Fossils

Original  | Symbiota             | Procedure
----------|----------------------|---------------------------------------------------------
CATBY     | recordEnteredBy      | none, data is already up to standard
COLLDATE  | eventDate            | convert to YYYY-MM-DD format
COLLECTOR | recordedBy           | none, data is already up to standard
DESCRIP   | occurrenceRemarks    | none, data is already up to standard
IMAGEFILE | associatedMedia      | append image server url to filename; replace '\' with '/'; replace JPG with jpg
OBJECTID  | dbpk (catalogNumber) | none, data is already up to standard
OLDNO     | otherCatalogNumbers  | none, data is already up to standard
SITE      | Locality fields      | break down into: stateProvince; localitySecurity (protected for all vertebrates); localitySecurityReason; locationRemarks; country; county; locality (only up to county)
UPDATED   | modified             | convert to YYYY-MM-DD HH:MM:SS format
COUNT     | individualCount      | none, data is already up to standard
DEPTH     | maximumDepthInMeters | replace '.' with ','
IDBY      | identifiedBy         | none, data is already up to standard
IDDATE    | dateIdentified       | convert to YYYY-MM-DD format
SPECIES   | sciname              | none, data is already up to standard

The following DWC fields were added to the converted table, to improve data standards:

Field         | Value
--------------|----------------
genus         | Fossil
basisOfRecord | FossilSpecimen

## Minerals and Rocks

Original  | Symbiota             | Procedure
----------|----------------------|---------------------------------------------------------
CATBY     | recordEnteredBy      | none, data is already up to standard
COLLDATE  | eventDate            | convert to YYYY-MM-DD format
COLLECTOR | recordedBy           | none, data is already up to standard
DESCRIP   | occurrenceRemarks    | none, data is already up to standard
IMAGEFILE | associatedMedia      | append image server url to filename; replace '\' with '/'; replace JPG with jpg
OBJECTID  | dbpk (catalogNumber) | none, data is already up to standard
OLDNO     | otherCatalogNumbers  | none, data is already up to standard
SITE      | Locality fields      | break down into: stateProvince; localitySecurity (protected for all vertebrates); localitySecurityReason; locationRemarks; country; county; locality (only up to county)
UPDATED   | modified             | convert to YYYY-MM-DD HH:MM:SS format
COUNT     | individualCount      | none, data is already up to standard
DEPTH     | maximumDepthInMeters | replace '.' with ','
IDBY      | identifiedBy         | none, data is already up to standard
IDDATE    | dateIdentified       | removed, because empty
SPECIES   | subcategory          | none, data is already up to standard


The following DWC fields were added to the converted table, to improve data standards:

Field         | Value
--------------|--------------------
genus         | Minerals and Rocks
basisOfRecord | MaterialSample


