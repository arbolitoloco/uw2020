/* First created temp table FibVernaculars using fib_vernaculars.sql */

/* DROP TEMPORARY TABLE UWVernaculars */

/*USE uwmuseums;

CREATE TEMPORARY TABLE UWVernaculars */

SELECT uwmuseums.taxa.TID AS uwTID, uwmuseums.taxa.SciName, FibVernaculars.VernacularName, FibVernaculars.Language, FibVernaculars.Source, FibVernaculars.notes
FROM uwmuseums.taxa
LEFT JOIN FibVernaculars
  ON uwmuseums.taxa.SciName = FibVernaculars.sciname
WHERE VernacularName IS NOT NULL;
