---
layout: post
title:  "Adding quick search with vernaculars"
author: "Laura"
tags: 
---

While Symbiota includes a quick search box built in at the home page, it was requested that I'd add vernaculars to the quick search, and that it is placed in the page's header.
The quickest solution was to mimic something implemented by Ben Brandt at the Flora of Wisconsin.

Files/snippets that were added:

- Quick search box HTML/PHP snippet added to `header.php`, further styled to match UW's general design guidelines;
- Added quick search support to `template-begins.php`:

		<?php  
			// Adds quicksearch with vernacular class
			include($SERVER_ROOT.'/classes/TaxonQuickSearchManager.php');
			// Adds quicksearch with vernacular 
			$taxon = array_key_exists("taxon",$_REQUEST)?trim($_REQUEST["taxon"]):"";
			$imgLibManager = new TaxonQuickSearchManager();
		?>

- Included new class `TaxonQuickSearchManager.php`, that extends 