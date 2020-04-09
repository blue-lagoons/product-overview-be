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
    pool.query(`select * from styles WHERE productid = ${productId} limit 6`)
    .then(data => {
        console.log("query success === ", data.rows)
        return data.rows;
    })
    .catch((err) => {console.log("error === ", err)})
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
