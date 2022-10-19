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

  describe('down', () => {
    it('should give a temperature of 21 when the method down is called', () => {
      thermostat.down();
      expect(thermostat.getTemperature()).toBe(21);
    });
  });

  describe('setPowerSavingMode', () => {
    it('powerSavingMode should be on as default and max temperature to 25', () => {
      for (let i = 0; i < 10; i++) {
        thermostat.up();
      }
      expect(thermostat.getTemperature()).toBe(25);
    });

    it('should set the powerSavingMode off and return 26 when used up', () => {
      thermostat.setPowerSavingMode(false);
      thermostat.up();
      expect(thermostat.getTemperature()).toBe(26);
    });

    it('should be able to go up to the max temperature as PWS off', () => {
      for (let i = 0; i < 10; i++) {
        thermostat.up();
      }
      expect(thermostat.getTemperature()).toBe(32);
    });
  });
});
