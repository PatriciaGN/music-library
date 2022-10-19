const isOddIsEven = (number) => {
  if (number % 2 != 0) {
    return `${number} is odd`;
  } else {
    return `${number} is even`;
  }
};

for (let i = 1; i <= 20; i++) {
  console.log(isOddIsEven(i));
}

module.exports = isOddIsEven;
