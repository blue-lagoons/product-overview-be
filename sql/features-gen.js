const faker = require('faker');
const fs = require('fs');
const { PerformanceObserver, performance } = require('perf_hooks');

const t0 = performance.now();
let id = 2218659;
let productId = 1000012;
let finalProductId = 10000000;

// id, productId, feature, value
let wStream = fs.createWriteStream('csvFiles/generated-features.csv');

while (productId <= finalProductId) {
    // let num = faker.random.number({ min: 1, max: 3 });
    let num = 1;
    for (let i = 0; i < num; i++){
        let feature = faker.hacker.adjective();
        let value = faker.hacker.noun();
    
        wStream.write(
            `${id},"${productId}","${feature}","${value}"\n`
        );
        id++;
    }
    productId++;
};

const t1 = performance.now();
console.log('execution time (ms): ', t1 - t0);
console.log('execution time (min): ', (t1 - t0) / (60000));
