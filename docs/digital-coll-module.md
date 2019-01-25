---
layout: post
title:  "Digital Collections Module"
author: "Laura"
tags: 
---



Example URL: `http://localhost:8888/SymbiotaUW/checklists/digitalcollection.php?clid=3&pid=&dynclid=0

Species/Taxon div:

id="taxaDiv"

`<div class="tndiv">
	<div class="tnimg" style="">
		<a href="../taxa/index.php?taxauthid=1&amp;taxon=1853&amp;clid=3" target="_blank"><img src="https://api.idigbio.org/v2/media/02d179b83dab66482d4b4c2409d28918?size=thumbnail">
		</a>
	</div>
	<div style="clear:both">
		<a href="../taxa/index.php?taxauthid=1&amp;taxon=1853&amp;clid=3" target="_blank"><b>Morone chrysops</b>
		</a>
		<div class="editspp printoff" style="float:left;display:none;">
			<a href="#" onclick="return openPopup('clsppeditor.php?tid=1853&amp;clid=3','editorwindow');">
			<img src="../images/edit.png" style="width:13px;" title="edit details">
			</a>
		</div>
	</div>
</div>`


Function that selects a specific checklist and displays for each voucher, in one page:
occurrence id -> catalog number
taxon
img url (when available)
label info
+ checklist description

Open PHPMyAdmin and figure out how to find img url for specimen using their id. Then find the url that gets the img url and outputs it as json. (for instance, to open voucher info on another window, user has to click <a href="#" onclick="return openIndividualPopup(36687)">UWZM-F-0001053 1946-10-29 [UWZM]</a>)

It seems like "Display As Images" option in checklists only shows the "taxon" img, not the particular voucher img.

Table `fmvouchers`
TID -> fmchklststaxalink -> taxon id from 
CLID -> fmchklststaxalink -> checklist id from 
occidPrimary -> omoccurrences (specimens)
preferredImage
Notes
InitialTimeStamp

// Query that will select vouchers and images in a checklist
SELECT DISTINCT ts.tidaccepted AS tid, v.occid, c.institutioncode, v.notes, o.catalognumber, o.recordedby, o.recordnumber, o.eventdate, o.collid, i.url
FROM fmvouchers v 
INNER JOIN omoccurrences o ON v.occid = o.occid
INNER JOIN images i ON v.occid = i.occid
INNER JOIN omcollections c ON o.collid = c.collid
INNER JOIN taxstatus ts ON v.tid = ts.tid
ORDER BY o.collid;




Checklist name

Checklist name with "Key" Games

Authors:

Abstract:

<hr>

Total specimens: 

Image
Taxon (with link)
Voucher summary (with link)


