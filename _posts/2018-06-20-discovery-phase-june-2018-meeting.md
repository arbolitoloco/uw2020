---
layout: post
title:  "Discovery phase: June 2018 meeting"
author: "Laura"
tags: done
---
Closes issues [#1](https://github.com/arbolitoloco/uw2020/issues/1), [#2](https://github.com/arbolitoloco/uw2020/issues/2), [#3](https://github.com/arbolitoloco/uw2020/issues/3), and [#4](https://github.com/arbolitoloco/uw2020/issues/4)

## Meeting topics

1. Web development plan overview
2. Discovery questions and feature suggestions
3. Preliminary wireframes 

## Web development plan overview
Web development normally includes five major phases:
- Discovery: site map, content definition, technology stack, target audience, main goals
- Back-End: Symbiota installation, databases setup, server installation, collections setup, taxonomic thesauri, specimens upload, image servers, feature coding, database interaction automation, security
- Front-End: layout, wireframes, color palette, branding, responsive design, mock-ups, User Experience, web standards, accessibility
- Testing: database performance, user inputs, accessibility, cross-browser compatibility, responsiveness, security, server perfomance, backup automation
- Launch: domain, documentation, updates


## Discovery questions and feature suggestions

### What is the main goal of the portal?
The portal aims to be an integrated search tool, to showcase in one space all of the natural history collections available on campus. It should be the entry point for people to look for specimens that are hosted at UW, and should direct the audience towards each museum's own page when looking for details.

### Who is our target audience?
There are two main audiences targeted: specialists (scientists or science enthusiasts) and the general public interested in natural history.

### How are we displaying the information for the different publics?
The regular Symbiota setup will be used to display specimen and taxonomic information to specialists. A contact form should be available for specialists to get in touch with curators in case they would like to request detailed information on specimens searched for in the portal. An advanced search will be provided specifically for this public.
The general public will be served with a quicksearch tool, that should include vulgar names. There will also be an effort to generate public outreach with interactive tools that are fun, such as a random search, curated collections with curious themes, and search by birthday, for instance. Each museum will also be introduced in a separate page, as to generate awareness for the importance of them to the broader audience.
The map search and the image search will serve both audiences.


### Site map

Symbiota comes out of the box as a very complex tool that serves a lot of purposes. Since we are not using it as collection management system at all, I propose to simplify the interface as much as possible, as to help users of all privilege levels to find things easier.
A suggested site map structure follows:

- Home page 
	- Hero: introduction
	- Collections
	- Gallery with random images
	- Quicksearch
	- Link to map search
	- Browse options
	- Gallery with virtual Exhibitions
	- Events from each Museum, maybe?
- Search
	- Advanced Search (scientists; full Symbiota form, tailored a little to accommodate non-biological collections) with contact form to request further details from curator
	- Quick Search (general public; generic Symbiota field that searches for genus, species or common name)
	- Map Search (tweak Symbiota to show "taxonomic" thumbnails and maybe images; and explain to the user how the map search works)
	- "Quirky Search" (search specimens collected on my birthday, get random specimen, get random taxon)
- Taxa (browse taxonomic trees)
Currently, Symbiota does not present the complete taxonomic tree for view. That means the user has to have previous knowledge to search for something. If we give them the possibility to know what is in the database that would save the user a lot of trial/error.
	- Taxon profiles for higher taxa only
- Images
	- Browse Images by taxon
	- Random gallery
	- Theme image galleries (from curated lists of specimens or taxa)
- Museums/Collections Information
	- UW Natural History Museums Council background; with summed up information for each Museum/Collection, links, location, curators
- Virtual Exhibitions (curated lists of specimens or taxa)
	- Gallery or list of exhibitions
- 404 Error Page
- Data usage permissions/Copyright policy		


## Preliminary wireframes

Preview available [here](http://fibonacci.math.wisc.edu/~rocha/mockup/). Coded with Foundation framework by ZURB.

## Links mentioned

- [Minnesota Biodiversity Atlas](http://bellatlas.umn.edu/imagelib/index.php): Symbiota portal
- [Great Lakes Invasives](http://greatlakesinvasives.org/portal/): Symbiota portal
- [Natural History Museum London](http://data.nhm.ac.uk/): CKAN portal
- [California Academy of Sciences](https://monarch.calacademy.org/)
- [Museum für Naturkunde Berlin](https://www.museumfuernaturkunde.berlin/de/forschung/sammlungen)
- [Consortium of Northeastern Herbaria](http://portal.neherbaria.org/portal/checklists/checklist.php?cl=28) (two different kinds of maps; simple and advanced)
- [Friends of the UMMP Michigan Basin Specimen](http://michiganbasinfossils.org/)
- [VertNet](http://vertnet.org/)
- [Smithsonian Tropical Research Institute](http://stricollections.org/portal/collections/map/index.php)

## Other topics

- A list of Symbiota's available fields for the occurrence (specimen) tables has been discussed (it can be found [here]()). Each curator had previously talked about which data should be available, and apparently they can all fit in the Symbiota specimen model.
- The possibility of having registered users from the general public (similar to what happens in the Wisconsin Flora portal) has been discussed. For now it has been decided that the only users that should be able to login on the portal are the curators and site admins.
- The search screens have been discussed regarding their features to different publics. Brooke brought an example of a search performed at the Smithsonian Institution public database, using a vernacular (spiders) as a search term. I discussed the future possibility of incorporating Stratigraphy in the searches. I also suggested that we provide taxonomic trees for non-biological objects. 
- It has been suggested that the searches should be improved, to include vernaculars and to provide better partial matches or wildcards in the live search. Search performance has to be tested to check if improvement is possible.
- There should be an indicator of how dates can be searched for.
- Taxon profiles are going to be available, whenever possible, only to higher level groups (i. e. Insects, Plants, Archeological Objects), because they are not available in all collections. In the case of the Herbarium, the taxonomic profile may be linked to their source in the Herbarium website.
- Specimen tables should be available for download by users.
- A disclaimer should be added about the status of collections' digitization (percentage of inventory digitized) and about data usage (a copyright policy must be picked by each collection). 
- A button directing the user to a contact form should be available to users that would like to know more about a particular dataset. That contact form should deliver a message to the relevant curator.
- Figure out how to track user information and usage, so that statistics on database usage can be generated and incorporated into future reports.
- Map search should have shortcuts to search by higher taxon/object type. User has to be informed on usage of map search. A disclaimer should be added to inform users that not all specimens are georeferenced and therefore will not appear on maps.
- The possibility of linking specimens has been considered (for instance hosts with parasites).



## Presentation

Available as a PDF [here](docs/2018_06-UW2020-Meeting.pdf).
