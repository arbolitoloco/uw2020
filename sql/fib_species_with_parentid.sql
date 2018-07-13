/*DROP TEMPORARY TABLE FibSpeciesParent;

USE fib_symbiota; 

CREATE TEMPORARY TABLE FibSpeciesParent */

SELECT DISTINCT species.*, parenttree.parenttid
FROM FibSpecies AS species
JOIN fib_symbiota.taxaenumtree AS parenttree
	ON species.tid = parenttree.tid;