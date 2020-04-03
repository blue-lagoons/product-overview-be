DROP DATABASE IF EXISTS ;

CREATE DATABASE product-overview;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    name VARCHAR(100),
    slogan VARCHAR(250),
    description VARCHAR(500),
    category VARCHAR(100),
    default_price INTEGER,
    features INTEGER Foreign Key 
)

CREATE TABLE features (
    id SERIAL PRIMARY KEY,
    product_id INTEGER FOREIGN KEY,
    feature VARCHAR(100),
    value VARCHAR(100)
)

CREATE TABLE styles (
    id SERIAL PRIMARY KEY,
    product_id INTEGER FOREIGN KEY,
    name VARCHAR(100),
    sale_price INTEGER,
    original_price INTEGER,
    default_style VARCHAR(100)
)

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    style_id INTEGER FOREIGN KEY,
    url VARCHAR(150)
)

CREATE TABLE skus (
    id SERIAL PRIMARY KEY,
    style_id INTEGER FOREIGN KEY,
    size VARCHAR(25),
    quantity INTEGER
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