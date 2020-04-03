DROP DATABASE IF EXISTS productoverview;

CREATE DATABASE productoverview;

\c productoverview;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name text,
    slogan text,
    description text,
    category text,
    default_price INTEGER
);
-- /Users/mmorahan/Desktop/SDC/Data-CSV-files/products.csv
-- * answer! 
-- psql -U postgres -f '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/sql/schema.sql'
-- psql -U postgres -d productoverview -a -f '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/sql/schema.sql'
\COPY products FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/products.csv' DELIMITER ',' CSV HEADER;


-- CREATE TABLE features (
--     id SERIAL PRIMARY KEY,
--     product_id INTEGER FOREIGN KEY,
--     feature VARCHAR(100),
--     value VARCHAR(100),
-- )

-- CREATE TABLE styles (
--     id SERIAL PRIMARY KEY,
--     product_id INTEGER FOREIGN KEY,
--     name VARCHAR(100),
--     sale_price INTEGER,
--     original_price INTEGER,
--     default_style VARCHAR(100)
-- )

-- CREATE TABLE photos (
--     id SERIAL PRIMARY KEY,
--     style_id INTEGER FOREIGN KEY,
--     url VARCHAR(150)
-- )

-- CREATE TABLE skus (
--     id SERIAL PRIMARY KEY,
--     style_id INTEGER FOREIGN KEY,
--     size VARCHAR(25),
--     quantity INTEGER
-- )


