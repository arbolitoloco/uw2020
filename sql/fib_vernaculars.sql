/* USE fib_symbiota;

CREATE TEMPORARY TABLE FibVernaculars */

SELECT taxa.tid AS taxaTID, taxa.sciname, taxavernaculars.TID as vernTID, taxavernaculars.VernacularName, taxavernaculars.Language, taxavernaculars.Source, taxavernaculars.notes
FROM fib_symbiota.taxavernaculars
LEFT JOIN fib_symbiota.taxa
	ON fib_symbiota.taxa.tid = fib_symbiota.taxavernaculars.tid
ORDER BY sciname;