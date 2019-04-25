---
layout: post
title: "Occurrence fields conversion procedures - Entomology"
author: "Laura"
permalink: /docs/occ-conversion-proc-entomo/
---

The WIRC uses a local installation of Specify to manage its data.
Custom queries can be easily produced in Specify, with selected fields, that should be then exported to .xls files, and converted into .csv for easy upload into Symbiota.

For the "Specimens" basic query (with criteria: WIRC), the following table describe the field equivalencies:

Original  | Symbiota             | Procedure
----------|----------------------|---------------------------------------------------------
Taxon [Formatted] |  | Leave Field Unmapped
Preferred Taxon [Formatted] | sciname | equivalent
Current |  | Leave Field Unmapped
Specimen number | catalogNumber | equivalent
Biota Catalog # | otherCatalogNumbers | equivalent
Cataloged Date |  | Leave Field Unmapped
Changed Date | modified | equivalent
Stage Sex | lifeStage and sex | split using / divider into two fields, Stage and Sex
Determined By [Formatted] | identifiedBy | change Lastname, Firstname to Firstname Lastname
Guid |  | Source Unique Identifier/Primary Key
Agent [Formatted] | recordedBy | change Lastname, Firstname to Firstname Lastname
Source | occurrenceRemarks | equivalent
Remarks |  | is it empty? concat with source?
Start Coll Date | eventDate | equivalent
End Coll Date | latestdatecollected | equivalent
Continent |  | Leave Field Unmapped
Country | country | equivalent
County | county | equivalent
Povince |  | is it empty? concat with state?
State | stateprovince | equivalent
Name |  | Leave Field Unmapped
Locality Name | locality | equivalent
Elevation | verbatimElevation | equivalent
Lat1text | verbatimLatitude | equivalent
Lat2text | verbatimLongitude | equivalent
Latitude/Longitude Type |  | Leave Field Unmapped
Latitude1 |  | Leave Field Unmapped
Latitude2 |  | Leave Field Unmapped
Long1text |  | Leave Field Unmapped
Long2text |  | Leave Field Unmapped
Longitude1 |  | Leave Field Unmapped
Longitude2 |  | Leave Field Unmapped
Phylum |  | Leave Field Unmapped
Order |  | Leave Field Unmapped
Family | family | equivalent