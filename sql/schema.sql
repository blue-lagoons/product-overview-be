DROP DATABASE IF EXISTS productoverview;

CREATE DATABASE productoverview;

\c productoverview;

--check 2
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

--check 2
CREATE TABLE features (
    id SERIAL PRIMARY KEY,
    productId INTEGER,
    feature TEXT,
    value TEXT
);
\COPY features FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/features.csv' DELIMITER ',' CSV HEADER;

-- check
CREATE TABLE styles (
    id SERIAL PRIMARY KEY,
    productId INTEGER,
    name TEXT,
    sale_price INTEGER,
    original_price INTEGER,
    default_style TEXT
);
\COPY styles FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/styles.csv' DELIMITER ',' CSV HEADER;

-- check
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    style_id INTEGER,
    url text,
    thumbnail_url text

);
\COPY photos FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/photos.csv' DELIMITER ',' CSV HEADER;

-- check
CREATE TABLE skus (
    id SERIAL PRIMARY KEY,
    styleId INTEGER,
    size TEXT,
    quantity INTEGER
);
\COPY skus FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/skus.csv' DELIMITER ',' CSV HEADER;
