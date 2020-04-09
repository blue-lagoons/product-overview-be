const express = require('express');
const app = express();
const port = 3000;
const dbMethods = require('./db/pgconfig');
const body = require('body-parser');

app.use(body.json());

app.get('api')

app.get('/products/list', (req, res) => {
    dbMethods.getProducts()
    .then(result => res.send(result))
    .catch((err) => err);
})

app.get('/products/:product_id', (req, res) => {
//   console.log("logging ====", req.params)
    dbMethods.getProduct(req.params.product_id)
      .then(result => res.send(result))
      .catch((err) => err);
});

app.get('/products/:product_id/styles', (req, res) => {
    dbMethods.getProductStyle(req.params.product_id)
    .then(result => res.send(result))
    .catch((err) => err)
});


app.listen(port, () => {
    console.log(`listening on port ${port}`);
});

// module.exports = {
//     app
// }