const ShoppingBasket = require('./shoppingBasket');

describe('shoppingBasket', () => {
  afterEach(() => {});
  const basket = new ShoppingBasket();
  const candyDouble = { getName: () => 'Mars', getPrice: () => 4.99 };
  const candyDouble2 = { getName: () => 'Skittle', getPrice: () => 3.99 };

  describe('getTotalPrice', () => {
    it('gives 0 if no candies added to the basket', () => {
      expect(basket.getTotalPrice()).toBe(0);
    });

    it('gives 4.99 if Mars have been added to the basket', () => {
      basket.addItem(candyDouble);
      expect(basket.getTotalPrice()).toBe(4.99);
    });

    it('gives 12.97 if a Mars and two Skittles have been added to the basket', () => {
      basket.addItem(candyDouble2);
      basket.addItem(candyDouble2);
      expect(basket.getTotalPrice()).toBeCloseTo(12.97);
    });

    it('Gives 16.97 if a 99p discount has been applied to the basket', () => {
      basket.addItem(candyDouble);
      basket.applyDiscount(0.99);
      expect(basket.getTotalPrice()).toBeCloseTo(16.97);
    });
  });
});
