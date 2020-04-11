DROP DATABASE IF EXISTS productoverview;

CREATE DATABASE productoverview;

\c productoverview;


-- ========= Product Data =========
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

-- Create Indexes
CREATE INDEX idx_products_id ON products(id);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_products_slogan ON products(slogan);
CREATE INDEX idx_products_description ON products(description);
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_default_price ON products(default_price);


-- ========= FEATURES =========
CREATE TABLE features (
    id SERIAL PRIMARY KEY,
    productId INTEGER,
    feature TEXT,
    value TEXT
);
\COPY features FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/features.csv' DELIMITER ',' CSV HEADER;
\COPY features FROM '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-features.csv' DELIMITER ',' CSV HEADER;

-- Create Indexes
CREATE INDEX idx_features_id ON features(id);
CREATE INDEX idx_features_productId ON features(productId);
CREATE INDEX idx_features_feature ON features(feature);
CREATE INDEX idx_features_value ON features(value);


-- ========= STYLES ========
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

-- Create Indexes
CREATE INDEX idx_styles_id ON styles(id);
CREATE INDEX idx_styles_productId ON styles(productId);
CREATE INDEX idx_styles_name ON styles(name);
CREATE INDEX idx_styles_sale_price ON styles(sale_price);
CREATE INDEX idx_styles_original_price ON styles(original_price);
CREATE INDEX idx_styles_default_style ON styles(default_style);


-- ========= PHOTOS ==========
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    style_id INTEGER,
    url text,
    thumbnail_url text
);
\COPY photos FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/samplePhotos.csv' DELIMITER ',' CSV HEADER;

-- Create Indexes
CREATE INDEX idx_photos_id ON photos(id);
CREATE INDEX idx_photos_style_id ON photos(style_id);
CREATE INDEX idx_photos_url ON photos(url);
CREATE INDEX idx_photos_thumbnail_url ON photos(thumbnail_url);


-- ========= SKUS =========
CREATE TABLE skus (
    id SERIAL PRIMARY KEY,
    styleId INTEGER,
    size TEXT,
    quantity INTEGER
);
\COPY skus FROM '/Users/mmorahan/Desktop/SDC/Data-CSV-files/skus.csv' DELIMITER ',' CSV HEADER;
\COPY skus FROM '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/csvFiles/generated-skus.csv' DELIMITER ',' CSV HEADER;

-- Create Indexes
CREATE INDEX idx_skus_id ON skus(id);
CREATE INDEX idx_skus_styleId ON skus(styleId);
CREATE INDEX idx_skus_size ON skus(size);
CREATE INDEX idx_skus_quantity ON skus(quantity);

-- ==== How to run schema.sql and write to PSQL * answer = line 21! 
-- psql -U postgres -f '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/sql/schema.sql'
-- psql -U postgres -d productoverview -a -f '/Users/mmorahan/Desktop/SDC/Repos/product-overview-be/sql/schema.sql'
