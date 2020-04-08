const faker = require('faker');
const fs = require('fs');
const { PerformanceObserver, performance } = require('perf_hooks');

const t0 = performance.now();
let id = 1000012;
let finalProductId = 10000000;

//id,name,slogan,description,category,default_price
let wStream = fs.createWriteStream('csvFiles/generated-products.csv');

while (id <= finalProductId) {
    let name = faker.hacker.adjective() + " " + faker.hacker.noun();
    let slogan = faker.company.catchPhrase();
    let description = faker.lorem.sentence();
    let category = faker.random.arrayElement(["Kicks","Accessories","Skirt","Suit","Slacks","Shorts","Cap","Jacket","Pants","Heels","Socks","Backpack","Sunglasses","Dress","Shoes","Coat","Romper"]);
    let default_price = faker.random.number({ min: 1, max: 1023 });

    wStream.write(
        `${id},"${name}","${slogan}","${description}","${category}",${default_price}\n`
    );

    ++id;
};

const t1 = performance.now();
console.log('execution time (ms): ', t1 - t0);
console.log('execution time (min): ', (t1 - t0) / (60000));
