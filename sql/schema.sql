DROP DATABASE IF EXISTS ;

CREATE DATABASE product-overview;

CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    product_id INTEGER,
    name VARCHAR(100),
    slogan VARCHAR(250),
    description VARCHAR(500),
    category VARCHAR(100),
    default_price INT,
    -- features Foreign Key 
)

CREATE TABLE features (
    feature VARCHAR(100),
    value VARCHAR(100)
)



-- {
--     "id": 7,
--     "name": "Blues Suede Shoes",
--     "slogan": "2019 Stanley Cup Limited Edition",
--     "description": "Touch down in the land of the Delta Blues in the middle of the pouring rain",
--     "category": "Dress Shoes",
--     "default_price": "120",
--     "features": [
--         {
--             "feature": "Sole",
--             "value": "Rubber"
--         },
--         {
--             "feature": "Material",
--             "value": "FullControlSkin"
--         },
--         {
--             "feature": "Stitching",
--             "value": "Double Stitch"
--         }
--     ]
-- }