'use strict';

const faker = require("faker");

function generateRandomData(userContext, events, done) {
  // generate data with Faker:
  const number = faker.random.number({ min: 9000000, max: 10000000 }); 
  const url = `/products/${number}`;

  return url;
}


// function getRandomInt(min = 1, max = 10000000) {
//   min = Math.ceil(min);
//   max = Math.floor(max);
//   let x = Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
//   return x
// }
// // console.log(getRandomInt())
// // let x = 1;

console.log("calling script ", generateRandomData())

module.exports = {
  // getRandomInt,
  generateRandomData
};