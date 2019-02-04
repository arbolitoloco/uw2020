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

Symbiota accommodates many taxonomic levels under each Domain, from Kingdom to Form. The categories levels can have different names (defined field `rankname`) and are ordered following their rank number (field `rankid`).

I'm taking advantage of that built-in characteristic, by defining the following categories in table `taxonunits`:

`kingdomName` | `rankid` | `rankname`          | Parent Rank         | `dirparentrankid` | `reqparentrankid` | equivalent
Object        | 1        | Object              | Object              | 1                 | 1                 | Organism
Object        | 10       | Geological Specimen | Object              | 1                 | 1                 | Kingdom
Object        | 20       | Fossil              | Geological Specimen | 10                | 10                | Subkingdom
Object        | 20       | Mineral Specimen    | Geological Specimen | 10                | 10                | Subkingdom


