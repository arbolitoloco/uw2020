/*DROP TEMPORARY TABLE FibGenera*/

USE fib_symbiota;

CREATE TEMPORARY TABLE FibGenera

SELECT fib_symbiota.taxa.TID, 
	fib_symbiota.taxa.kingdomName, 
	fib_symbiota.taxa.KingdomID,
	fib_symbiota.taxa.RankId AS TaxonRankId,
	fib_symbiota.taxonunits.rankname AS TaxonRankName,
	fib_symbiota.taxa.SciName,
	fib_symbiota.taxa.UnitInd1,
	fib_symbiota.taxa.UnitName1,
	fib_symbiota.taxa.UnitInd2,
	fib_symbiota.taxa.UnitName2,
	fib_symbiota.taxa.UnitInd3,
	fib_symbiota.taxa.UnitName3,
	fib_symbiota.taxa.Author,
	fib_symbiota.taxa.Source,
	fib_symbiota.taxa.Notes,
	fib_symbiota.taxa.Hybrid,
	fib_symbiota.taxa.SecurityStatus
FROM fib_symbiota.taxa
LEFT JOIN fib_symbiota.taxonunits 
	ON fib_symbiota.taxa.rankid = fib_symbiota.taxonunits.rankid
WHERE fib_symbiota.taxa.rankid = 180 
	OR fib_symbiota.taxonunits.rankname = 'genus'
ORDER BY fib_symbiota.taxa.TID;

