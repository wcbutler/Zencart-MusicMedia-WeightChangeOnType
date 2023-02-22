-- PLEASE NOTE, this work with my category names and naming convention, you may need to change for your needs. 
-- Always backup your database before a mass change. Thanks - Will Butler - 2/21/2023 - wcbutler.io

-- 7"s
UPDATE  zencart.products p
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.25 -- 4 ounces
WHERE  cd.categories_name = 'Small Vinyl';

-- LP no 10" no gatefold/double LP
UPDATE  zencart.products p
inner join zencart.products_description pd on p.products_id = pd.products_id
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 1.0625 -- 1lb 1 ounce
WHERE  cd.categories_name = 'Large Vinyl'
AND ((pd.products_name not like '%10"%') OR ((pd.products_name not like '%gatefold%') OR (pd.products_name not like '%2XLP%') OR (pd.products_name not like '%2LP%')  OR (pd.products_name not like '%2X10"%'));

-- 10" no LP not gatefold
UPDATE  zencart.products p
inner join zencart.products_description pd on p.products_id = pd.products_id
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.9375 -- 15 ounces
WHERE  cd.categories_name = 'Large Vinyl'
AND pd.products_name like '%10"%'
AND ((pd.products_name not like '%gatefold%') OR (pd.products_name not like '%2X10"%'));

-- GATEFOLD & 2XLPs
UPDATE  zencart.products p
inner join zencart.products_description pd on p.products_id = pd.products_id
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 1.375 -- 1lb 6 ounces
where cd.categories_name = 'Large Vinyl'
AND ((pd.products_name like '%gatefold%') OR (pd.products_name like '%2XLP%') OR (pd.products_name like '%2LP%') OR (pd.products_name like '%2X10"%'));

-- POSTERS
UPDATE  zencart.products p
inner join zencart.products_description pd on p.products_id = pd.products_id
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.125 -- 2 ounces
WHERE  pd.products_name like '%poster%';

-- CDs
UPDATE  zencart.products p
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.25 -- 4 ounces
WHERE  cd.categories_name = 'CDs';

UPDATE zencart.products p
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.9375 -- 15 ounces
WHERE  cd.categories_name = 'Shirts';

-- BUTTONS
UPDATE zencart.products p
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.0625 -- 1 ounce
WHERE  cd.categories_name = 'Buttons';

-- STICKERS
UPDATE zencart.products p
inner join zencart.products_description pd on p.products_id = pd.products_id
inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id 
inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
SET p.products_weight = 0.0625 -- 1 ounce
WHERE  pd.products_name like '%sticker%';


-- 1 oz	0.0625 lbs
-- 2 oz	0.125 lbs
-- 3 oz	0.1875 lbs
-- 5 oz	0.3125 lbs
-- 10 oz	0.625 lbs
-- 16 oz 1.000 lbs
-- 20 oz	1.25 lbs

-- BELOW ARE MY ORIGINAL TESTING STATEMENTS-------------------------------- 

-- select * from zencart.products p -- checking statement for small vinyl
-- inner join zencart.products_description pd on p.products_id = pd.products_id
-- inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id
-- inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
-- where cd.categories_name = 'Small Vinyl'

-- select * from zencart.products p -- checking statement LPs
-- inner join zencart.products_description pd on p.products_id = pd.products_id
-- inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id
-- inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
-- where cd.categories_name = 'Large Vinyl'
-- AND pd.products_name not like '%10"%'

-- select * from zencart.products p -- checking statement 10"s
-- inner join zencart.products_description pd on p.products_id = pd.products_id
-- inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id
-- inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
-- where cd.categories_name = 'Large Vinyl'
-- AND pd.products_name  like '%10"%'

-- select * from zencart.products p -- checking gatefold LPs
-- inner join zencart.products_description pd on p.products_id = pd.products_id
-- inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id
-- inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
-- where cd.categories_name = 'Large Vinyl'
-- AND ((pd.products_name like '%gatefold%') OR (pd.products_name like '%2XLP%') OR (pd.products_name like '%2LP%') )

-- select * from zencart.products p -- checking statement 10"s
-- inner join zencart.products_description pd on p.products_id = pd.products_id
-- inner join zencart.products_to_categories ptc on p.products_id = ptc.products_id
-- inner join zencart.categories_description cd on ptc.categories_id = cd.categories_id
-- where pd.products_name like '% sticker%'

