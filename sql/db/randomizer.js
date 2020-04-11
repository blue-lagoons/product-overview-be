const Faker = require("faker");

function generateRandomData(userContext, events, done) {
  // generate data with Faker:
  const number = faker.random.number({ min: 1, max: 10000000 });

  // add variables to virtual user's context:
  userContext.vars.number = number;
  // continue with executing the scenario:
  return done();
}

module.exports = {
  generateRandomData
};