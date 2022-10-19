class ShoppingBasket {
  constructor(basket = []) {
    this.basket = basket;
  }

  addItem(candy) {
    this.basket.push(candy);
  }
  getTotalPrice() {
    let sum = 0;
    this.basket.map((item) => (sum += item.getPrice()));
    return sum;
  }
}

module.exports = ShoppingBasket;
