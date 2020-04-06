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
\COPY products FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/products.csv' DELIMITER ',' CSV HEADER;
\COPY products FROM '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-products.csv' DELIMITER ',' CSV HEADER;

--  ===== Product Data ======
-- /Users/mmorahan/Desktop/SDC/Data-CSV-files/products.csv
-- /Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-products.csv

-- ==== How to run schema.sql and write to PSQL * answer = line 21! 
-- psql -U postgres -f '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/sql/schema.sql'
-- psql -U postgres -d productoverview -a -f '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/sql/schema.sql'


CREATE TABLE features (
    id SERIAL PRIMARY KEY,
    productId INTEGER,
    feature TEXT,
    value TEXT
);
\COPY features FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/features.csv' DELIMITER ',' CSV HEADER;
\COPY features FROM '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-features.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE styles (
    id SERIAL PRIMARY KEY,
    productId INTEGER,
    name TEXT,
    sale_price INTEGER,
    original_price INTEGER,
    default_style TEXT
);
\COPY styles FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/styles.csv' DELIMITER ',' CSV HEADER;
\COPY styles FROM '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-styles.csv' DELIMITER ',' CSV HEADER;

-- id,styleId,url,thumbnail_url
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    style_id INTEGER,
    url text,
    thumbnail_url text

);
\COPY photos FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/samplePhotos.csv' DELIMITER ',' CSV HEADER;



CREATE TABLE skus (
    id SERIAL PRIMARY KEY,
    styleId INTEGER,
    size TEXT,
    quantity INTEGER
);
\COPY skus FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/skus.csv' DELIMITER ',' CSV HEADER;
\COPY skus FROM '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-skus.csv' DELIMITER ',' CSV HEADER;
