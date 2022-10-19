const sum = require('./add');
const mult = require('./multiply');

describe('add', () => {
  it('adds 2 and 2', () => {
    expect(sum(2, 2)).toBe(4);
  });

  it('adds 5 and 7', () => {
    expect(sum(5, 7)).toBe(12);
  });
});

describe('multiply', () => {
  it('multiplies 3 and 2', () => {
    expect(mult(3, 2)).toBe(6);
  });

  it('multiplies 5 and 5', () => {
    expect(mult(5, 5)).toBe(25);
  });
});
