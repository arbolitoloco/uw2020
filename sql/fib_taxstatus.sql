/* Select taxa with sciname from fib_symbiota to include family and notes and later import into uwmuseums */
/* USE fib_symbiota;
CREATE TEMPORARY TABLE FibTaxStatus*/

SELECT taxstatus.tid AS FibTID, taxa.sciname AS Taxon, taxstatus.family, taxstatus.notes
FROM fib_symbiota.taxstatus
LEFT JOIN fib_symbiota.taxa
ON fib_symbiota.taxa.TID = fib_symbiota.taxstatus.tid
WHERE fib_symbiota.taxstatus.family IS NOT NULL;