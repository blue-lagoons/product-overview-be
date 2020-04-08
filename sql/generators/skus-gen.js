const faker = require('faker');
const fs = require('fs');
const { PerformanceObserver, performance } = require('perf_hooks');

const t0 = performance.now();
let id = 26961740;
let styleId = 4660354;
let finalFeatureId = 10000000;

// id, styleId, size, quantity
let wStream = fs.createWriteStream('csvFiles/generated-skus.csv');

while (styleId <= finalFeatureId) {
    let value = faker.random.number({ min: 0, max: 50 });
    // possible sizes: XS,S,M,L,XL,XXL
    wStream.write(
        `${id},"${styleId}","XS","${value}"\n${id+1},"${styleId}","S","${value}"\n${id+2},"${styleId}","M","${value}"\n${id+3},"${styleId}","L","${value}"\n${id+4},"${styleId}","XL","${value}"\n${id+5},"${styleId}","XXL","${value}"\n`
    );
    id += 6;
    ++styleId;
};

const t1 = performance.now();
console.log('execution time (ms): ', t1 - t0);
console.log('execution time (min): ', (t1 - t0) / (60000));
