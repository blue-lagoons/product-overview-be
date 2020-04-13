const Faker = require("faker");

function generateRandomData(userContext, events, done) {
  // generate data with Faker:
  const number = faker.random.number({ min: 9000000, max: 10000000 });

  // continue with executing the scenario:
  return number();
}

function getRandomInt(min, max) {
  min = Math.ceil(1);
  max = Math.floor(10000000);
  return Math.floor(Math.random() * (10000000 - 1)) + 1; //The maximum is exclusive and the minimum is inclusive
}


module.exports = {
  getRandomInt
};