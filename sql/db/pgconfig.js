const { Pool } = require('pg');
const pool = new Pool({
    database: 'productoverview',
    user: 'postgres',
    password: '1234'
});

function getProduct(){
    return pool.query('select * from products limit 1')
      .then(data => {
          return data.rows;
      })
}

function getProducts(){
    return pool.query('select * from products limit 10')
      .then(data => {
          return data.rows;
      })
}

module.exports = {
  getProducts,
  getProduct,
};

    // getCart,
    // addToCart,
    // logInteraction,
    // getProduct,
    // getProductStyle