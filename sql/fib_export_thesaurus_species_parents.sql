/** Generates query properly formatted for upload (taxonomic thesaurus) **/
SELECT DISTINCT FibSpeciesParent.TID, 
FibSpeciesParent.kingdomName, 
FibSpeciesParent.TaxonRankname, 
FibSpeciesParent.SciName AS scinameinput, 
FibSpeciesParent.UnitInd1, 
FibSpeciesParent.UnitName1, 
FibSpeciesParent.UnitInd2,
FibSpeciesParent.UnitInd3,
FibSpeciesParent.UnitName3,
FibSpeciesParent.Author,
FibSpeciesParent.Source,
FibSpeciesParent.Notes,
FibSpeciesParent.Hybrid,
FibSpeciesParent.SecurityStatus,
FibSpeciesParent.parenttid AS ParentTid,
parent.rankid AS ParentRankId,
parentrank.rankname, 
parent.sciname AS ParentStr
FROM FibSpeciesParent 
LEFT JOIN fib_symbiota.taxa AS parent  
	ON FibSpeciesParent.parenttid = parent.tid 
LEFT JOIN fib_symbiota.taxonunits AS parentrank  
	ON parentrank.rankid = parent.rankid
WHERE parent.rankid = 180;