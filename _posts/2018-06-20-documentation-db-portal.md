---
layout: post
title:  "Documentation for Databases and the Portal"
author: "Laura"
tags: documentation in-progress specs
---

Writing detailed documentation is one of the most important aspects of software development. The documentation offered here aims to provide technical information on all aspects of the portal's development, as well as database integration and update. The complete documentation is constantly updated [here](#).

## Databases
The UW Natural History Museums Council is comprised of five major museums, each one containing one or multiple collections, that may take advantage of one or more databasing solutions, some of which are being transitioned to different platforms. Currently, the following technologies are being used to manage specimen data:
- Specify;
- Symbiota live management;
- Symbiota snapshot management;
- FileMaker Pro;
- Past Perfect;
- Microsoft Access 97.


## Portal
The back-end is built on top of the Symbiota framework, which is PHP-based. The database in Symbiota is MySQL.
The front-end is built using ZURB's Foundation framework.

## Challenges
- Integrating non-biological collections into the unified snapshot database (Geology and Anthropology).
- Creating an adequate updating system for each database solution.
- Managing image servers and integrating them into Symbiota's database.
- Server performance on searches.
- Tweaking the map search offered by Symbiota.
- Automating backups.
- Tweaking Symbiota and adding new features.

