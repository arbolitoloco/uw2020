INSERT INTO uwmuseums.taxavernaculars
( TID, VernacularName, Language, Source, notes
)
SELECT uwTID, VernacularName, Language, Source, notes
FROM uwmuseums.UWVernaculars;