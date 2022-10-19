class Thermostat {
  constructor() {
    this.temperature = 20;
    this.powerSavingMode = true;
  }

  getTemperature() {
    return this.temperature;
  }

  up() {
    if (this.powerSavingMode === true && this.temperature >= 25) {
    } else if (this.powerSavingMode === false && this.temperature >= 32) {
    } else {
      this.temperature += 1;
    }
  }

  down() {
    this.temperature -= 1;
  }

  setPowerSavingMode(boolean) {
    this.powerSavingMode = boolean;
  }

  reset() {
    this.temperature = 20;
  }
}

module.exports = Thermostat;
