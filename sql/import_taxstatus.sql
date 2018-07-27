/* turn off safe mode*/
/*SET SQL_SAFE_UPDATES = 0;*/

UPDATE uwmuseums.taxstatus AS tbu, UWTaxStatus AS stb
SET tbu.family = stb.family, tbu.notes = stb.notes
WHERE tbu.tid = stb.TID;