---
layout: post
title:  "Front-End Updates Timeline"
author: "Laura"
tags: 
---

# Content

Additional pages were created:
[x] about.php
[x] digital-collections.php
[x] help.php
[x] map-search-info.php
[x] museums.php
[x] sitetools.php
[x] template.php

# Head Includes

The following files were initially edited to include custom styles (added to uw theme folder):
[x] index.php
[x] sitemap.php
[x] collections/index.php
[x] collections/individual/index.php
[x] collections/map
[x] imagelib/index.php
[x] imagelib/search.php
[x] profile/index.php
[x] profile/viewprofile.php
[x] profile/newprofile.php

Additional files that had custom styles included (and head includes changed):
[x] sitetools.php
[x] checklists/checklist.php
[x] checklists/checklistadmin.php
[x] checklists/dynamicmap.php
[x] collections/cleaning/index.php
[x] collections/cleaning/taxonomycleaner.php
[x] collections/misc/collmetadata.php
[x] collections/misc/collprofiles.php
[x] ident/key.php -- identification keys
[x] ident/index.php -- identification keys
[x] ident/admin/index.php -- identification keys
[x] ident/admin/chardetails.php -- identification keys
[x] ident/tools/editor.php -- identification keys (char editor for species?)
[x] taxa/taxonomy/taxonomydisplay.php


1. Add page title variable to first PHP block

		$PAGE_TITLE = 'Specific page title';

2. Create file `template-begins.php` at root with:

		<!-- Template begins -->

		<!-- Doctype, head and meta -->
		<!DOCTYPE html class="no-js" lang="en" dir="ltr">
		<html>
		<head>
			<meta http-equiv="X-Frame-Options" content="deny">
			<meta charset="utf-8">
			<meta http-equiv="x-ua-compatible" content="ie=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<title><?php echo $DEFAULT_TITLE . " | " . $PAGE_TITLE  ?></title>

			<!-- Custom Styles -->
			<?php include($SERVER_ROOT.'/assets/styles.php');?>

3. Remove opening `html` tag and add include reference to `template-begins.php`:

4. Create file with custom styles at `/css/styles.php`, containing:

		<!-- Assets paths --> 
		<?php 
		$CSS_PATH = $CLIENT_ROOT.'/css/';
		$IMG_PATH = $CLIENT_ROOT.'/css/images/';
		$JS_PATH = $CLIENT_ROOT.'/js/';
		?>

		<!-- Symbiota's base styles, edited to keep only functional styles -->
		<link rel="stylesheet" type="text/css" href="<?php echo $CSS_PATH. 'base-original.css' ?>">
		<link rel="stylesheet" type="text/css" href="<?php echo $CLIENT_ROOT. '/css/jquery-ui.css' ?>">

		<!-- Custom styles -->
		<link rel="stylesheet" type="text/css" href="<?php echo $CSS_PATH. 'base-original.css' ?>">

		<!-- JavaScript -->
		<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
		<script type="text/javascript" src="<?php echo $CLIENT_ROOT.'/js/jquery.js?ver=20130917' ?>"></script>
		<script type="text/javascript" src="<?php echo $CLIENT_ROOT.'/js/jquery-ui.js?ver=20130917' ?>"></script>



5. Add include reference to custom styles:

		<!-- Custom Styles -->
		<?php include($SERVER_ROOT.'/css/styles.php');?>


