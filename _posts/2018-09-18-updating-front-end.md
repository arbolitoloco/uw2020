---
layout: post
title:  "Updating the Front-End"
author: "Laura"
tags: 
---

Symbiota originally includes a folder with several CSS files. The general styles are found within `base.css`. In order to override those styles, the suggested best practice would be to modify the file `main_template.css`, renaming it to `main.css`. There are, however, many other CSS files that are called in other pages when necessary.

Pages are somewhat modular, following the PHP principle of including a header, main content and a footer, but there is some redundancy in the head, because it is added explicitly on each page, instead of being included.

The inner content in the pages is structured using fixed width tables, and accessibility tags are commonly not present. Therefore, containers are not responsive out of the box.

There are multiple jQuery versions being used, because of different features needs (usually called in the head).

With Symbiota being a very complete taxonomic management system, there are many pages and functionalities that are not going to be used at the UW2020 portal. Additionally, other pages and features will have to be created so that the final product is fully customized.

# Changes adopted

## File structuring

Pages had to be "cleaned" up to further adopt a DRY (Don't Repeat Yourself) paradigm. This means that everything that is common to all pages in the `head` tags was moved to the file `template-begins.php` (including opening `html` tag and `meta` tags). The closing `head` tag has to be added to the actual page after the call for the `template-begins.php`, because sometimes there is some page-specific code added there (either JS or PHP).

Inside the `template-begins.php` there is also the definition of the pattern for page names, reference for styles and the script for Google Analytics (because we want to track it for every page in the website).



