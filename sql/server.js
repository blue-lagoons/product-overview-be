require("newrelic");
// const dotenv = require("dotenv");
// const myEnv = dotenv.config();
// console.log("my ENV ==== ", process.env);
const express = require('express');
const app = express();
const {key} = require("./secret.js")
const {port} = require("./secret.js")
console.log("secrets === ", port)
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
    dbMethods.getProduct(req.params.product_id)
      .then(result => res.send(result))
      .catch((err) => err);
});

app.get('/products/:product_id/styles', (req, res) => {
    dbMethods.getProductStyle(req.params.product_id)
    .then(result => res.send(result))
    .catch((err) => {console.log("error 2 === ", err);})
});

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});

// module.exports = {
//     app
// }