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
    .catch(err => console.log(err));
})

app.get('/products', (req, res) => {
    dbMethods.Methods.getProduct(req)
    .then(result => res.send(result))
    .catch((err) => console.log(err))
})


app.listen(port, () => {
    console.log(`listening on port ${port}`);
});

// module.exports = {
//     app
// }