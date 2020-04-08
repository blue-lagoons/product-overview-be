const faker = require('faker');
const fs = require('fs');
const { PerformanceObserver, performance } = require('perf_hooks');

const t0 = performance.now();
let id = 4660355;
let productId = 1000012;
let finalProductId = 10000000;

// id,productId,name,sale_price,original_price,default_style

let wStream = fs.createWriteStream('csvFiles/generated-styles.csv');

while (productId <= finalProductId) {
    let name = faker.random.arrayElement(["Red", "Orange", "Yellow", "Green", "Forest Green", "Lime Green", "Fusia", "Blue", "Ocean Blue", "Gold", "Indigo", "Violet", "Black", "Grey", "Tan", "Brown", "Maroon", "White", "Olive Green", "Money Green", "Plant Green", "Desert Brown", "Blue Sky", "Sky Blue"]);
    let sale_price = faker.random.number({ min: 1, max: 123 });
    let original_price = faker.random.number({ min: 2, max: 1023 });
    let default_style = faker.random.number({ min: 1, max: 1023 });

    wStream.write(
        `${id},"${productId}","${name}","${sale_price}","${original_price}","${default_style}"\n`
    );
    ++id;
    ++productId;
};

const t1 = performance.now();
console.log('execution time (ms): ', t1 - t0);
console.log('execution time (sec): ', (t1 -t0) / 1000)
console.log('execution time (min): ', (t1 - t0) / (60000));
