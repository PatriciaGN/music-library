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
    } else {
      this.temperature += 1;
    }
  }

  down() {
    this.temperature -= 1;
  }
}

module.exports = Thermostat;
