/*SELECT DISTINCT parenttid
FROM FibGeneraParent
ORDER BY parenttid; */

/* Gets Genera and Tribe (when available) 
SELECT DISTINCT FibGeneraParent.TID, FibGeneraParent.sciname AS TaxName, parenttid, parent.sciname AS ParentName, parent.rankid AS ParentRankId
FROM FibGeneraParent
JOIN fib_symbiota.taxa AS parent
	ON FibGeneraParent.parenttid = parent.tid
WHERE parent.rankid = 160; */

SELECT DISTINCT FibGeneraParent.TID, 
FibGeneraParent.kingdomName, 
FibGeneraParent.TaxonRankname AS rankname, 
FibGeneraParent.SciName, 
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
FibGeneraParent.parenttid,
parent.rankid AS ParentRankId,
parentrank.rankname AS ParentRank, 
parent.sciname AS ParentName
FROM FibGeneraParent
LEFT JOIN fib_symbiota.taxa AS parent
	ON FibGeneraParent.parenttid = parent.tid
LEFT JOIN fib_symbiota.taxonunits AS parentrank
	ON parentrank.rankid = parent.rankid
WHERE parent.rankid = 140;
