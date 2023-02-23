-- 03. SELECTS / Servants, Products, Purchases

--  Einzeltabellen
SELECT * FROM mydb.servants;
SELECT * FROM mydb.products;
SELECT * FROM mydb.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT
*
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Patrick/Peter gekauft?
SELECT
	servant_name AS Diener,
	product_name AS " Von X gekaufte Produkte: "
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Yunaisy"
;

-- Wieviele Produkte hat Yunaisy gekauft?
SELECT
CONCAT(servant_name," kaufte ",COUNT(product_name)," Produkte.") AS Kaufhandlung
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Martin"
;

-- Wieviel Geld hat Yunaisy ausgegeben? 
SELECT
	servant_name AS Diener, -- organisch
    COUNT(servant_name) AS Artikelanzahl, -- aggregiert/f()
    SUM(product_price) AS Gesamtkaufpreis -- aggregiert/f()
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY servant_name
HAVING servant_name = "Yunaisy"
;

-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE
SELECT
servant_name AS Diener,
product_name AS "Irgendwas mit Sauce oder Lachs"
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE product_name LIKE "%Lachs" OR product_name LIKE "%Sauce" 
;

-- Wie oft wurde das Produkt X gekauft?
SELECT
product_name AS Produkt,
COUNT(product_name) AS Anzahl 
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
ORDER BY Anzahl DESC
;

-- Welche Umsätze hatte das Produkt X?
SELECT
product_name AS Produkt, -- nicht aggr. 
COUNT(product_name) AS Anzahl, -- aggr. 
SUM(product_price) AS Umsatz -- aggr. // count() * price
FROM mydb.purchases 
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
ORDER BY Umsatz DESC
;
