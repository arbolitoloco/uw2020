/** Generates query properly formatted for upload (taxonomic thesaurus) **/
SELECT DISTINCT FibGeneraParent.TID, 
FibGeneraParent.kingdomName, 
FibGeneraParent.TaxonRankname AS rankname, 
FibGeneraParent.SciName AS scinameinput, 
FibGeneraParent.UnitInd1, 
FibGeneraParent.UnitName1, 
FibGeneraParent.UnitInd2,
FibGeneraParent.UnitInd3,
FibGeneraParent.UnitName3,
FibGeneraParent.Author,
FibGeneraParent.Source,
FibGeneraParent.Notes,
FibGeneraParent.Hybrid,
FibGeneraParent.SecurityStatus,
FibGeneraParent.parenttid AS ParentTid,
parent.rankid AS ParentRankId,
parentrank.rankname AS ParentRank, 
parent.sciname AS ParentStr
FROM FibGeneraParent 
LEFT JOIN fib_symbiota.taxa AS parent  
	ON FibGeneraParent.parenttid = parent.tid 
LEFT JOIN fib_symbiota.taxonunits AS parentrank  
	ON parentrank.rankid = parent.rankid
WHERE parent.rankid = 140 /* Change the values according to parent rank needed for export */