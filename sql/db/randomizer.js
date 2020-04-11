const Faker = require("faker");

function generateRandomData(userContext, events, done) {
  // generate data with Faker:
  const number = faker.random.number({ min: 9000000, max: 10000000 });

  // continue with executing the scenario:
  return number();
}

module.exports = {
  generateRandomData
};