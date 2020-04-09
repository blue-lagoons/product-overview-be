const { Pool } = require('pg');
const pool = new Pool({
    database: 'productoverview',
    user: 'postgres',
    password: '1234'
});


function getProducts(){
    return pool.query('select * from products limit 10')
    .then(data => {
        return data.rows;
    })
}

function getProduct(id){
    return (
      pool.query(`select * from products WHERE id = ${id}`)
        .then(data => {
            return data.rows;
        })
        .catch((err) => err)
    );
}

function getProductStyle(productId){
  return ( 
    pool.query(`select * from styles WHERE product_id = ${productId}`)
        .then(data => {
            return data.results;
        })
        .catch((err) => err)
  )
}



module.exports = {
  getProducts,
  getProduct,
  getProductStyle
};

    // getCart,
    // addToCart,
    // logInteraction,
    // getProductStyle