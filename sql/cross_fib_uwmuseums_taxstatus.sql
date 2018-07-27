/* Creates table with uwmuseums TID crossed with FibTaxStatus */
/*USE uwmuseums;
CREATE TEMPORARY TABLE UWTaxStatus
DROP TEMPORARY TABLE UWTaxStatus;*/

/*SELECT uwmuseums.taxa.TID, FibTaxStatus.Taxon, FibTaxStatus.family, FibTaxStatus.notes 
FROM FibTaxStatus
JOIN uwmuseums.taxa
ON FibTaxStatus.Taxon = uwmuseums.taxa.sciname;*/

/* Repeats uwmuseums.taxa.TID as tidaccepted to allow for update */
SELECT uwmuseums.taxa.TID, uwmuseums.taxa.TID AS tidacc, FibTaxStatus.Taxon, FibTaxStatus.family, FibTaxStatus.notes 
FROM FibTaxStatus
JOIN uwmuseums.taxa
ON FibTaxStatus.Taxon = uwmuseums.taxa.sciname;