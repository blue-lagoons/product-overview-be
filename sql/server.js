require("newrelic");
const express = require('express');
const app = express();
const { obj } = require('./secret');
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
    console.log("james test === ", req.params.product_id);
    dbMethods.getProduct(req.params.product_id)
      .then(result => res.send(result))
      .catch((err) => err);
});

app.get('/products/:product_id/styles', (req, res) => {
    dbMethods.getProductStyle(req.params.product_id)
    .then(result => res.send(result))
    .catch((err) => {console.log("error 2 === ", err);})
});

app.listen(obj.port, () => {
    console.log(`listening on port ${obj.port}`);
});

// module.exports = {
//     app
// }