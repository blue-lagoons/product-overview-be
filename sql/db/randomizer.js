const Faker = require("faker");

function generateRandomData(userContext, events, done) {
  // generate data with Faker:
  const number = faker.random.number({ min: 9000000, max: 10000000 });
  
  // continue with executing the scenario:
  return number();
}

// function getRandomInt(min, max) {
//   min = Math.ceil(min);
//   max = Math.floor(max);
//   return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
// }
// getRandomInt(1, 10000000);

module.exports = {
  // getRandomInt
  generateRandomData
};