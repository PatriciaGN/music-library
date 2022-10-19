class ShoppingBasket {
  constructor(basket = []) {
    this.basket = basket;
    this.discount = 0;
  }

  addItem(candy) {
    this.basket.push(candy);
  }

  applyDiscount(discount) {
    this.discount = discount;
  }

  getTotalPrice() {
    let sum = 0;
    this.basket.map((item) => (sum += item.getPrice()));
    return sum - this.discount;
  }
}

module.exports = ShoppingBasket;
