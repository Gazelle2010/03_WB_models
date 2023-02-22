-- SELECTS 1:1

-- Einzeltabellen
SELECT * FROM mydb.cats;
SELECT * FROM mydb.servants;

-- Kreuzprodukt (Kartesisches Produkt)
SELECT * FROM mydb.cats JOIN mydb.servants; 

-- Kreuzprodukt (gefiltert)
SELECT * FROM mydb.cats JOIN mydb.servants
WHERE cat_name = "Grizabella"
;   

-- Inner Join 1 / Gesamte Tabelle
SELECT 
	*
 FROM  mydb.cats INNER JOIN mydb.servants
 -- Werte Primärschlüssel/MT  = Werte Fremdschlüssel/DT
 ON mydb.cats.id = mydb.servants.cats_id
 ;
 
 -- Inner Join 2 / (Wer dient wem?)
 -- Wer dient Grizabella?
 -- Wem dient Yunaisy?
 SELECT
	  cat_name AS Herrschaft,
      servant_name AS Diener
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE cat_name = "Grizabella"
;
SELECT
	  cat_name AS Herrschaft,
      servant_name AS Diener
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE servant_name = "Yunaisy"
;

-- Inner Join 2a / (Wer dient wem?)
-- "X ist der Diener von Y"  / Dienstverhältnis

 SELECT
	  CONCAT(servant_name, " ist der Diener von ", cat_name, ".") AS Dienstverhältnis
FROM mydb.cats INNER JOIN mydb.servants
ON mydb.cats.id = mydb.servants.cats_id
WHERE servant_name = "Yunaisy"
;