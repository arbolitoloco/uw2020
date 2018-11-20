---
layout: post
title: "Project Overview - Milestones"
author: "Laura"
permalink: /docs/project-overview-milestones/
---

## Data

### Data standards
[] Create document explaining each field in Symbiota and their Darwin Core equivalent
[] Create documents explaining each field used by each database solution on campus
	[] Herbarium - Bryophytes
	[] Herbarium - Lichens
	[] Herbarium - Fungi
[] Create spreadsheet containing equivalent in each database to Darwin Core fields

### Data import
[] Import preliminary data from Entomology
[] Import data from Zoology - Specify or spreadsheets
[] Import preliminary data from Anthropology
	[] Agree on basic working taxonomic thesaurus
	[] Test using Lots as genera and catalog numbers as species
[] Import preliminary data from Geology
	[] Agree on basic working taxonomic thesaurus

### Database updating
[] Create import profile for each collection in Herbarium - Specify, Symbiota
[] Create import profile for Entomology - Specify
[] Create import profile for Zoology - Specify
[] Create import profile for Anthropology 
	[] Shared folder to drop in spreadsheets that can be searched for with a script and then imported to database?
[] Create import profile for Geology
	[] Shared folder to drop in spreadsheets that can be searched for with a script and then imported to database?

## Features

### Advanced search
[] Implement search by "Remarks" (table `omoccurrences` field `occurrenceRemarks`)
	[] Understand how the search for occurrences work in the back-end

### Random search
[] Implement on click search displaying photo on home

### Virtual Exhibitions
[] Use checklist feature to create virtual exhibitions
[] Create module to display those exhibitions in the front-end as a slideshow

### Map search
[] Troubleshooting on Firefox
[] Get a Google API Key? Ask Sara
[] Install spatial module? Maybe not

## Front-End

### Styles

## Security
[] List files that should be private (accessed only by `localhost`) vs. public
[] Hide Profile/Login pages from the public outside campus