---
layout: post
title: "How to Custome Search Methods in Symbiota"
author: "Laura"
permalink: /docs/how-to-customize-searches/
---
The inclusion of the field `occurrenceRemarks` in the Advanced Search is a major improvement to the portal, particularly for the specimens hosted at the Geological Museum and the Anthropology Department, because they usually contain a lot of information that should be accessible to the public.

The following instructions exemplify how to add a field that already exists in the database to the search methods in the Advanced Search forms (using field `disposition` as the example).


Advanced Search is available at `/collections/index.php`. This file includes the class `OccurrenceManager`. 
A form in the `specimendiv` shows the list of collections with specimens, and calls `/collections/harvestparams.php`, selecting collections to be searched according to the user input.
The search form is available at `/collections/harvestparams.php`. This file includes the class `OccurrenceManager`.
The form includes each option that should be searched for. This form is called `harvestparams`, and has an action called `list.php`, which is a POST method, that returns `checkHarvestParamsForm(this)`. The latter is a JS function, located at `js/symb/collections.harvestparams.js`, which does some form validation.

Each field is used in calls in the URL, through the function `setHarvestParamsForm()`.

The class `OccurrenceManager` extends class `OccurrenceTaxaManager`, and includes classes `OccurrenceSearchSupport` (creates collection lists and search forms), `OccurrenceUtilities`, and `ChecklistVoucherAdmin`.

The class `OccurrenceManager` has protected arrays that generate the search terms used in the url method (`searchTermArr`). This array defines which query will be produced by each search term in the database.

So, to customize the search methods, in summary:

1. Determine which query will get the desired results
2. Include the search term and query in the `OccurrenceManager` and `ChecklistVoucherAdmin` classes
3. Include the search field in the `/collections/harvestparams.php` file
4. Include the search term in the `js/symb/collections.harvestparams.js` file to add form validation

# Step By Step Customization

1. Determine which field in the `omoccurrences` table should be added to the search form
2. Open `classes/OccurrenceManager`, and add support to the field in the following (2) functions:

	- `protected function setSqlWhere()`:

			// Example using field "disposition"
			if(array_key_exists("disp",$this->searchTermArr)){
				// splits search string into separate terms
				$dispArr = explode(", ",$this->searchTermArr["disp"]);
				$tempArr = Array();
				// search through each separate term in search string
				foreach($dispArr as $k => $value){
					$value = trim($value);
					if($value == 'NULL'){
						$tempArr[] = '(o.disposition IS NULL)';
						$dispArr[$k] = 'Disposition IS NULL';
					}
					else{
						if(strlen($value) > 4){
							$tempArr[] = '(o.disposition LIKE "%'.$this->cleanInStr($value).'%")';
						}
					}
				}
				$sqlWhere .= 'AND ('.implode(' OR ',$tempArr).') ';
				$this->displaySearchArr[] = implode(' OR ',$dispArr);
			}		
	        // End of example

    - `protected function readRequestVariables()`:

		    // Example using field "disposition"
			// Specimen Criteria
			if(array_key_exists("disp",$_REQUEST)){
				$disp = $this->cleanInputStr($_REQUEST["disp"]);
				if($disp){
					$str = str_replace(",",";",$disp);
					$this->searchTermArr["disp"] = $str;
				}
				else{
					unset($this->searchTermArr["disp"]);
				}
			}    
		    // End of example

3. Open `classes/ChecklistVoucherAdmin.php` and include the desired field in the queries in the following (7) functions:

	- `public function saveQueryVariables($postArr)`:

			// Example using field "disposition"
			$fieldArr = array('country','state','county','locality','disposition','taxon','collid','recordedby','latnorth','latsouth','lngeast','lngwest','latlngor','onlycoord','includewkt','excludecult');
			// End of example

	- `private function parseSqlFrag($sqlFrag)`:

			// Example using field "disposition"
			if(preg_match('/disposition LIKE "%([^%"]+)%"/',$sqlFrag,$m)){
					$retArr['locality'] = trim($m[1],' %');
				}
			// End of example

	- `public function getSqlFrag()`:

			// Example using field "disposition"
			if(isset($this->queryVariablesArr['disposition']) && $this->queryVariablesArr['disposition']){
				$dispositionStr = str_replace(';',',',$this->queryVariablesArr['disposition']);
				$dispArr = explode(',', $dispositionStr);
				$dispStr = '';
				foreach($dispArr as $str){
					$str = $this->cleanInStr($str);
					$dispStr .= 'OR (o.disposition LIKE "%'.$str.'%") ';
				}
				$sqlFrag .= 'AND ('.substr($dispStr, 2).') ';
			}
			// End of example

	- `public function getNewVouchers($startLimit = 500,$includeAll = 1)`:

			// Example using field "disposition"
			if($sqlFrag = $this->getSqlFrag()){
				if($includeAll == 1 || $includeAll == 2){
					$sql = 'SELECT DISTINCT cl.tid AS cltid, t.sciname AS clsciname, o.occid, c.institutioncode, c.collectioncode, o.catalognumber, '.
						'o.tidinterpreted, o.sciname, o.recordedby, o.recordnumber, o.eventdate, o.disposition, CONCAT_WS("; ",o.country, o.stateprovince, o.county, o.locality) as locality '.
						'FROM omoccurrences o LEFT JOIN omcollections c ON o.collid = c.collid '.
						'INNER JOIN taxstatus ts ON o.tidinterpreted = ts.tid '.
						'INNER JOIN fmchklsttaxalink cl ON ts.tidaccepted = cl.tid '.
						'INNER JOIN taxa t ON cl.tid = t.tid ';
			// End of example
			// Further down, still inside it
			$retArr[$r->cltid][$r->occid]['disposition'] = $r->disposition;
			// Further down, inside elseif($includeAll == 3)
			$sql = 'SELECT DISTINCT t.tid AS cltid, t.sciname AS clsciname, o.occid, '.
				'c.institutioncode, c.collectioncode, o.catalognumber, '.
				'o.tidinterpreted, o.sciname, o.recordedby, o.recordnumber, o.eventdate, o.disposition, '.
				'CONCAT_WS("; ", o.country, o.stateprovince, o.county, o.locality) as locality '.
				'FROM omcollections AS c INNER JOIN omoccurrences AS o ON c.collid = o.collid '.
				'LEFT JOIN taxa AS t ON o.tidinterpreted = t.TID '.
				'LEFT JOIN taxstatus AS ts ON t.TID = ts.tid ';
			// Further down, still inside that last elseif($includeAll == 3)
			$sql = 'SELECT DISTINCT t.tid AS cltid, t.sciname AS clsciname, o.occid, '.
				'c.institutioncode, c.collectioncode, o.catalognumber, '.
				'o.tidinterpreted, o.sciname, o.recordedby, o.recordnumber, o.eventdate, o.disposition, '.
				'CONCAT_WS("; ", o.country, o.stateprovince, o.county, o.locality) as locality '.
				'FROM omcollections AS c INNER JOIN omoccurrences AS o ON c.collid = o.collid '.
				'LEFT JOIN taxa AS t ON o.tidinterpreted = t.TID '.
				'LEFT JOIN taxstatus AS ts ON t.TID = ts.tid ';		
			// End of example

	- `public function getMissingTaxaSpecimens($limitIndex)`:

			// Example using field "disposition"
			$sql = 'SELECT DISTINCT o.occid, c.institutioncode ,c.collectioncode, o.catalognumber, '.
				'o.tidinterpreted, o.sciname, o.recordedby, o.recordnumber, o.eventdate, o.disposition'.
				'CONCAT_WS("; ",o.country, o.stateprovince, o.county, o.locality) as locality '.
			// Further down, inside it
			$retArr[$r->sciname][$r->occid]['disposition'] = $r->disposition;		
			// End of example

	- `private function getOccurrenceFieldArr()`:

			// Example using field "disposition"
			$retArr = array('o.family AS family_occurrence', 'o.sciName AS scientificName_occurrence', 'IFNULL(o.institutionCode,c.institutionCode) AS institutionCode','IFNULL(o.collectionCode,c.collectionCode) AS collectionCode',
				'CASE guidTarget WHEN "symbiotaUUID" THEN IFNULL(o.occurrenceID,g.guid) WHEN "occurrenceId" THEN o.occurrenceID WHEN "catalogNumber" THEN o.catalogNumber ELSE "" END AS occurrenceID',
				'o.catalogNumber', 'o.otherCatalogNumbers', 'o.identifiedBy', 'o.dateIdentified',
	 			'o.recordedBy', 'o.recordNumber', 'o.eventDate', 'o.country', 'o.stateProvince', 'o.county', 'o.municipality', 'o.locality', 'o.disposition',
	 			'o.decimalLatitude', 'o.decimalLongitude', 'o.coordinateUncertaintyInMeters', 'o.minimumElevationInMeters', 'o.maximumelevationinmeters',
				'o.verbatimelevation', 'o.habitat', 'o.occurrenceRemarks', 'o.associatedTaxa', 'o.reproductivecondition', 'o.informationWithheld', 'o.occid');
			// End of example	

	- `public function getQueryVariableStr()`

			// Example using field "disposition"
			if(isset($this->queryVariablesArr['disposition'])) $retStr .= $this->queryVariablesArr['disposition'].'; ';	
			// End of example

4. Open `/collections/harvestparams.php` and include the desired search fields:

		// Example using field "disposition"
		<div>
			Disposition: <input type="text" id="disposition" size="43" name="disp" value="" />
		</div>			
		// End of example

5. Open `js/symb/collections.harvestparams.js` and include the search field validation:

	- `function setHarvestParamsForm()`:

			// Example using field "disposition"
			if(urlVar.disp){frm.disp.value = urlVar.disp;}
			// End of example
