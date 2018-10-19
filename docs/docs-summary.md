---
layout: post
title: "Documentation Summary"
author: "Laura"
permalink: /docs/docs-summary/
---

# Symbiota Installation
Following instructions found at [Symbiota's documentation](http://symbiota.org/docs/installation-instructions/) and some trial and error, this is the step-by-step to install a Symbiota portal:
1. Prototype development started with [Symbiota version 1.0](https://github.com/Symbiota/Symbiota/releases) (cloned from Github 2018-05-11)
2. Created empty MySQL database in phpMyAdmin
3. Added reader and writer users to database, giving them the adequate permissions to interact with the schema (in phpMyAdmin)
4. Imported schema update files to database from `/config/schema-1.0` (in phpMyAdmin)
5. Edited /config/dbconnection.php with database credentials
6. Edited /config/symbini.php with general configurations, had issues with relative paths - fixed (pay attention to `$CLIENT_ROOT` path)
7. Server admin granted user privileges
8. First empty portal successfully running!

Some issues may arise due to folder/file access configurations in the server, so one must be sure that the server admin has granted your reader and writer users the correct read/write permissions, otherwise some scripts will not be able to run (for instance the taxonomic tree import script).

For a detailed step-by-step guide on how to install a Symbiota portal in a local server see:
- [Tutorial: Installing a Symbiota portal for testing on a local server]() - **coming soon**

# Data Input/Import

## Taxa
As per Symbiota documentation, the first step to establish a data portal is to import a general taxonomic thesaurus, so that specimens can be subsequently added to an existing taxonomic schema/tree.
For biological collections, higher level taxonomic trees have been initially imported from ITIS. Additional thesauri have been imported from existing databases.
The Anthropology Museum curator has crafted a hierarchical classification of non-biological items, which has been imported into the general taxonomic thesaurus.
A similar solution is expected to be provided to the non-biological specimens belonging to the Geology Museum.
After a thesaurus is established, collection profiles can be generated and specimens then imported.
Step-by-step guides are provided here:
- How to import a Taxonomic Thesaurus - **coming soon**
- How to import Vernaculars - **coming soon**

Further insights can be checked in the prototype development journal here:
- [Importing Existing Data: Herbarium](https://arbolitoloco.github.io/uw2020/2018-07-13-importing-data-herbarium)
- [Importing Existing Data: Vernaculars](https://arbolitoloco.github.io/uw2020/2018-07-20-importing-vernaculars)

## Collections
Collections are taxa and museum-based, both for historical reasons and for purposes of easier data updating and organizing. For instance, the Herbarium has five different collections: Bryophytes, Vascular Plants, Lichens, Fungi, and Vascular Non-Wisconsin Plants.

## Specimens
Specimens are stored in Symbiota as occurrences. The main table containing specimen information is called *fmoccurrences*. 

# Front-End

## Base styles
Base styles are implemented using Foundation framework by ZURB. Templating in Symbiota does not follow other PHP guidelines, as the head will change according to the page you are visiting, therefore styles and scripts are page-specific. To work around this, Foundation's styles have been added to the css folder and renamed as such:
- `foundation.css` renamed to `base.css`
- `app.css` renamed to `main.css`
JavaScript will have to be added later for cross compatibility.
**Working on changing headers and footers to allow for better styling**

# Features

# Versioning and Backups
Local staging is version tracked with Git. There is a remote private repository at Bitbucket. Additional backups are scheduled frequently to a private folder. The production server is made available by the Math department (Fibonacci server). Databases are frequently backed up using phpMyAdmin.

# Guide to Symbiota's official documentation
Sometimes it can be hard to find the right information on Symbiota's official documentation, so I'm listing here links that might be helpful and are often scattered on [http://symbiota.org](http://symbiota.org). I'm also commenting on what I personally think has to be further explained (and if I'm working on it).

## Help pages
- [Symbiota Help Pages](http://symbiota.org/docs/symbiota-introduction/symbiota-help-pages/)

## Introduction and Installation
- Installing a new portal: [Establishing a Regional Flora or Fauna](http://symbiota.org/docs/symbiota-introduction/establishing-a-regional-flora-or-fauna/) - **working on adding more details** 
- Establishing interaction between different database solutions and Symbiota: [Interoperability of Specimen Data](http://symbiota.org/docs/specimen-search-engine/interoperability-of-specimen-data/) 

## Specimens
- [Specimen fields that can be imported into a Symbiota data portal](http://symbiota.org/docs/wp-content/uploads/SymbiotaOccurrenceFields.pdf) - **somewhat outdated, needs more details**
- [Specimen Upload Procedure](http://symbiota.org/docs/specimen-upload-procedure-2/) - good initial information for portal admins
- [Loading Specimen Data](http://symbiota.org/docs/symbiota-introduction/loading-specimen-data/) - **working on adding more details, especially related to using the graphic interface and sql procedures**
- [Batch Loading Specimen Images](http://symbiota.org/docs/batch-loading-specimen-images-2/) - **needs more details**

## Images
- [Image Library](http://symbiota.org/docs/image-library/)
- [Image Submission](http://symbiota.org/docs/image-submission-2/)