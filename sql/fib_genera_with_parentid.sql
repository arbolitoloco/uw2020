/*DROP TEMPORARY TABLE FibGeneraParent;*/

USE fib_symbiota;

CREATE TEMPORARY TABLE FibGeneraParent

SELECT genera.*, parenttree.parenttid
FROM FibGenera AS genera
JOIN fib_symbiota.taxaenumtree AS parenttree
	ON genera.tid = parenttree.tid;