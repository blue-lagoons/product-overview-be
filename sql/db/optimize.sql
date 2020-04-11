\c productoverview;

-- products 
CREATE INDEX idx_products_id ON products(id);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_products_slogan ON products(slogan);
CREATE INDEX idx_products_description ON products(description);
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_default_price ON products(default_price);

-- FEATURES 
CREATE INDEX idx_features_id ON features(id);
CREATE INDEX idx_features_productId ON features(productId);
CREATE INDEX idx_features_feature ON features(feature);
CREATE INDEX idx_features_value ON features(value);

-- STYLES 
CREATE INDEX idx_styles_id ON styles(id);
CREATE INDEX idx_styles_productId ON styles(productId);
CREATE INDEX idx_styles_name ON styles(name);
CREATE INDEX idx_styles_sale_price ON styles(sale_price);
CREATE INDEX idx_styles_original_price ON styles(original_price);
CREATE INDEX idx_styles_default_style ON styles(default_style);

-- PHOTOS
CREATE INDEX idx_photos_id ON photos(id);
CREATE INDEX idx_photos_style_id ON photos(style_id);
CREATE INDEX idx_photos_url ON photos(url);
CREATE INDEX idx_photos_thumbnail_url ON photos(thumbnail_url);

-- SKUs
CREATE INDEX idx_skus_id ON skus(id);
CREATE INDEX idx_skus_styleId ON skus(styleId);
CREATE INDEX idx_skus_size ON skus(size);
CREATE INDEX idx_skus_quantity ON skus(quantity);