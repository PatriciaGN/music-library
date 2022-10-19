// const { describe, it } = require('node:test');
const Thermostat = require('./thermostat');

describe('Thermostat', () => {
  const thermostat = new Thermostat();
  describe('getTemperature', () => {
    it('starts with a temperature of 20 degrees', () => {
      expect(thermostat.getTemperature()).toBe(20);
    });
  });

  describe('up', () => {
    it('should give a temperature of 22 when the up method has been called twice', () => {
      thermostat.up();
      thermostat.up();
      expect(thermostat.getTemperature()).toBe(22);
    });
  });
});
