---
layout: post
title:  "Non-Biological tree experiments"
author: "Laura"
tags: 
---

Collections hosted at the Geological Museum and the Anthropology Department need a workaround to be incorporated in Symbiota. The workaround consists in creating a non-biological taxonomic tree where the "taxa" have to reflect some sort of classification used for non-biological specimens, such as rocks, fossils, minerals, and artifacts.

## Geology trees

The Geological Museum's specimens are hosted in three main collections: Vertebrates, Invertebrates, and Minerals. While the first two can be accommodated in the main Animalia tree, the Minerals need a custom tree. An analysis of the mineral specimen records returns 16 preliminary "taxa" (column `OBJNAME`):

`OBJNAME`             | Records
----------------------|---------
Banded Iron Formation |	1236
Breccia	              | 1
Calcite	              | 1
Diamond	              | 4
Feldspar              | 1
Fluorite              | 1
Gemstone              | 209
Halite                | 1
Ichnofossil           | 8
Invertebrate          | 6
Meteorite             | 2
Mineral Specimen      | 885
Ore                   | 1
Quartz                | 2
Rock Specimen         | 87
Vertebrate            | 2

## Object taxonomy

To allow for a completely new category, that I'm going to call "Geological Specimen", and that would be included in the highest level `Object` (comparable to level `Organism` for biological trees), `rankid` = 1, add new record in table `taxonunits`.

Symbiota accommodates many taxonomic levels under each Domain, from Kingdom to Form. The categories levels can have different names (defined field `rankname` with 15-character limit) and are ordered following their rank number (field `rankid`). Keeping in mind the required taxonomic fields for uploading specimens in the graphic interface (least inclusive name and Kingdom), a workaround has to include names that will work as "Genera" and "Species" as well.

I'm taking advantage of the taxonomic levels table, by defining the following categories in table `taxonunits` (`rankid`, equivalent to rank in biological tree):

		Object (1, Organism)
		-- Discipline (10, Kingdom)
		--- Category (180, Genus)
		---- Subcategory (220, Species)

The super rank `Object` requires that a taxon with that `sciname` and `UnitName1` is added to table `taxa`, and then a relationship has to be added to table `taxaenumtree` between `Object` and itself (that is, `Object` is in Central Thesaurus and its parent is itself).

The following step is to add the actual "taxa" to the database via spreadsheet upload (option "Batch Upload a Taxonomic Data File" in `sitemap.php`), in increments (starting with the higher level taxa):

sciname          | rankid | rankname   | parentstr
-----------------|--------|------------|-----------
Geology          | 10     | Discipline | Object
MineralsAndRocks | 180    | Category   | Geology
Fossil           | 180    | Category   | Geology

*Note that compound names were initally uploaded as a single word, in an attempt to surpass the cleaning scripts that check for regular scientific names. Later, spaces were manually introduced either by editing the taxon directly in the interface, or in the database itself*.

sciname      | rankid | rankname    | parentstr | object | discipline
-------------|--------|-------------|-----------|--------|------------
Ichnofossil  | 220    | Subcategory | Fossil    | Object | Geology
Vertebrate   | 220    | Subcategory | Fossil    | Object | Geology
Invertebrate | 220    | Subcategory | Fossil    | Object | Geology

sciname             | rankid | rankname    | parentstr          | object | discipline
--------------------|--------|-------------|------------------  |--------|------------
BandedIronFormation | 220    | Subcategory | Minerals And Rocks | object | Geology
Breccia             | 220    | Subcategory | Minerals And Rocks | object | Geology
Calcite             | 220    | Subcategory | Minerals And Rocks | object | Geology
Diamond             | 220    | Subcategory | Minerals And Rocks | object | Geology
Feldspar            | 220    | Subcategory | Minerals And Rocks | object | Geology
Fluorite            | 220    | Subcategory | Minerals And Rocks | object | Geology
Gemstone            | 220    | Subcategory | Minerals And Rocks | object | Geology
Halite              | 220    | Subcategory | Minerals And Rocks | object | Geology
Meteorite           | 220    | Subcategory | Minerals And Rocks | object | Geology
MineralSpecimen     | 220    | Subcategory | Minerals And Rocks | object | Geology
Ore                 | 220    | Subcategory | Minerals And Rocks | object | Geology
Quartz              | 220    | Subcategory | Minerals And Rocks | object | Geology
RockSpecimen        | 220    | Subcategory | Minerals And Rocks | object | Geology

*Note that same pattern of combined names submission was used here to submit the lower rank taxa, but the `parentstr` field contains names already edited (it works)*. 

Last step was to upload specimen information with the now existing non-biological existing tree in Central Thesaurus.

## Anthropology trees


