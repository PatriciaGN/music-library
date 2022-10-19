const { describe, it } = require('node:test');
const Thermostat = require('./thermostat');

describe('Thermostat', () => {
  const thermostat = new Thermostat();
  describe('getTemperature', () => {
    it('starts with a temperature of 20 degrees', () => {
      expect(thermostat.getTemperature()).toBe(20);
    });
  });
});
